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
package handlers.itemhandlers;

import java.util.logging.Level;

import net.sf.l2j.gameserver.GameTimeController;
import net.sf.l2j.gameserver.ThreadPoolManager;
import net.sf.l2j.gameserver.ai.CtrlIntention;
import net.sf.l2j.gameserver.datatables.MapRegionTable;
import net.sf.l2j.gameserver.datatables.SkillTable;
import net.sf.l2j.gameserver.handler.IItemHandler;
import net.sf.l2j.gameserver.instancemanager.CastleManager;
import net.sf.l2j.gameserver.instancemanager.ClanHallManager;
import net.sf.l2j.gameserver.instancemanager.FortManager;
import net.sf.l2j.gameserver.instancemanager.GrandBossManager;
import net.sf.l2j.gameserver.model.L2ItemInstance;
import net.sf.l2j.gameserver.model.L2Skill;
import net.sf.l2j.gameserver.model.actor.L2Playable;
import net.sf.l2j.gameserver.model.actor.instance.L2PcInstance;
import net.sf.l2j.gameserver.model.entity.TvTEvent;
import net.sf.l2j.gameserver.network.SystemMessageId;
import net.sf.l2j.gameserver.network.serverpackets.ActionFailed;
import net.sf.l2j.gameserver.network.serverpackets.MagicSkillUse;
import net.sf.l2j.gameserver.network.serverpackets.SetupGauge;
import net.sf.l2j.gameserver.network.serverpackets.SystemMessage;

/**
 * This class ...
 *
 * @version $Revision: 1.2.2.3.2.5 $ $Date: 2005/03/27 15:30:07 $
 */

public class ScrollOfEscape implements IItemHandler
{
	// all the items IDs that this handler knows
	private static final int[] ITEM_IDS =
	{
		736, 1830, 1829, 1538, 3958, 5858,
		5859, 7117, 7118, 7119, 7120, 7121,
		7122, 7123, 7124, 7125, 7126, 7127,
		7128, 7129, 7130, 7131, 7132, 7133,
		7134, 7135, 7554, 7555, 7556, 7557,
		7558, 7559, 7618, 7619, 9716, 10129,
		10130, 10650 ,9647, 12753, 13395, 13396,//Update by rocknow-Start
		13397, 13398, 13399, 13400, 13401, 13402,
		13403, 13404, 13405, 13406, 13407, 13408,
		13409, 13410, 13411, 13412, 13413, 13414//Update by rocknow-End
	};
	
