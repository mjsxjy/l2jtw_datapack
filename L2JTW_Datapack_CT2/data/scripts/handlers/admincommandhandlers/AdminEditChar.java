/*
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU General Public License along with
 * this program. If not, see <http://www.gnu.org/licenses/>.
 */
package handlers.admincommandhandlers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.logging.Logger;

import net.sf.l2j.Config;
import net.sf.l2j.L2DatabaseFactory;
import net.sf.l2j.gameserver.ai.CtrlIntention;
import net.sf.l2j.gameserver.communitybbs.Manager.RegionBBSManager;
import net.sf.l2j.gameserver.datatables.ClanTable;
import net.sf.l2j.gameserver.handler.IAdminCommandHandler;
import net.sf.l2j.gameserver.model.L2Object;
import net.sf.l2j.gameserver.model.L2World;
import net.sf.l2j.gameserver.model.actor.instance.L2PcInstance;
import net.sf.l2j.gameserver.model.actor.instance.L2PetInstance;
import net.sf.l2j.gameserver.model.base.ClassId;
import net.sf.l2j.gameserver.network.L2GameClient;
import net.sf.l2j.gameserver.network.SystemMessageId;
import net.sf.l2j.gameserver.network.serverpackets.CharInfo;
import net.sf.l2j.gameserver.network.serverpackets.ExBrExtraUserInfo;
import net.sf.l2j.gameserver.network.serverpackets.NpcHtmlMessage;
import net.sf.l2j.gameserver.network.serverpackets.PartySmallWindowAll;
import net.sf.l2j.gameserver.network.serverpackets.PartySmallWindowDeleteAll;
import net.sf.l2j.gameserver.network.serverpackets.SetSummonRemainTime;
import net.sf.l2j.gameserver.network.serverpackets.StatusUpdate;
import net.sf.l2j.gameserver.network.serverpackets.SystemMessage;
import net.sf.l2j.gameserver.network.serverpackets.UserInfo;
import net.sf.l2j.gameserver.util.StringUtil;
import net.sf.l2j.gameserver.util.Util;
import net.sf.l2j.gameserver.datatables.MessageTable;
import net.sf.l2j.gameserver.model.L2CoreMessage;

/**
 * This class handles following admin commands:
 * - edit_character
 * - current_player
 * - character_list
 * - show_characters
 * - find_character
 * - find_ip
 * - find_account
 * - rec
 * - nokarma
 * - setkarma
 * - settitle
 * - changename
 * - setsex
 * - setclass
 * - fullfood
 * - save_modifications
 *
 * @version $Revision: 1.3.2.1.2.10 $ $Date: 2005/04/11 10:06:06 $
 */
public class AdminEditChar implements IAdminCommandHandler
{
	private static Logger _log = Logger.getLogger(AdminEditChar.class.getName());
	
	private static final String[] ADMIN_COMMANDS =
	{
		"admin_edit_character", "admin_current_player", "admin_nokarma", // this is to remove karma from selected char...
		"admin_setkarma", // sets karma of target char to any amount. //setkarma <karma>
		"admin_setfame", // sets fame of target char to any amount. //setfame <fame>
		"admin_character_list", //same as character_info, kept for compatibility purposes
		"admin_character_info", //given a player name, displays an information window
		"admin_show_characters",//list of characters
		"admin_find_character", //find a player by his name or a part of it (case-insensitive)
		"admin_find_ip", // find all the player connections from a given IPv4 number
		"admin_find_account", //list all the characters from an account (useful for GMs w/o DB access)
		"admin_find_dualbox", //list all the IPs with more than 1 char logged in (dualbox)
		"admin_save_modifications", //consider it deprecated...
		"admin_rec", // gives recommendation points
		"admin_settitle", // changes char title
		"admin_changename", // changes char name
		"admin_setsex", // changes characters' sex
		"admin_setcolor", // change charnames' color display
		"admin_setclass", // changes chars' classId
		"admin_fullfood", // fulfills a pet's food bar
		"admin_remove_clan_penalty" // removes clan penalties
	};
	
