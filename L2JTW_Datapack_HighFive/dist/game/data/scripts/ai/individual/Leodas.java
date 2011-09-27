/* This program is free software: you can redistribute it and/or modify it under
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
package ai.individual;

import ai.group_template.L2AttackableAIScript;

import com.l2jserver.gameserver.datatables.DoorTable;
import com.l2jserver.gameserver.datatables.ItemTable;
import com.l2jserver.gameserver.instancemanager.HellboundManager;
import com.l2jserver.gameserver.model.L2ItemInstance;
import com.l2jserver.gameserver.model.L2Skill;
import com.l2jserver.gameserver.model.actor.L2Npc;
import com.l2jserver.gameserver.model.actor.instance.L2PcInstance;
import com.l2jserver.gameserver.network.serverpackets.CreatureSay;
import com.l2jserver.util.Rnd;

/**
 * �ϧܭx�����x �p�ڹF�� / �����ܸ`���l
 * @author theOne
 */
public class Leodas extends L2AttackableAIScript
{
	//Npcs
	private static final int LEODAS  = 22448;
	private static final int TRAITOR = 32364;
	//Items
	private static final int MARK_BETRAYAL = 9676;
	//Doors
	private static final int[] doors = {
			19250003, 19250004
	};

	private boolean leodasOnAttack = false;

	public Leodas(int questId, String name, String descr)
	{
		super(questId, name, descr);
		addAttackId(LEODAS);
		addKillId(LEODAS);
		addTalkId(TRAITOR);
		addStartNpc(TRAITOR);
	}

	private void dropItem(L2PcInstance player, L2Npc npc, int itemId, int count)
	{
		L2ItemInstance item = ItemTable.getInstance().createItem("Betrayal", itemId, count, player);
		item.dropMe(player, npc.getX(), npc.getY(), npc.getZ());
	}

	@Override
	public String onAttack(L2Npc npc, L2PcInstance player, int damage, boolean isPet, L2Skill skill)
	{
		for (int i : doors)
			DoorTable.getInstance().getDoor(i).closeMe();

		return super.onAttack(npc, player, damage, isPet);
	}

	@Override
	public String onKill(L2Npc npc, L2PcInstance player, boolean isPet)
	{
		for (int i : doors)
		{
			DoorTable.getInstance().getDoor(i).openMe();
			DoorTable.getInstance().getDoor(i).onOpen();
		}

		if (HellboundManager.getInstance().getLevel() >= 5)
		{
			if (Rnd.get(100) < 10)
				dropItem(player, npc, MARK_BETRAYAL, 30);

			dropItem(player, npc, MARK_BETRAYAL, 15);
			npc.onDecay();
		}

		HellboundManager.getInstance().increaseTrust(-1000); //value needs to be updated
		leodasOnAttack = false;

		return super.onKill(npc, player, isPet);
	}

	@Override
	public String onTalk(L2Npc npc, L2PcInstance player)
	{
		int hellboundLevel = HellboundManager.getInstance().getLevel();
		if (hellboundLevel < 5)
			return null;
		
		String htmltext = "";
		if (leodasOnAttack)
		{
			htmltext = "<html><body>�����ܸ`���l�G<br><center><font color=\"FF0000\">�ж��w�g���H�D�Ԥ��A�Э@�ߵ��ԡI</font></center></body></html>";
		}
		else if (player.getQuestState("Leodas").getQuestItemsCount(MARK_BETRAYAL) == 0)
		{
			htmltext = "<html><body>�����ܸ`���l�G<br>�ڻݭn���O<font color=\"LEVEL\">�I�q�̪�����</font>10�ӡA�ӥB�A�S����a����@�ӡC<br>�گ�q�X�A�n�F�ڪ��z�ѡA���L�צp����a�ӦA���a�C</body></html>";
		}
		else if (player.getInventory().getItemByItemId(MARK_BETRAYAL).getCount() >= 10)
		{
			player.destroyItemByItemId("item", MARK_BETRAYAL, 10, player, true);
			npc.broadcastPacket(new CreatureSay(npc.getObjectId(), 0, npc.getName(), "�n�a�A�p�ڹF���{�b�N�O�A���F�I"));
			startQuestTimer("Leodas", 3000, npc, null, false);
			leodasOnAttack = true;
			for (int i : doors)
				DoorTable.getInstance().getDoor(i).openMe();
		}
		else
		{
			htmltext = "<html><body>�����ܸ`���l�G<br>�O�ڡI���a��<font color=\"LEVEL\">�I�q�̪�����</font>�C�ƶq�����աA�ڻݭn���O10�ӭI�q�̪����ҡC��Ҧ��I�q�̪����ұa���ڡA�ڷ|�ߧY���}�o���C</body></html>";
		}
		return htmltext;
	}

	@Override
	public String onAdvEvent(String event, L2Npc npc, L2PcInstance player)
	{
		if (event.equalsIgnoreCase("Leodas"))
			HellboundManager.getInstance().addSpawn(LEODAS, -27807, 252740, -3520, 0, 0);
			return null;
	}

	public static void main(String[] args)
	{
		new Leodas(-1, "Leodas", "ai");
	}
}