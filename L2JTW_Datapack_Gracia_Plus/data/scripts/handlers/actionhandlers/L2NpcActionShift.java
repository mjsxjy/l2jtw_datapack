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
package handlers.actionhandlers;

import com.l2jserver.Config;
import com.l2jserver.gameserver.datatables.ItemTable;
import com.l2jserver.gameserver.handler.IActionHandler;
import com.l2jserver.gameserver.model.L2DropCategory;
import com.l2jserver.gameserver.model.L2DropData;
import com.l2jserver.gameserver.model.L2Object;
import com.l2jserver.gameserver.model.MobGroupTable;
import com.l2jserver.gameserver.model.L2Object.InstanceType;
import com.l2jserver.gameserver.model.actor.L2Attackable;
import com.l2jserver.gameserver.model.actor.L2Character;
import com.l2jserver.gameserver.model.actor.L2Npc;
import com.l2jserver.gameserver.model.actor.instance.L2ControllableMobInstance;
import com.l2jserver.gameserver.model.actor.instance.L2PcInstance;
import com.l2jserver.gameserver.network.serverpackets.MyTargetSelected;
import com.l2jserver.gameserver.network.serverpackets.NpcHtmlMessage;
import com.l2jserver.gameserver.network.serverpackets.StatusUpdate;
import com.l2jserver.gameserver.skills.Stats;
import com.l2jserver.gameserver.templates.item.L2Item;
import com.l2jserver.util.StringUtil;
import com.l2jserver.gameserver.datatables.MessageTable;
public class L2NpcActionShift implements IActionHandler
{
	/**
	 * Manage and Display the GM console to modify the L2NpcInstance (GM only).<BR><BR>
	 * 
	 * <B><U> Actions (If the L2PcInstance is a GM only)</U> :</B><BR><BR>
	 * <li>Set the L2NpcInstance as target of the L2PcInstance player (if necessary)</li>
	 * <li>Send a Server->Client packet MyTargetSelected to the L2PcInstance player (display the select window)</li>
	 * <li>If L2NpcInstance is autoAttackable, send a Server->Client packet StatusUpdate to the L2PcInstance in order to update L2NpcInstance HP bar </li>
	 * <li>Send a Server->Client NpcHtmlMessage() containing the GM console about this L2NpcInstance </li><BR><BR>
	 * 
	 * <FONT COLOR=#FF0000><B> <U>Caution</U> : Each group of Server->Client packet must be terminated by a ActionFailed packet in order to avoid
	 * that client wait an other packet</B></FONT><BR><BR>
	 * 
	 * <B><U> Example of use </U> :</B><BR><BR>
	 * <li> Client packet : Action</li><BR><BR>
	 */
	public boolean action(L2PcInstance activeChar, L2Object target, boolean interact)
	{
		// Check if the L2PcInstance is a GM
		if (activeChar.getAccessLevel().isGm())
		{
			// Set the target of the L2PcInstance activeChar
			activeChar.setTarget(target);

			// Send a Server->Client packet MyTargetSelected to the L2PcInstance activeChar
			// The activeChar.getLevel() - getLevel() permit to display the correct color in the select window
			MyTargetSelected my = new MyTargetSelected(target.getObjectId(), activeChar.getLevel() - ((L2Character)target).getLevel());
			activeChar.sendPacket(my);

			// Check if the activeChar is attackable (without a forced attack)
			if (target.isAutoAttackable(activeChar))
			{
				// Send a Server->Client packet StatusUpdate of the L2NpcInstance to the L2PcInstance to update its HP bar
				StatusUpdate su = new StatusUpdate(target.getObjectId());
				su.addAttribute(StatusUpdate.CUR_HP, (int)((L2Character)target).getCurrentHp());
				su.addAttribute(StatusUpdate.MAX_HP, ((L2Character)target).getMaxHp());
				activeChar.sendPacket(su);
			}

			// Send a Server->Client NpcHtmlMessage() containing the GM console about this L2NpcInstance
			NpcHtmlMessage html = new NpcHtmlMessage(0);
                        final StringBuilder html1 = StringUtil.startAppend(500,
                                "<html><body><center><font color=\"LEVEL\">"+MessageTable.Messages[1303].getMessage()+"</font></center><br>" +
                                MessageTable.Messages[1304].getMessage(),
                                target.getClass().getSimpleName(),
                                "<br1>"+MessageTable.Messages[1305].getMessage(),
                                ((L2Npc)target).getFactionId() != null ? ((L2Npc)target).getFactionId() : "null"
                                );
                        StringUtil.append(html1,
                        		"<br1>"+MessageTable.Messages[1306].getMessage(),
                        		String.valueOf(target.getX()),
                        		", ",
                        		String.valueOf(target.getY()),
                        		", ",
                        		String.valueOf(target.getZ())
                        		);
                        if (((L2Npc)target).getSpawn() != null)
                        	StringUtil.append(html1,
                        			"<br1>"+MessageTable.Messages[1307].getMessage(),
                        			String.valueOf(((L2Npc)target).getSpawn().getLocx()),
                        			", ",
                        			String.valueOf(((L2Npc)target).getSpawn().getLocy()),
                        			", ",
                        			String.valueOf(((L2Npc)target).getSpawn().getLocz()),
                                    MessageTable.Messages[1308].getMessage(),
                                    String.valueOf(((L2Npc)target).getSpawn().getLocation()),
                                    "<br1>"+MessageTable.Messages[1309].getMessage(),
                                    String.valueOf((int)Math.sqrt(((L2Character)target).getPlanDistanceSq(((L2Npc)target).getSpawn().getLocx(), ((L2Npc)target).getSpawn().getLocy()))),
                                    MessageTable.Messages[1310].getMessage(),
                                    String.valueOf((int)Math.sqrt(((L2Character)target).getDistanceSq(((L2Npc)target).getSpawn().getLocx(), ((L2Npc)target).getSpawn().getLocy(), ((L2Npc)target).getSpawn().getLocz())))
                            );

			if (target instanceof L2ControllableMobInstance)
			{
				StringUtil.append(html1,
						"<br1>"+MessageTable.Messages[1311].getMessage(),
						String.valueOf(MobGroupTable.getInstance().getGroupForMob((L2ControllableMobInstance) target).getGroupId()),
						"<br1>"
				);
			}
			else
			{
				StringUtil.append(html1,
						"<br1>"+MessageTable.Messages[1312].getMessage(),
						(((L2Npc)target).getSpawn() != null ? String.valueOf(((L2Npc)target).getSpawn().getRespawnDelay() / 1000) : "?"),
						MessageTable.Messages[1313].getMessage()+"<br1>"
				);
			}
			
			if (((L2Character)target).hasAI())
			{
				StringUtil.append(html1,
						"<br1>"+MessageTable.Messages[1345].getMessage(),
						((L2Character)target).getAI().getClass().getSimpleName(),
						"  <br1>"
				);
			}

			StringUtil.append(html1,
					"<table border=\"0\" width=\"100%\">" +
					"<tr><td>Level</td><td>",
					String.valueOf(((L2Character)target).getLevel()),
					"</td><td>    </td><td>NPC ID</td><td>",
					String.valueOf(((L2Npc)target).getTemplate().npcId),
					"</td></tr>" +
					"<tr><td>"+MessageTable.Messages[1314].getMessage()+"</td><td>" +
					String.valueOf((target instanceof L2Attackable) ? ((L2Attackable) target).getAggroRange() : 0),
					"</td><td>    </td><td>"+MessageTable.Messages[1315].getMessage()+"</td><td>",
					String.valueOf(target.getObjectId()),
					"</td></tr>" +
					"<tr><td>"+MessageTable.Messages[1316].getMessage()+"</td><td>",
					String.valueOf(((L2Npc)target).getCastle().getCastleId()),
					"</td><td>    </td><td>AI </td><td>",
					(((L2Character)target).hasAI() ? String.valueOf(((L2Character)target).getAI().getIntention().name()) : "NULL"),
					"</td></tr>" +
					"</table><br>" +
					"<font color=\"LEVEL\">"+MessageTable.Messages[1317].getMessage()+"</font>" +
					"<table border=\"0\" width=\"100%\">" +
					"<tr><td>"+MessageTable.Messages[1318].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getCurrentHp()),
					"</td><td>"+MessageTable.Messages[1319].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getCurrentMp()),
					"</td></tr>" +
					"<tr><td>"+MessageTable.Messages[1320].getMessage()+"</td><td>",
					String.valueOf((int) (((L2Character)target).getMaxHp() / ((L2Character)target).getStat().calcStat(Stats.MAX_HP, 1, (L2Character)target, null))),
					"*",
					String.valueOf((int) (((L2Character)target).getStat().calcStat(Stats.MAX_HP, 1, (L2Character)target, null))),
					"</td><td>"+MessageTable.Messages[1321].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getMaxMp()),
					"</td></tr>" +
					"<tr><td>"+MessageTable.Messages[1322].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getPAtk(null)),
					"</td><td>"+MessageTable.Messages[1323].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getMAtk(null, null)),
					"</td></tr>" +
					"<tr><td>"+MessageTable.Messages[1324].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getPDef(null)),
					"</td><td>"+MessageTable.Messages[1325].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getMDef(null, null)),
					"</td></tr>" +
					"<tr><td>"+MessageTable.Messages[1326].getMessage()+"</td><td>" +
					String.valueOf(((L2Character)target).getAccuracy()),
					"</td><td>"+MessageTable.Messages[1327].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getEvasionRate(null)),
					"</td></tr>" +
					"<tr><td>"+MessageTable.Messages[1328].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getCriticalHit(null, null)),
					"</td><td>"+MessageTable.Messages[1329].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getRunSpeed()),
					"</td></tr>" +
					"<tr><td>"+MessageTable.Messages[1330].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getPAtkSpd()),
					"</td><td>"+MessageTable.Messages[1331].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getMAtkSpd()),
					"</td></tr>" +
					"</table><br>" +
					"<font color=\"LEVEL\">"+MessageTable.Messages[1332].getMessage()+"</font>" +
					"<table border=\"0\" width=\"100%\">" +
					"<tr><td>STR</td><td>",
					String.valueOf(((L2Character)target).getSTR()),
					"</td><td>DEX</td><td>",
					String.valueOf(((L2Character)target).getDEX()),
					"</td><td>CON</td><td>",
					String.valueOf(((L2Character)target).getCON()),
					"</td></tr>" +
					"<tr><td>INT</td><td>",
					String.valueOf(((L2Character)target).getINT()),
					"</td><td>WIT</td><td>",
					String.valueOf(((L2Character)target).getWIT()),
					"</td><td>MEN</td><td>",
					String.valueOf(((L2Character)target).getMEN()),
					"</td></tr>" +
					"</table>" +
					"<br><center><table><tr><td><button value=\""+MessageTable.Messages[1333].getMessage()+"\" action=\"bypass -h admin_edit_npc ",
					String.valueOf(((L2Npc)target).getTemplate().npcId),
					"\" width=100 height=20 back=\"L2UI_ct1.button_df\" fore=\"L2UI_ct1.button_df\"><br1></td>" +
					"<td><button value=\""+MessageTable.Messages[1334].getMessage()+"\" action=\"bypass -h admin_kill\" width=40 height=20 back=\"L2UI_ct1.button_df\" fore=\"L2UI_ct1.button_df\"></td><br1></tr>" +
					"<tr><td><button value=\""+MessageTable.Messages[1335].getMessage()+"\" action=\"bypass -h admin_show_droplist ",
					String.valueOf(((L2Npc)target).getTemplate().npcId),
					"\" width=100 height=20 back=\"L2UI_ct1.button_df\" fore=\"L2UI_ct1.button_df\"></td></tr>" +
					"<td><button value=\""+MessageTable.Messages[1336].getMessage()+"\" action=\"bypass -h admin_delete\" width=40 height=20 back=\"L2UI_ct1.button_df\" fore=\"L2UI_ct1.button_df\"></td></tr>" +
					"<tr><td><button value=\""+MessageTable.Messages[1337].getMessage()+"\" action=\"bypass -h admin_show_skilllist_npc ",
					String.valueOf(((L2Npc)target).getTemplate().npcId),
				 	"\" width=100 height=20 back=\"L2UI_ct1.button_df\" fore=\"L2UI_ct1.button_df\"></td><td></td></tr></table></center><br></body></html>"
					);

			html.setHtml(html1.toString());
			activeChar.sendPacket(html);
		}
		else if (Config.ALT_GAME_VIEWNPC)
		{
			// Set the target of the L2PcInstance activeChar
			activeChar.setTarget(target);

			// Send a Server->Client packet MyTargetSelected to the L2PcInstance activeChar
			// The activeChar.getLevel() - getLevel() permit to display the correct color in the select window
			MyTargetSelected my = new MyTargetSelected(target.getObjectId(), activeChar.getLevel() - ((L2Character)target).getLevel());
			activeChar.sendPacket(my);

			// Check if the activeChar is attackable (without a forced attack)
			if (target.isAutoAttackable(activeChar))
			{
				// Send a Server->Client packet StatusUpdate of the L2NpcInstance to the L2PcInstance to update its HP bar
				StatusUpdate su = new StatusUpdate(target.getObjectId());
				su.addAttribute(StatusUpdate.CUR_HP, (int) ((L2Character)target).getCurrentHp());
				su.addAttribute(StatusUpdate.MAX_HP, ((L2Character)target).getMaxHp());
				activeChar.sendPacket(su);
			}

			NpcHtmlMessage html = new NpcHtmlMessage(0);
			final StringBuilder html1 = StringUtil.startAppend(
					1000,
					"<html><body>" +
					"<br><center><font color=\"LEVEL\">"+MessageTable.Messages[1338].getMessage()+"</font></center>" +
					"<table border=0 width=\"100%\">" +
					"<tr><td>"+MessageTable.Messages[1320].getMessage()+"</td><td>",
					String.valueOf((int) (((L2Character)target).getMaxHp() / ((L2Character)target).getStat().calcStat(Stats.MAX_HP, 1, (L2Character)target, null))),
					"*",
					String.valueOf((int) ((L2Character)target).getStat().calcStat(Stats.MAX_HP, 1, (L2Character)target, null)),
					"</td><td>"+MessageTable.Messages[1321].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getMaxMp()),
					"</td></tr>" +
					"<tr><td>"+MessageTable.Messages[1322].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getPAtk(null)),
					"</td><td>"+MessageTable.Messages[1323].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getMAtk(null, null)),
					"</td></tr>" +
					"<tr><td>"+MessageTable.Messages[1324].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getPDef(null)),
					"</td><td>"+MessageTable.Messages[1325].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getMDef(null, null)),
					"</td></tr>" +
					"<tr><td>"+MessageTable.Messages[1326].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getAccuracy()),
					"</td><td>"+MessageTable.Messages[1327].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getEvasionRate(null)),
					"</td></tr>" +
					"<tr><td>"+MessageTable.Messages[1328].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getCriticalHit(null, null)),
					"</td><td>"+MessageTable.Messages[1329].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getRunSpeed()),
					"</td></tr>" +
					"<tr><td>"+MessageTable.Messages[1330].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getPAtkSpd()),
					"</td><td>"+MessageTable.Messages[1331].getMessage()+"</td><td>",
					String.valueOf(((L2Character)target).getMAtkSpd()),
					"</td></tr>" +
					"<tr><td>"+MessageTable.Messages[1339].getMessage()+"</td><td>",
					((L2Npc)target).getTemplate().getRace().toString(),
					"</td><td></td><td></td></tr>" +
					"</table>" +
					"<br><center><font color=\"LEVEL\">"+MessageTable.Messages[1340].getMessage()+"</font></center>" +
					"<table border=0 width=\"100%\">" +
					"<tr><td>STR</td><td>",
					String.valueOf(((L2Character)target).getSTR()),
					"</td><td>DEX</td><td>",
					String.valueOf(((L2Character)target).getDEX()),
					"</td><td>CON</td><td>",
					String.valueOf(((L2Character)target).getCON()),
					"</td></tr>" +
					"<tr><td>INT</td><td>",
					String.valueOf(((L2Character)target).getINT()),
					"</td><td>WIT</td><td>",
					String.valueOf(((L2Character)target).getWIT()),
					"</td><td>MEN</td><td>",
					String.valueOf(((L2Character)target).getMEN()),
					"</td></tr>" +
					"</table>"
					);

			if (((L2Npc)target).getTemplate().getDropData() != null)
			{
				StringUtil.append(html1,
						"<br><center><font color=\"LEVEL\">"+MessageTable.Messages[1341].getMessage()+"</font></center>" +
						"<br>"+MessageTable.Messages[1342].getMessage()+"<font color=\"ff0000\">50%+</font> <font color=\"00ff00\">30%+</font> <font color=\"0000ff\">"+MessageTable.Messages[1343].getMessage()+"</font>" +
						"<table border=0 width=\"100%\">"
						);
				for (L2DropCategory cat : ((L2Npc)target).getTemplate().getDropData())
				{
					for (L2DropData drop : cat.getAllDrops())
					{
						final L2Item item = ItemTable.getInstance().getTemplate(drop.getItemId());
						if (item == null)
							continue;

						final String color;

						if (drop.getChance() >= 500000)
							color = "ff0000";
						else if (drop.getChance() >= 300000)
							color = "00ff00";
						else
							color = "0000ff";

						StringUtil.append(html1,
								"<tr><td><font color=\"",
								color,
								"\">",
								item.getName(),
								"</font></td><td>",
								(drop.isQuestDrop() ? MessageTable.Messages[1344].getExtra(1) : (cat.isSweep() ? MessageTable.Messages[1344].getExtra(2) : MessageTable.Messages[1344].getExtra(3))),
								"</td></tr>"
								);
					}
				}
				html1.append("</table>");
			}
			html1.append("</body></html>");

			html.setHtml(html1.toString());
			activeChar.sendPacket(html);
		}
		return true;
	}

	public InstanceType getInstanceType()
	{
		return InstanceType.L2Npc;
	}
}