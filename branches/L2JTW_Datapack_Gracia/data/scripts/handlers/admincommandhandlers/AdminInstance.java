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

import java.util.StringTokenizer;

import com.l2jserver.gameserver.handler.IAdminCommandHandler;
import com.l2jserver.gameserver.instancemanager.InstanceManager;
import com.l2jserver.gameserver.model.L2Object;
import com.l2jserver.gameserver.model.actor.L2Summon;
import com.l2jserver.gameserver.model.actor.instance.L2PcInstance;
import com.l2jserver.gameserver.model.entity.Instance;
import com.l2jserver.gameserver.datatables.MessageTable;

/** 
 * @author evill33t, GodKratos
 * 
 */
public class AdminInstance implements IAdminCommandHandler
{
	private static final String[] ADMIN_COMMANDS =
	{
			"admin_setinstance",
			"admin_ghoston",
			"admin_ghostoff",
			"admin_createinstance",
			"admin_destroyinstance",
			"admin_listinstances"
	};

	public boolean useAdminCommand(String command, L2PcInstance activeChar)
	{
		StringTokenizer st = new StringTokenizer(command);
		st.nextToken();

		// create new instance
		if (command.startsWith("admin_createinstance"))
		{
			String[] parts = command.split(" ");
			if (parts.length < 2)
			{
				activeChar.sendMessage("Example: //createinstance <id> <templatefile> - ids => 300000 are reserved for dynamic instances");
			}
			else
			{
				try
				{
					int id = Integer.parseInt(parts[1]);
					if (InstanceManager.getInstance().createInstanceFromTemplate(id, parts[2]) && id < 300000)
					{
						activeChar.sendMessage(1691);
						return true;
					}
					else
					{
						activeChar.sendMessage(1692);
						return true;
					}
				}
				catch (Exception e)
				{
					activeChar.sendMessage("Failed loading: " + parts[2]);
					return false;
				}
			}
		}
		else if (command.startsWith("admin_listinstances"))
		{
			for (Instance temp : InstanceManager.getInstance().getInstances().values())
			{
				activeChar.sendMessage(MessageTable.Messages[1693].getExtra(1) + temp.getId() + MessageTable.Messages[1693].getExtra(2) + temp.getName());
			}
		}
		else if (command.startsWith("admin_setinstance"))
		{
			try
			{
				int val = Integer.parseInt(st.nextToken());
				if (InstanceManager.getInstance().getInstance(val) == null)
				{
					activeChar.sendMessage(MessageTable.Messages[1694].getExtra(1) + val + MessageTable.Messages[1694].getExtra(2));
					return false;
				}
				else
				{
					L2Object target = activeChar.getTarget();
					if (target == null || target instanceof L2Summon) // Don't separate summons from masters
					{
						activeChar.sendMessage(1695);
						return false;
					}
					target.setInstanceId(val);
					if (target instanceof L2PcInstance)
					{
						L2PcInstance player = (L2PcInstance) target;
						player.sendMessage(MessageTable.Messages[1696].getMessage() + val);
						player.teleToLocation(player.getX(), player.getY(), player.getZ());
						L2Summon pet = player.getPet();
						if (pet != null)
						{
							pet.setInstanceId(val);
							pet.teleToLocation(pet.getX(), pet.getY(), pet.getZ());
							player.sendMessage(MessageTable.Messages[1697].getExtra(1) + pet.getName() + MessageTable.Messages[1697].getExtra(2) + val);
						}
					}
					activeChar.sendMessage(MessageTable.Messages[1698].getExtra(1) + target.getName() + MessageTable.Messages[1698].getExtra(2) + target.getInstanceId());
					return true;
				}
			}
			catch (Exception e)
			{
				activeChar.sendMessage("Use //setinstance id");
			}
		}
		else if (command.startsWith("admin_destroyinstance"))
		{
			try
			{
				int val = Integer.parseInt(st.nextToken());
				InstanceManager.getInstance().destroyInstance(val);
				activeChar.sendMessage(1699);
			}
			catch (Exception e)
			{
				activeChar.sendMessage("Use //destroyinstance id");
			}
		}

		// set ghost mode on aka not appearing on any knownlist
		// you will be invis to all players but you also dont get update packets ;)
		// you will see snapshots (knownlist echoes?) if you port 
		// so kinda useless atm
		// TODO: enable broadcast packets for ghosts
		else if (command.startsWith("admin_ghoston"))
		{
			activeChar.getAppearance().setGhostMode(true);
			activeChar.sendMessage(1700);
			activeChar.broadcastUserInfo();
			activeChar.decayMe();
			activeChar.spawnMe();
		}
		// ghost mode off
		else if (command.startsWith("admin_ghostoff"))
		{
			activeChar.getAppearance().setGhostMode(false);
			activeChar.sendMessage(1701);
			activeChar.broadcastUserInfo();
			activeChar.decayMe();
			activeChar.spawnMe();
		}
		return true;
	}

	public String[] getAdminCommandList()
	{
		return ADMIN_COMMANDS;
	}
}