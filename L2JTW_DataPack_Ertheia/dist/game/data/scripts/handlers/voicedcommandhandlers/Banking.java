/*
 * Copyright (C) 2004-2014 L2J DataPack
 * 
 * This file is part of L2J DataPack.
 * 
 * L2J DataPack is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * L2J DataPack is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
package handlers.voicedcommandhandlers;

import com.l2jserver.Config;
import com.l2jserver.gameserver.handler.IVoicedCommandHandler;
import com.l2jserver.gameserver.model.actor.instance.L2PcInstance;
import com.l2jserver.gameserver.datatables.MessageTable;
import com.l2jserver.gameserver.model.L2CoreMessage;

/**
 * This class trades Gold Bars for Adena and vice versa.
 * @author Ahmed
 */
public class Banking implements IVoicedCommandHandler
{
	private static final String[] _voicedCommands =
	{
		"bank",
		"withdraw",
		"deposit"
	};
	
	@Override
	public boolean useVoicedCommand(String command, L2PcInstance activeChar, String params)
	{
		if (command.equals("bank"))
		{
			/* MessageTable
			activeChar.sendMessage(".deposit (" + Config.BANKING_SYSTEM_ADENA + " Adena = " + Config.BANKING_SYSTEM_GOLDBARS + " Goldbar) / .withdraw (" + Config.BANKING_SYSTEM_GOLDBARS + " Goldbar = " + Config.BANKING_SYSTEM_ADENA + " Adena)");
			 */
			L2CoreMessage cm = new L2CoreMessage (MessageTable.Messages[1179]);
			cm.addNumber(Config.BANKING_SYSTEM_ADENA);
			cm.addNumber(Config.BANKING_SYSTEM_GOLDBARS);
			cm.addNumber(Config.BANKING_SYSTEM_GOLDBARS);
			cm.addNumber(Config.BANKING_SYSTEM_ADENA);
			activeChar.sendMessage(cm.renderMsg());
		}
		else if (command.equals("deposit"))
		{
			if (activeChar.getInventory().getInventoryItemCount(57, 0) >= Config.BANKING_SYSTEM_ADENA)
			{
				if (!activeChar.reduceAdena("Goldbar", Config.BANKING_SYSTEM_ADENA, activeChar, false))
				{
					return false;
				}
				activeChar.getInventory().addItem("Goldbar", 3470, Config.BANKING_SYSTEM_GOLDBARS, activeChar, null);
				activeChar.getInventory().updateDatabase();
				/*
				activeChar.sendMessage("Thank you, you now have " + Config.BANKING_SYSTEM_GOLDBARS + " Goldbar(s), and " + Config.BANKING_SYSTEM_ADENA + " less adena.");
				 */
				L2CoreMessage cm = new L2CoreMessage (MessageTable.Messages[1180]);
				cm.addNumber(Config.BANKING_SYSTEM_GOLDBARS);
				cm.addNumber(Config.BANKING_SYSTEM_ADENA);
				activeChar.sendMessage(cm.renderMsg());
			}
			else
			{
				/* MessageTable
				activeChar.sendMessage("You do not have enough Adena to convert to Goldbar(s), you need " + Config.BANKING_SYSTEM_ADENA + " Adena.");
				 */
				L2CoreMessage cm = new L2CoreMessage (MessageTable.Messages[1181]);
				cm.addNumber(Config.BANKING_SYSTEM_ADENA);
				activeChar.sendMessage(cm.renderMsg());
			}
		}
		else if (command.equals("withdraw"))
		{
			if (activeChar.getInventory().getInventoryItemCount(3470, 0) >= Config.BANKING_SYSTEM_GOLDBARS)
			{
				if (!activeChar.destroyItemByItemId("Adena", 3470, Config.BANKING_SYSTEM_GOLDBARS, activeChar, false))
				{
					return false;
				}
				activeChar.getInventory().addAdena("Adena", Config.BANKING_SYSTEM_ADENA, activeChar, null);
				activeChar.getInventory().updateDatabase();
				/* MessageTable
				activeChar.sendMessage("Thank you, you now have " + Config.BANKING_SYSTEM_ADENA + " Adena, and " + Config.BANKING_SYSTEM_GOLDBARS + " less Goldbar(s).");
				 */
				L2CoreMessage cm = new L2CoreMessage (MessageTable.Messages[1182]);
				cm.addNumber(Config.BANKING_SYSTEM_ADENA);
				cm.addNumber(Config.BANKING_SYSTEM_GOLDBARS);
				activeChar.sendMessage(cm.renderMsg());
			}
			else
			{
				/* MessageTable
				activeChar.sendMessage("You do not have any Goldbars to turn into " + Config.BANKING_SYSTEM_ADENA + " Adena.");
				 */
				L2CoreMessage cm = new L2CoreMessage (MessageTable.Messages[1183]);
				cm.addNumber(Config.BANKING_SYSTEM_ADENA);
				activeChar.sendMessage(cm.renderMsg());
			}
		}
		return true;
	}
	
	@Override
	public String[] getVoicedCommandList()
	{
		return _voicedCommands;
	}
}