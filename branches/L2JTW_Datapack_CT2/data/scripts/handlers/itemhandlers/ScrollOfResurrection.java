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

import net.sf.l2j.gameserver.datatables.SkillTable;
import net.sf.l2j.gameserver.handler.IItemHandler;
import net.sf.l2j.gameserver.instancemanager.CastleManager;
import net.sf.l2j.gameserver.model.L2ItemInstance;
import net.sf.l2j.gameserver.model.L2Skill;
import net.sf.l2j.gameserver.model.actor.L2Character;
import net.sf.l2j.gameserver.model.actor.L2Playable;
import net.sf.l2j.gameserver.model.actor.instance.L2PcInstance;
import net.sf.l2j.gameserver.model.actor.instance.L2PetInstance;
import net.sf.l2j.gameserver.model.entity.Castle;//Update by rocknow
import net.sf.l2j.gameserver.model.entity.Fort;//Update by rocknow
import net.sf.l2j.gameserver.instancemanager.FortManager;
import net.sf.l2j.gameserver.network.SystemMessageId;
import net.sf.l2j.gameserver.network.serverpackets.SystemMessage;

/**
 * This class ...
 *
 * @version $Revision: 1.1.2.2.2.7 $ $Date: 2005/04/05 19:41:13 $
 */

public class ScrollOfResurrection implements IItemHandler
{
	/**
	 * 
	 * @see net.sf.l2j.gameserver.handler.IItemHandler#useItem(net.sf.l2j.gameserver.model.actor.L2Playable, net.sf.l2j.gameserver.model.L2ItemInstance)
	 */
	public void useItem(L2Playable playable, L2ItemInstance item)
	{
		if (!(playable instanceof L2PcInstance))
			return;
		
		L2PcInstance activeChar = (L2PcInstance) playable;
		if (activeChar.isSitting())
		{
			activeChar.sendPacket(new SystemMessage(SystemMessageId.CANT_MOVE_SITTING));
			return;
		}
		if (activeChar.isMovementDisabled())
			return;
		
		int itemId = item.getItemId();
		//boolean blessedScroll = (itemId != 737);
		boolean petScroll = (itemId == 6387);
		boolean Battleground = (itemId == 10150);//Update by rocknow
		
		// SoR Animation section
		L2Character target = (L2Character) activeChar.getTarget();
		
		if (target != null && target.isDead())
		{
			L2PcInstance targetPlayer = null;
			
			if (target instanceof L2PcInstance)
				targetPlayer = (L2PcInstance) target;
			
			L2PetInstance targetPet = null;
			
			if (target instanceof L2PetInstance)
				targetPet = (L2PetInstance) target;
			
			if (targetPlayer != null || targetPet != null)
			{
				boolean condGood = true;
				//Update by rocknow-Start
				//check target is not in a active castle siege zone
				Castle castle = null;
				
				if (targetPlayer != null)
					castle = CastleManager.getInstance().getCastle(targetPlayer.getX(), targetPlayer.getY(), targetPlayer.getZ());
				else
					castle = CastleManager.getInstance().getCastle(targetPet.getOwner().getX(), targetPet.getOwner().getY(), targetPet.getOwner().getZ());
	
				// check target is not in a active fort siege zone
				Fort fort = null;
				if (targetPlayer != null)
					fort = FortManager.getInstance().getFort(targetPlayer.getX(), targetPlayer.getY(), targetPlayer.getZ());
				else
					fort = FortManager.getInstance().getFort(targetPet.getOwner().getX(), targetPet.getOwner().getY(), targetPet.getOwner().getZ());
				
				// Check scrolls on Siege
				if ((castle != null && castle.getSiege().getIsInProgress()) || (fort != null && fort.getSiege().getIsInProgress()))
				{
					if(!Battleground)
				{
					condGood = false;
					activeChar.sendPacket(new SystemMessage(SystemMessageId.CANNOT_BE_RESURRECTED_DURING_SIEGE));
				}
				}
				else
				{
					if(Battleground)
					{
						condGood = false;
						SystemMessage sm = new SystemMessage(SystemMessageId.S1_CANNOT_BE_USED);
						sm.addItemName(item);
						activeChar.sendPacket(sm);
					}
				}
				//Update by rocknow-End
				
				if (targetPet != null)
				{
					if (targetPet.getOwner() != activeChar)
					{
						if (targetPet.getOwner().isReviveRequested())
						{
							if (targetPet.getOwner().isRevivingPet())
								activeChar.sendPacket(new SystemMessage(SystemMessageId.RES_HAS_ALREADY_BEEN_PROPOSED)); // Resurrection is already been proposed.
							else
								activeChar.sendPacket(new SystemMessage(SystemMessageId.CANNOT_RES_PET2)); // A pet cannot be resurrected while it's owner is in the process of resurrecting.
							condGood = false;
						}
					}
				}
				else
				{
					if (targetPlayer.isFestivalParticipant()) // Check to see if the current player target is in a festival.
					{
						condGood = false;
						activeChar.sendMessage(560);
					}
					if (targetPlayer.isReviveRequested())
					{
						if (targetPlayer.isRevivingPet())
							activeChar.sendPacket(new SystemMessage(SystemMessageId.MASTER_CANNOT_RES)); // While a pet is attempting to resurrect, it cannot help in resurrecting its master.
						else
							activeChar.sendPacket(new SystemMessage(SystemMessageId.RES_HAS_ALREADY_BEEN_PROPOSED)); // Resurrection is already been proposed.
						condGood = false;
					}
					else if (petScroll)
					{
						condGood = false;
						activeChar.sendMessage(509);
					}
				}
				
				if (condGood)
				{
					if (!activeChar.destroyItem("Consume", item.getObjectId(), 1, null, false))
						return;
					
					int skillId = 0;
					int skillLevel = 1;
					
					switch (itemId)
					{
						case 737:
							skillId = 2014;
							break; // Scroll of Resurrection
						case 3936:
							skillId = 2049;
							break; // Blessed Scroll of Resurrection
						case 3959:
							skillId = 2062;
							break; // L2Day - Blessed Scroll of Resurrection
						case 6387:
							skillId = 2179;
							break; // Blessed Scroll of Resurrection: For Pets
						case 9157:
							skillId = 2321;
							break; // Blessed Scroll of Resurrection Event
						case 10150:
							skillId = 2393;
							break; // Blessed Scroll of Battlefield Resurrection
						case 13259:
							skillId = 2596;
							break; // Gran Kain's Blessed Scroll of Resurrection
					}
					
					if (skillId != 0)
					{
						L2Skill skill = SkillTable.getInstance().getInfo(skillId, skillLevel);
						activeChar.useMagic(skill, true, true);
						
						SystemMessage sm = new SystemMessage(SystemMessageId.S1_DISAPPEARED);
						sm.addItemName(item);
						activeChar.sendPacket(sm);
					}
				}
			}
		}
		else
		{
			activeChar.sendPacket(new SystemMessage(SystemMessageId.TARGET_IS_INCORRECT));
		}
	}
}
