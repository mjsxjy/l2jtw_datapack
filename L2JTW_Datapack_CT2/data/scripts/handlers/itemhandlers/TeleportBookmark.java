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

import net.sf.l2j.gameserver.handler.IItemHandler;
import net.sf.l2j.gameserver.model.L2ItemInstance;
import net.sf.l2j.gameserver.model.actor.L2Playable;
import net.sf.l2j.gameserver.model.actor.instance.L2PcInstance;
import net.sf.l2j.gameserver.network.serverpackets.SystemMessage;

/**
 * Teleport Bookmark Slot Handler
 *
 * @author ShanSoft
 */
public class TeleportBookmark implements IItemHandler
{
	// All the item IDs that this handler knows.
	private static final int[] ITEM_IDS =
	{
		13015
	};
	
	
	public void useItem(L2Playable playable, L2ItemInstance item)
	{
		if (playable == null || item == null || !(playable instanceof L2PcInstance))
			return;
			
		L2PcInstance player = (L2PcInstance) playable;
		
		if(player.getBookMarkSlot() >= 9)
		{
      player.sendPacket(new SystemMessage(2390));
      return;
		}
		
		player.destroyItem("Consume", item.getObjectId(), 1, null, false);
		
    player.setBookMarkSlot(player.getBookMarkSlot()+3);
    
    player.sendPacket(new SystemMessage(2409));

	}
	

	public int[] getItemIds()
	{
		return ITEM_IDS;
	}
}