	public boolean useAdminCommand(String command, L2PcInstance activeChar)
	{
		if (command.equals("admin_current_player"))
		{
			showCharacterInfo(activeChar, null);
		}
		else if ((command.startsWith("admin_character_list")) || (command.startsWith("admin_character_info")))
		{
			try
			{
				String val = command.substring(21);
				L2PcInstance target = L2World.getInstance().getPlayer(val);
				if (target != null)
					showCharacterInfo(activeChar, target);
				else
					activeChar.sendPacket(new SystemMessage(SystemMessageId.CHARACTER_DOES_NOT_EXIST));
			}
			catch (StringIndexOutOfBoundsException e)
			{
				activeChar.sendMessage(385);
			}
		}
		else if (command.startsWith("admin_show_characters"))
		{
			try
			{
				String val = command.substring(22);
				int page = Integer.parseInt(val);
				listCharacters(activeChar, page);
			}
			catch (StringIndexOutOfBoundsException e)
			{
				//Case of empty page number
				activeChar.sendMessage(421);
			}
		}
		else if (command.startsWith("admin_find_character"))
		{
			try
			{
				String val = command.substring(21);
				findCharacter(activeChar, val);
			}
			catch (StringIndexOutOfBoundsException e)
			{ //Case of empty character name
				activeChar.sendMessage(392);
				listCharacters(activeChar, 0);
			}
		}
		else if (command.startsWith("admin_find_ip"))
		{
			try
			{
				String val = command.substring(14);
				findCharactersPerIp(activeChar, val);
			}
			catch (Exception e)
			{ //Case of empty or malformed IP number
				activeChar.sendMessage(393);
				listCharacters(activeChar, 0);
			}
		}
		else if (command.startsWith("admin_find_account"))
		{
			try
			{
				String val = command.substring(19);
				findCharactersPerAccount(activeChar, val);
			}
			catch (Exception e)
			{ //Case of empty or malformed player name
				activeChar.sendMessage(391);
				listCharacters(activeChar, 0);
			}
		}
		else if (command.equals("admin_edit_character"))
			editCharacter(activeChar);
		// Karma control commands
		else if (command.equals("admin_nokarma"))
			setTargetKarma(activeChar, 0);
		else if (command.startsWith("admin_setkarma"))
		{
			try
			{
				String val = command.substring(15);
				int karma = Integer.parseInt(val);
				setTargetKarma(activeChar, karma);
			}
			catch (Exception e)
			{
				if (Config.DEVELOPER)
					_log.warning("Set karma error: " + e);
				activeChar.sendMessage(419);
			}
		}
		else if (command.startsWith("admin_setfame"))
		{
			try
			{
				String val = command.substring(14);
				int fame = Integer.parseInt(val);
				L2Object target = activeChar.getTarget();
				if (target instanceof L2PcInstance)
				{
					L2PcInstance player = (L2PcInstance) target;
					player.setFame(fame);
					player.sendPacket(new UserInfo(player));
					player.sendPacket(new ExBrExtraUserInfo(player));
					player.sendMessage("A GM changed your Reputation points to " + fame);
				}
				else
				{
					activeChar.sendPacket(new SystemMessage(SystemMessageId.INCORRECT_TARGET));
				}
			}
			catch (Exception e)
			{
				if (Config.DEVELOPER)
					_log.warning("Set Fame error: " + e);
				activeChar.sendMessage("Usage: //setfame <new_fame_value>");
			}
		}
		else if (command.startsWith("admin_save_modifications"))
		{
			try
			{
				String val = command.substring(24);
				adminModifyCharacter(activeChar, val);
			}
			catch (StringIndexOutOfBoundsException e)
			{ //Case of empty character name
				activeChar.sendMessage(113);
				listCharacters(activeChar, 0);
			}
		}
		else if (command.startsWith("admin_rec"))
		{
			try
			{
				String val = command.substring(10);
				int recVal = Integer.parseInt(val);
				L2Object target = activeChar.getTarget();
				L2PcInstance player = null;
				if (target instanceof L2PcInstance)
				{
					player = (L2PcInstance) target;
				}
				else
				{
					return false;
				}
				player.setRecomHave(recVal);
				player.sendMessage(528);
				player.broadcastUserInfo();
			}
			catch (Exception e)
			{
				activeChar.sendMessage(414);
			}
		}
		else if (command.startsWith("admin_setclass"))
		{
			try
			{
				String val = command.substring(15);
				int classidval = Integer.parseInt(val);
				L2Object target = activeChar.getTarget();
				L2PcInstance player = null;
				if (target instanceof L2PcInstance)
					player = (L2PcInstance) target;
				else
					return false;
				boolean valid = false;
				for (ClassId classid : ClassId.values())
					if (classidval == classid.getId())
						valid = true;
				if (valid && (player.getClassId().getId() != classidval))
				{
					player.setClassId(classidval);
					if (!player.isSubClassActive())
						player.setBaseClass(classidval);
					String newclass = player.getTemplate().className;
					player.store();
					L2CoreMessage cm =  new L2CoreMessage (MessageTable.Messages[14]);
					cm.addString(newclass);
					cm.sendMessage(player);
					player.broadcastUserInfo();
					cm =  new L2CoreMessage (MessageTable.Messages[670]);
					cm.addString(player.getName());
					cm.addString(newclass);
					cm.sendMessage(activeChar);
				}
				activeChar.sendMessage(418);
			}
			catch (StringIndexOutOfBoundsException e)
			{
				AdminHelpPage.showHelpPage(activeChar, "charclasses.htm");
			}
		}
		else if (command.startsWith("admin_settitle"))
		{
			try
			{
				String val = command.substring(15);
				L2Object target = activeChar.getTarget();
				L2PcInstance player = null;
				if (target instanceof L2PcInstance)
				{
					player = (L2PcInstance) target;
				}
				else
				{
					return false;
				}
				player.setTitle(val);
				player.sendMessage(644);
				player.broadcastTitleInfo();
			}
			catch (StringIndexOutOfBoundsException e)
			{ //Case of empty character title
				activeChar.sendMessage(584);
			}
		}
		else if (command.startsWith("admin_changename"))
		{
			try
			{
				String val = command.substring(17);
				L2Object target = activeChar.getTarget();
				L2PcInstance player = null;
				if (target instanceof L2PcInstance)
				{
					player = (L2PcInstance) target;
				}
				else
				{
					return false;
				}
				L2World.getInstance().removeFromAllPlayers(player);
				player.setName(val);
				player.store();
				L2World.getInstance().addToAllPlayers(player);
				
				player.sendMessage(623);
				player.broadcastUserInfo();
				
				if (player.isInParty())
				{
					// Delete party window for other party members
					player.getParty().broadcastToPartyMembers(player, new PartySmallWindowDeleteAll());
					for (L2PcInstance member : player.getParty().getPartyMembers())
					{
						// And re-add
						if (member != player)
							member.sendPacket(new PartySmallWindowAll(member, player.getParty()));
					}
				}
				if (player.getClan() != null)
				{
					player.getClan().broadcastClanStatus();
				}
				
				RegionBBSManager.getInstance().changeCommunityBoard();
			}
			catch (StringIndexOutOfBoundsException e)
			{ //Case of empty character name
				activeChar.sendMessage(420);
			}
		}
		else if (command.startsWith("admin_setsex"))
		{
			L2Object target = activeChar.getTarget();
			L2PcInstance player = null;
			if (target instanceof L2PcInstance)
			{
				player = (L2PcInstance) target;
			}
			else
			{
				return false;
			}
			player.getAppearance().setSex(player.getAppearance().getSex() ? false : true);
			player.sendMessage(621);
			player.broadcastUserInfo();
			player.decayMe();
			player.spawnMe(player.getX(), player.getY(), player.getZ());
		}
		else if (command.startsWith("admin_setcolor"))
		{
			try
			{
				String val = command.substring(15);
				L2Object target = activeChar.getTarget();
				L2PcInstance player = null;
				if (target instanceof L2PcInstance)
				{
					player = (L2PcInstance) target;
				}
				else
				{
					return false;
				}
				player.getAppearance().setNameColor(Integer.decode("0x" + val));
				player.sendMessage(622);
				player.broadcastUserInfo();
			}
			catch (Exception e)
			{ //Case of empty color or invalid hex string
				activeChar.sendMessage(583);
			}
		}
		else if (command.startsWith("admin_fullfood"))
		{
			L2Object target = activeChar.getTarget();
			if (target instanceof L2PetInstance)
			{
				L2PetInstance targetPet = (L2PetInstance) target;
				targetPet.setCurrentFed(targetPet.getMaxFed());
				targetPet.getOwner().sendPacket(new SetSummonRemainTime(targetPet.getMaxFed(), targetPet.getCurrentFed()));
			}
			else
				activeChar.sendPacket(new SystemMessage(SystemMessageId.INCORRECT_TARGET));
		}
		else if(command.startsWith("admin_unpenalty"))
		{
			try 
			{
				StringTokenizer st = new StringTokenizer(command, " ");
				if (st.countTokens() != 3)
				{
					activeChar.sendMessage("Usage: //unpenalty join|create charname");
					return false;
				}

				st.nextToken();

				boolean changeCreateExpiryTime = st.nextToken().equalsIgnoreCase("create");

				String playerName = st.nextToken();
				L2PcInstance player = null;
				player = L2World.getInstance().getPlayer(playerName);
				
				if (player == null)
				{
					Connection con = L2DatabaseFactory.getInstance().getConnection();
					PreparedStatement ps = con.prepareStatement("UPDATE characters SET "
							+ (changeCreateExpiryTime ? "clan_create_expiry_time" : "clan_join_expiry_time") 
							+ " WHERE char_name=? LIMIT 1");
					
					ps.setString(1, playerName);
					ps.execute();
				}
				else
				{
					// removing penalty
					if (changeCreateExpiryTime)
						player.setClanCreateExpiryTime(0);
					else
						player.setClanJoinExpiryTime(0);
				}

				
				activeChar.sendMessage("Clan penalty successfully removed to character: "+ playerName);
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
		else if (command.startsWith("admin_find_dualbox"))
		{
			int multibox = 2;
			try
			{
				String val = command.substring(19);
				multibox = Integer.parseInt(val);
				if (multibox < 1)
				{
					activeChar.sendMessage(97);
					return false;
				}
			}
			catch (Exception e)
			{
			}
			findDualbox(activeChar, multibox);
		}
		
		return true;
	}
	
	public String[] getAdminCommandList()
	{
		return ADMIN_COMMANDS;
	}
	
	private void listCharacters(L2PcInstance activeChar, int page)
	{
		Collection<L2PcInstance> allPlayers = L2World.getInstance().getAllPlayers().values();
		L2PcInstance[] players;
		//synchronized (L2World.getInstance().getAllPlayers())
		{
			players = allPlayers.toArray(new L2PcInstance[allPlayers.size()]);
		}
		
		int maxCharactersPerPage = 20;
		int maxPages = players.length / maxCharactersPerPage;
		
		if (players.length > maxCharactersPerPage * maxPages)
			maxPages++;
		
		//Check if number of users changed
		if (page > maxPages)
			page = maxPages;
		
		int charactersStart = maxCharactersPerPage * page;
		int charactersEnd = players.length;
		if (charactersEnd - charactersStart > maxCharactersPerPage)
			charactersEnd = charactersStart + maxCharactersPerPage;
		
		NpcHtmlMessage adminReply = new NpcHtmlMessage(5);
		adminReply.setFile("data/html/admin/charlist.htm");

                final StringBuilder replyMSG = new StringBuilder(1000);

                for (int x = 0; x < maxPages; x++) {
			int pagenr = x + 1;
                        StringUtil.append(replyMSG,
                                "<center><a action=\"bypass -h admin_show_characters " + x + "\">"+ MessageTable.Messages[677].getMessage() + pagenr +MessageTable.Messages[215].getMessage()+"</a></center>");
		}
                
		adminReply.replace("%pages%", replyMSG.toString());
		replyMSG.setLength(0);
                
		for (int i = charactersStart; i < charactersEnd; i++) {
                    //Add player info into new Table row
                    StringUtil.append(replyMSG,
                            "<tr><td width=80><a action=\"bypass -h admin_character_info ",
                            players[i].getName(),
                            "\">",
                            players[i].getName(),
                            "</a></td><td width=110>",
                            players[i].getTemplate().className,
                            "</td><td width=40>",
                            String.valueOf(players[i].getLevel())
                            ,"</td></tr>");
		}
                
		adminReply.replace("%players%", replyMSG.toString());
		activeChar.sendPacket(adminReply);
	}
	
	private void showCharacterInfo(L2PcInstance activeChar, L2PcInstance player)
	{
		if (player == null)
		{
			L2Object target = activeChar.getTarget();
			if (target instanceof L2PcInstance)
				player = (L2PcInstance) target;
			else
				return;
		}
		else
			activeChar.setTarget(player);
		gatherCharacterInfo(activeChar, player, "charinfo.htm");
	}
	
	/**
	 * @param activeChar
	 * @param player
	 */
	private void gatherCharacterInfo(L2PcInstance activeChar, L2PcInstance player, String filename)
	{
		String ip = "N/A";
		String account = "N/A";
		try
		{
			String clientInfo = player.getClient().toString();
			account = clientInfo.substring(clientInfo.indexOf("Account: ")+9, clientInfo.indexOf(" - IP: "));
			ip = clientInfo.substring(clientInfo.indexOf(" - IP: ")+7,clientInfo.lastIndexOf("]"));
		}
		catch (Exception e)
		{
		}
		NpcHtmlMessage adminReply = new NpcHtmlMessage(5);
		adminReply.setFile("data/html/admin/" + filename);
		adminReply.replace("%name%", player.getName());
		adminReply.replace("%level%", String.valueOf(player.getLevel()));
		adminReply.replace("%clan%", String.valueOf(ClanTable.getInstance().getClan(player.getClanId())));
		adminReply.replace("%xp%", String.valueOf(player.getExp()));
		adminReply.replace("%sp%", String.valueOf(player.getSp()));
		adminReply.replace("%class%", player.getTemplate().className);
		adminReply.replace("%ordinal%", String.valueOf(player.getClassId().ordinal()));
		adminReply.replace("%classid%", String.valueOf(player.getClassId()));
		adminReply.replace("%x%", String.valueOf(player.getX()));
		adminReply.replace("%y%", String.valueOf(player.getY()));
		adminReply.replace("%z%", String.valueOf(player.getZ()));
		adminReply.replace("%currenthp%", String.valueOf((int) player.getCurrentHp()));
		adminReply.replace("%maxhp%", String.valueOf(player.getMaxHp()));
		adminReply.replace("%karma%", String.valueOf(player.getKarma()));
		adminReply.replace("%currentmp%", String.valueOf((int) player.getCurrentMp()));
		adminReply.replace("%maxmp%", String.valueOf(player.getMaxMp()));
		adminReply.replace("%pvpflag%", String.valueOf(player.getPvpFlag()));
		adminReply.replace("%currentcp%", String.valueOf((int) player.getCurrentCp()));
		adminReply.replace("%maxcp%", String.valueOf(player.getMaxCp()));
		adminReply.replace("%pvpkills%", String.valueOf(player.getPvpKills()));
		adminReply.replace("%pkkills%", String.valueOf(player.getPkKills()));
		adminReply.replace("%currentload%", String.valueOf(player.getCurrentLoad()));
		adminReply.replace("%maxload%", String.valueOf(player.getMaxLoad()));
		adminReply.replace("%percent%", String.valueOf(Util.roundTo(((float) player.getCurrentLoad() / (float) player.getMaxLoad()) * 100, 2)));
		adminReply.replace("%patk%", String.valueOf(player.getPAtk(null)));
		adminReply.replace("%matk%", String.valueOf(player.getMAtk(null, null)));
		adminReply.replace("%pdef%", String.valueOf(player.getPDef(null)));
		adminReply.replace("%mdef%", String.valueOf(player.getMDef(null, null)));
		adminReply.replace("%accuracy%", String.valueOf(player.getAccuracy()));
		adminReply.replace("%evasion%", String.valueOf(player.getEvasionRate(null)));
		adminReply.replace("%critical%", String.valueOf(player.getCriticalHit(null, null)));
		adminReply.replace("%runspeed%", String.valueOf(player.getRunSpeed()));
		adminReply.replace("%patkspd%", String.valueOf(player.getPAtkSpd()));
		adminReply.replace("%matkspd%", String.valueOf(player.getMAtkSpd()));
		adminReply.replace("%access%", String.valueOf(player.getAccessLevel().getLevel()));
		adminReply.replace("%account%", account);
		adminReply.replace("%ip%", ip);
		activeChar.sendPacket(adminReply);
	}
	
	private void setTargetKarma(L2PcInstance activeChar, int newKarma)
	{
		// function to change karma of selected char
		L2Object target = activeChar.getTarget();
		L2PcInstance player = null;
		if (target instanceof L2PcInstance)
			player = (L2PcInstance) target;
		else
			return;
		
		if (newKarma >= 0)
		{
			// for display
			int oldKarma = player.getKarma();
			// update karma
			player.setKarma(newKarma);
			//Common character information
			player.sendPacket(new SystemMessage(SystemMessageId.YOUR_KARMA_HAS_BEEN_CHANGED_TO).addString(String.valueOf(newKarma)));
			//Admin information
			L2CoreMessage cm =  new L2CoreMessage (MessageTable.Messages[275]);
			cm.addString(player.getName());
			cm.addNumber(oldKarma);
			cm.addNumber(newKarma);
			cm.sendMessage(activeChar);			
			if (Config.DEBUG)
				_log.fine("[SET KARMA] [GM]" + activeChar.getName() + " Changed karma for " + player.getName() + " from (" + oldKarma + ") to (" + newKarma + ").");
		}
		else
		{
			// tell admin of mistake
			activeChar.sendMessage(569);
			if (Config.DEBUG)
				_log.fine("[SET KARMA] ERROR: [GM]" + activeChar.getName() + " entered an incorrect value for new karma: " + newKarma + " for " + player.getName() + ".");
		}
	}
	
	private void adminModifyCharacter(L2PcInstance activeChar, String modifications)
	{
		L2Object target = activeChar.getTarget();
		
		if (!(target instanceof L2PcInstance))
			return;
		
		L2PcInstance player = (L2PcInstance) target;
		StringTokenizer st = new StringTokenizer(modifications);
		
		if (st.countTokens() != 6)
		{
			editCharacter(player);
			return;
		}
		
		String hp = st.nextToken();
		String mp = st.nextToken();
		String cp = st.nextToken();
		String pvpflag = st.nextToken();
		String pvpkills = st.nextToken();
		String pkkills = st.nextToken();
		
		int hpval = Integer.parseInt(hp);
		int mpval = Integer.parseInt(mp);
		int cpval = Integer.parseInt(cp);
		int pvpflagval = Integer.parseInt(pvpflag);
		int pvpkillsval = Integer.parseInt(pvpkills);
		int pkkillsval = Integer.parseInt(pkkills);
		
		//Common character information
		L2CoreMessage cm =  new L2CoreMessage (MessageTable.Messages[30]);
		cm.addNumber(hpval);
		cm.addNumber(mpval);
		cm.addNumber(cpval);
		cm.addNumber(pvpflagval);
		cm.addNumber(pvpkillsval);
		cm.addNumber(pkkillsval);
		cm.sendMessage(player);
		player.setCurrentHp(hpval);
		player.setCurrentMp(mpval);
		player.setCurrentCp(cpval);
		player.setPvpFlag(pvpflagval);
		player.setPvpKills(pvpkillsval);
		player.setPkKills(pkkillsval);
		
		// Save the changed parameters to the database.
		player.store();
		
		StatusUpdate su = new StatusUpdate(player.getObjectId());
		su.addAttribute(StatusUpdate.CUR_HP, hpval);
		su.addAttribute(StatusUpdate.MAX_HP, player.getMaxHp());
		su.addAttribute(StatusUpdate.CUR_MP, mpval);
		su.addAttribute(StatusUpdate.MAX_MP, player.getMaxMp());
		su.addAttribute(StatusUpdate.CUR_CP, cpval);
		su.addAttribute(StatusUpdate.MAX_CP, player.getMaxCp());
		player.sendPacket(su);
		
		//Admin information
		cm =  new L2CoreMessage (MessageTable.Messages[70]);
		cm.addString(player.getName());
		cm.addNumber(hpval);
		cm.addNumber(mpval);
		cm.addNumber(cpval);
		cm.addNumber(pvpflagval);
		cm.addNumber(pvpkillsval);
		cm.addNumber(pkkillsval);
		cm.sendMessage(activeChar);
		
		if (Config.DEBUG)
			_log.fine("[GM]" + activeChar.getName() + " changed stats of " + player.getName() + ". " + " HP: " + hpval + " MP: " + mpval + " CP: " + cpval + " PvP: " + pvpflagval + " / " + pvpkillsval);
		
		showCharacterInfo(activeChar, null); //Back to start
		
		player.broadcastPacket(new CharInfo(player));
		player.sendPacket(new UserInfo(player));
		player.broadcastPacket(new ExBrExtraUserInfo(player));
		player.getAI().setIntention(CtrlIntention.AI_INTENTION_IDLE);
		player.decayMe();
		player.spawnMe(activeChar.getX(), activeChar.getY(), activeChar.getZ());
	}
	
	private void editCharacter(L2PcInstance activeChar)
	{
		L2Object target = activeChar.getTarget();
		if (!(target instanceof L2PcInstance))
			return;
		L2PcInstance player = (L2PcInstance) target;
		gatherCharacterInfo(activeChar, player, "charedit.htm");
	}
	
	/**
	 * @param activeChar
	 * @param CharacterToFind
	 */
	private void findCharacter(L2PcInstance activeChar, String CharacterToFind)
	{
		int CharactersFound = 0;
		String name;
		Collection<L2PcInstance> allPlayers = L2World.getInstance().getAllPlayers().values();
		L2PcInstance[] players;
		//synchronized (L2World.getInstance().getAllPlayers())
		{
			players = allPlayers.toArray(new L2PcInstance[allPlayers.size()]);
		}
		NpcHtmlMessage adminReply = new NpcHtmlMessage(5);
		adminReply.setFile("data/html/admin/charfind.htm");

                final StringBuilder replyMSG = new StringBuilder(1000);

                for (L2PcInstance player: players)
		{ //Add player info into new Table row
			name = player.getName();
			if (name.toLowerCase().contains(CharacterToFind.toLowerCase())) {
				CharactersFound = CharactersFound + 1;
                                StringUtil.append(replyMSG,
                                        "<tr><td width=80><a action=\"bypass -h admin_character_list ",
                                        name,
                                        "\">",
                                        name,
                                        "</a></td><td width=110>",
                                        player.getTemplate().className,
                                        "</td><td width=40>",
                                        String.valueOf(player.getLevel()),
                                        "</td></tr>");
			}
			if (CharactersFound > 20)
				break;
		}
		adminReply.replace("%results%", replyMSG.toString());

                final String replyMSG2;
                
		if (CharactersFound == 0) {
			replyMSG2 = MessageTable.Messages[678].getMessage();
                } else if (CharactersFound > 20) {
			adminReply.replace("%number%", MessageTable.Messages[679].getMessage());
			replyMSG2 = MessageTable.Messages[680].getMessage();
		} else if (CharactersFound == 1) {
			replyMSG2 = MessageTable.Messages[1196].getMessage();
                } else {
			replyMSG2 = MessageTable.Messages[1197].getMessage();
                }
                
		adminReply.replace("%number%", String.valueOf(CharactersFound));
		adminReply.replace("%end%", replyMSG2);
		activeChar.sendPacket(adminReply);
	}
	
	/**
	 * @param activeChar
	 * @param IpAdress
	 * @throws IllegalArgumentException
	 */
	private void findCharactersPerIp(L2PcInstance activeChar, String IpAdress) throws IllegalArgumentException
	{
		boolean findDisconnected = false;
		
		if (IpAdress.equals("disconnected"))
		{
			findDisconnected = true;
		}
		else
		{
			if (!IpAdress.matches("^(?:(?:[0-9]|[1-9][0-9]|1[0-9][0-9]|2(?:[0-4][0-9]|5[0-5]))\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9][0-9]|2(?:[0-4][0-9]|5[0-5]))$"))
				throw new IllegalArgumentException("Malformed IPv4 number");
		}
		Collection<L2PcInstance> allPlayers = L2World.getInstance().getAllPlayers().values();
		L2PcInstance[] players;
		//synchronized (L2World.getInstance().getAllPlayers())
		{
			players = allPlayers.toArray(new L2PcInstance[allPlayers.size()]);
		}
		int CharactersFound = 0;
		L2GameClient client;
		String name, ip = "0.0.0.0";
                final StringBuilder replyMSG = new StringBuilder(1000);
		NpcHtmlMessage adminReply = new NpcHtmlMessage(5);
		adminReply.setFile("data/html/admin/ipfind.htm");
		for (L2PcInstance player: players)
		{
			client = player.getClient();
			if (client.isDetached())
			{
				if (!findDisconnected)
				{
					continue;
				}
			}
			else
			{
				if (findDisconnected)
				{
					continue;
				}
				else
				{
					ip = client.getConnection().getInetAddress().getHostAddress();
					if (!ip.equals(IpAdress))
						continue;
				}
			}
			
			name = player.getName();
			CharactersFound = CharactersFound + 1;
                        StringUtil.append(replyMSG,
                                "<tr><td width=80><a action=\"bypass -h admin_character_list ",
                                name,
                                "\">",
                                name,
                                "</a></td><td width=110>",
                                player.getTemplate().className,
                                "</td><td width=40>",
                                String.valueOf(player.getLevel()),
                                "</td></tr>");

			if (CharactersFound > 20)
				break;
		}
		adminReply.replace("%results%", replyMSG.toString());

                final String replyMSG2;

                if (CharactersFound == 0) {
			replyMSG2 = MessageTable.Messages[681].getMessage();
                } else if (CharactersFound > 20) {
			adminReply.replace("%number%", MessageTable.Messages[1213].getMessage() + String.valueOf(CharactersFound));
			replyMSG2 = MessageTable.Messages[682].getMessage();
		} else if (CharactersFound == 1) {
			replyMSG2 = MessageTable.Messages[1196].getMessage();
                } else {
			replyMSG2 = MessageTable.Messages[1197].getMessage();
                }
		adminReply.replace("%ip%", ip);
		adminReply.replace("%number%", String.valueOf(CharactersFound));
		adminReply.replace("%end%", replyMSG2);
		activeChar.sendPacket(adminReply);
	}
	
	/**
	 * @param activeChar
	 * @param characterName
	 * @throws IllegalArgumentException
	 */
	private void findCharactersPerAccount(L2PcInstance activeChar, String characterName) throws IllegalArgumentException
	{
		if (characterName.matches(Config.CNAME_TEMPLATE))
		{
			String account = null;
			Map<Integer, String> chars;
			L2PcInstance player = L2World.getInstance().getPlayer(characterName);
			if (player == null)
				throw new IllegalArgumentException("Player doesn't exist");
			chars = player.getAccountChars();
			account = player.getAccountName();
                        final StringBuilder replyMSG =
                                new StringBuilder(chars.size() * 20);
			NpcHtmlMessage adminReply = new NpcHtmlMessage(5);
			adminReply.setFile("data/html/admin/accountinfo.htm");
			for (String charname : chars.values()) {
                            StringUtil.append(replyMSG,
                                    charname,
                                    "<br1>");
                        }
                        
			adminReply.replace("%characters%", replyMSG.toString());
			adminReply.replace("%account%", account);
			adminReply.replace("%player%", characterName);
			activeChar.sendPacket(adminReply);
		}
		else
			throw new IllegalArgumentException("Malformed character name");
	}
	
	/**
	* @param activeChar
	* @throws IllegalArgumentException
	*/
	private void findDualbox(L2PcInstance activeChar, int multibox) throws IllegalArgumentException
	{
		Collection<L2PcInstance> allPlayers = L2World.getInstance().getAllPlayers().values();
		L2PcInstance[] players = allPlayers.toArray(new L2PcInstance[allPlayers.size()]);
		
		Map<String, List<L2PcInstance>> ipMap = new HashMap<String, List<L2PcInstance>>();
		
		String ip = "0.0.0.0";
		L2GameClient client;
		
		final Map<String, Integer> dualboxIPs = new HashMap<String, Integer>();
		
		for (L2PcInstance player : players)
		{
			client = player.getClient();
			if (client.isDetached())
				continue;
			else
			{
				ip = client.getConnection().getInetAddress().getHostAddress();
				if (ipMap.get(ip) == null)
					ipMap.put(ip, new ArrayList<L2PcInstance>());
				ipMap.get(ip).add(player);
				
				if (ipMap.get(ip).size() >= multibox)
				{
					Integer count = dualboxIPs.get(ip);
					if (count == null)
						dualboxIPs.put(ip, multibox);
					else
						dualboxIPs.put(ip, count + 1);
				}
			}
		}
		
		List<String> keys = new ArrayList<String>(dualboxIPs.keySet());
		Collections.sort(keys, new Comparator<String>() {
			public int compare(String left, String right)
			{
				return dualboxIPs.get(left).compareTo(dualboxIPs.get(right));
			}
		});
		Collections.reverse(keys);
		
		final StringBuilder results = new StringBuilder();
		for (String dualboxIP : keys)
		{
			StringUtil.append(results, "<a action=\"bypass -h admin_find_ip " + dualboxIP + "\">" + dualboxIP + " (" + dualboxIPs.get(dualboxIP) + ")</a><br1>");
		}
		
		NpcHtmlMessage adminReply = new NpcHtmlMessage(5);
		adminReply.setFile("data/html/admin/dualbox.htm");
		adminReply.replace("%multibox%", String.valueOf(multibox));
		adminReply.replace("%results%", results.toString());
		activeChar.sendPacket(adminReply);
	}
}