	/**
	 * 
	 * @see net.sf.l2j.gameserver.handler.IItemHandler#useItem(net.sf.l2j.gameserver.model.actor.L2Playable, net.sf.l2j.gameserver.model.L2ItemInstance)
	 */
	public void useItem(L2Playable playable, L2ItemInstance item)
	{
		if (!(playable instanceof L2PcInstance))
			return;
		L2PcInstance activeChar = (L2PcInstance) playable;
		
		// Thanks nbd
		if (!TvTEvent.onEscapeUse(activeChar.getObjectId()))
		{
			activeChar.sendPacket(ActionFailed.STATIC_PACKET);
			return;
		}
		
		if (checkConditions(activeChar))
			return;
		
		if (activeChar.isSitting())
		{
			activeChar.sendPacket(new SystemMessage(SystemMessageId.CANT_MOVE_SITTING));
			return;
		}
		
		if (GrandBossManager.getInstance().getZone(activeChar) != null && !activeChar.isGM())
		{
			activeChar.sendPacket(ActionFailed.STATIC_PACKET);
			//activeChar.sendPacket(new SystemMessage(SystemMessageId.CANNOT_USE_SCROLL_OF_ESCAPE_INSIDE_BOSS_ZONE));
			
			// SystemMessage doesn't exist ??!
			activeChar.sendMessage("Cant summon target inside boss zone.");
			return;
		}
		
		if (activeChar.isInOlympiadMode())
		{
			activeChar.sendPacket(new SystemMessage(SystemMessageId.THIS_ITEM_IS_NOT_AVAILABLE_FOR_THE_OLYMPIAD_EVENT));
			return;
		}
		
		// Check to see if the player is in a festival.
		if (activeChar.isFestivalParticipant())
		{
			activeChar.sendMessage("You may not use an escape skill in a festival.");
			return;
		}
		
		// Check to see if player is in jail
		if (activeChar.isInJail())
		{
			activeChar.sendMessage("You can not escape from jail.");
			return;
		}
		// Check to see if player is in a duel
		if (activeChar.isInDuel())
		{
			activeChar.sendMessage("You cannot use escape skills during a duel.");
			return;
		}
		
		// blessed scrolls don't do anything if hideout target it is null
		boolean ret = false;
		switch(item.getItemId())
		{
			case 5859:
				if (activeChar.getClan() != null && CastleManager.getInstance().getCastleByOwner(activeChar.getClan()) == null)
					ret = true;
				break;
			case 10130:
				if (activeChar.getClan() != null && FortManager.getInstance().getFortByOwner(activeChar.getClan()) == null)
					ret = true;
				break;
			case 5858:
				if (activeChar.getClan() != null && ClanHallManager.getInstance().getClanHallByOwner(activeChar.getClan()) == null)
					ret = true;
				break;
		}		
		if (ret)
		{
			SystemMessage sm = new SystemMessage(SystemMessageId.S1_CANNOT_BE_USED);
			sm.addItemName(item);
			activeChar.sendPacket(sm);
			return;
		}
		
		//activeChar.abortCast();
		activeChar.getAI().setIntention(CtrlIntention.AI_INTENTION_IDLE);
		
		// Modified by Tempy - 28 Jul 05 \\
		// Check if this is a blessed scroll, if it is then shorten the cast time.
		int itemId = item.getItemId();
		int escapeSkill = (itemId == 1538 || itemId == 5858 || itemId == 5859 || itemId == 3958 || itemId == 10130) ? 2036 : 2013;
		
		if (!activeChar.destroyItem("Consume", item.getObjectId(), 1, null, false))
			return;
		
		activeChar.disableAllSkills();
		
		L2Skill skill = SkillTable.getInstance().getInfo(escapeSkill, 1);
		MagicSkillUse msu = new MagicSkillUse(activeChar, activeChar, escapeSkill, 1, skill.getHitTime(), 0);
		activeChar.broadcastPacket(msu);
		SetupGauge sg = new SetupGauge(0, skill.getHitTime());
		activeChar.sendPacket(sg);
		//End SoE Animation section
		
		SystemMessage sm = new SystemMessage(SystemMessageId.S1_DISAPPEARED);
		sm.addItemName(item);
		activeChar.sendPacket(sm);
		
		EscapeFinalizer ef = new EscapeFinalizer(activeChar, itemId);
		// continue execution later
		activeChar.setSkillCast(ThreadPoolManager.getInstance().scheduleEffect(ef, skill.getHitTime()));
		activeChar.forceIsCasting(GameTimeController.getGameTicks() + skill.getHitTime() / GameTimeController.MILLIS_IN_TICK);
	}
	
	static class EscapeFinalizer implements Runnable
	{
		private L2PcInstance _activeChar;
		private int _itemId;
		
		EscapeFinalizer(L2PcInstance activeChar, int itemId)
		{
			_activeChar = activeChar;
			_itemId = itemId;
		}
		
		public void run()
		{
			if (_activeChar.isDead())
				return;
			_activeChar.enableAllSkills();
			_activeChar.setIsCastingNow(false);
			_activeChar.setIsIn7sDungeon(false);
			_activeChar.setInstanceId(0);
			
			try
			{
				switch (_itemId)
				{
					case 1830:
					case 5859:
						if (_activeChar.getClan() != null && CastleManager.getInstance().getCastleByOwner(_activeChar.getClan()) != null && !_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(MapRegionTable.TeleportWhereType.Castle);
						else 
							_activeChar.teleToLocation(MapRegionTable.TeleportWhereType.Town);
						break;
					case 10129:
					case 10130:
						if (_activeChar.getClan() != null && FortManager.getInstance().getFortByOwner(_activeChar.getClan()) != null && !_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(MapRegionTable.TeleportWhereType.Fortress);
						else 
							_activeChar.teleToLocation(MapRegionTable.TeleportWhereType.Town);
						break;
					case 1829:
					case 5858:
						if (_activeChar.getClan() != null && ClanHallManager.getInstance().getClanHallByOwner(_activeChar.getClan()) != null && !_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(MapRegionTable.TeleportWhereType.ClanHall);
						else 
							_activeChar.teleToLocation(MapRegionTable.TeleportWhereType.Town);
						break;
					case 7117 :
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(-84318, 244579, -3730, true); // Talking Island
						break;
					case 7554:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(-84318, 244579, -3730, true); // Talking Island quest scroll
						break;
					case 7118:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(46934, 51467, -2977, true); // Elven Village
						break;
					case 7555:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(46934, 51467, -2977, true); // Elven Village quest scroll
						break;
					case 7119:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(9745, 15606, -4574, true); // Dark Elven Village
						break;
					case 7556:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(9745, 15606, -4574, true); // Dark Elven Village quest scroll
						break;
					case 7120:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(-44836, -112524, -235, true); // Orc Village
						break;
					case 7557:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(-44836, -112524, -235, true); // Orc Village quest scroll
						break;
					case 7121:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(115113, -178212, -901, true); // Dwarven Village
						break;
					case 7558:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(115113, -178212, -901, true); // Dwarven Village quest scroll
						break;
					case 7122:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(-80826, 149775, -3043, true); // Gludin Village
						break;
					case 7123:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(-12678, 122776, -3116, true); // Gludio Castle Town
						break;
					case 7124:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(15670, 142983, -2705, true); // Dion Castle Town
						break;
					case 7125:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(17836, 170178, -3507, true); // Floran
						break;
					case 7126:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(83400, 147943, -3404, true); // Giran Castle Town
						break;
					case 7559:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(83400, 147943, -3404, true); // Giran Castle Town quest scroll
						break;
					case 7127:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(105918, 109759, -3207, true); // Hardin's Private Academy
						break;
					case 7128:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(111409, 219364, -3545, true); // Heine
						break;
					case 7129:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(82956, 53162, -1495, true); // Oren Castle Town
						break;
					case 7130:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(85348, 16142, -3699, true); // Ivory Tower
						break;
					case 7131:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(116819, 76994, -2714, true); // Hunters Village
						break;
					case 7132:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(146331, 25762, -2018, true); // Aden Castle Town
						break;
					case 7133:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(147928, -55273, -2734, true); // Goddard Castle Town
						break;
					case 7134:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(43799, -47727, -798, true); // Rune Castle Town
						break;
					case 7135:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(87331, -142842, -1317, true); // Schuttgart Castle Town
						break;
					case 7618:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(149864, -81062, -5618, true); // Ketra Orc Village
						break;
					case 7619:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(108275, -53785, -2524, true); // Varka Silenos Village
						break;
					case 9716:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(-117251, 46771, 360, true); // Kamael Village
						break;
					//Update by rocknow-Start
					case 9647:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(-117251, 46771, 360, true); // Kamael Village
						break;
					case 12753:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(-117251, 46771, 360, true); // Kamael Village
						break;
					case 13395:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(-84318, 244579, -3730, true); // Talking Island  scroll
						break;
					case 13396:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(46934, 51467, -2977, true); // Elven Village  scroll
						break;
					case 13397:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(9745, 15606, -4574, true); // Dark Elven Village  scroll
						break;
					case 13398:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(-44836, -112524, -235, true); // Orc Village  scroll
						break;
					case 13399:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(115113, -178212, -901, true); // Dwarven Village  scroll
						break;
					case 13400:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(-80826, 149775, -3043, true); // Gludin Village
						break;
					case 13401:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(-12678, 122776, -3116, true); // Gludio Castle Town
						break;
					case 13402:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(15670, 142983, -2705, true); // Dion Castle Town
						break;
					case 13403:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(17836, 170178, -3507, true); // Floran
						break;
					case 13404:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(83400, 147943, -3404, true); // Giran Castle Town
						break;
					case 13405:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(105918, 109759, -3207, true); // Hardin's Private Academy
						break;
					case 13406:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(111409, 219364, -3545, true); // Heine
						break;
					case 13407:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(82956, 53162, -1495, true); // Oren Castle Town
						break;
					case 13408:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(85348, 16142, -3699, true); // Ivory Tower
						break;
					case 13409:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(116819, 76994, -2714, true); // Hunters Village
						break;
					case 13410:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(146331, 25762, -2018, true); // Aden Castle Town
						break;
					case 13411:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(147928, -55273, -2734, true); // Goddard Castle Town
						break;
					case 13412:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(43799, -47727, -798, true); // Rune Castle Town
						break;
					case 13413:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(87331, -142842, -1317, true); // Schuttgart Castle Town
						break;
					case 13414:
						if (!_activeChar.isFlyingMounted())
							_activeChar.teleToLocation(-117251, 46771, 360, true); // Kamael Village
						break;
					//Update by rocknow-End
					default:
						_activeChar.teleToLocation(MapRegionTable.TeleportWhereType.Town);
						break;
				}
			}
			catch (Exception e)
			{
				_log.log(Level.SEVERE, "", e);
			}
		}
	}
	
	private static boolean checkConditions(L2PcInstance actor)
	{
		 return actor.isStunned() || actor.isSleeping() || actor.isParalyzed() || actor.isFakeDeath() || actor.isTeleporting()
		 || actor.isMuted() || actor.isAlikeDead() || actor.isAllSkillsDisabled() || actor.isCastingNow();
	}
	
	/**
	 * 
	 * @see net.sf.l2j.gameserver.handler.IItemHandler#getItemIds()
	 */
	public int[] getItemIds()
	{
		return ITEM_IDS;
	}
}
