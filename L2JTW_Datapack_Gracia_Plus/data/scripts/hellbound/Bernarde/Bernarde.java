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
/**
 * �i���o
 */
package hellbound.Bernarde;

import com.l2jserver.gameserver.instancemanager.HellboundManager;
import com.l2jserver.gameserver.model.actor.L2Npc;
import com.l2jserver.gameserver.model.actor.instance.L2PcInstance;
import com.l2jserver.gameserver.model.quest.Quest;
import com.l2jserver.gameserver.model.quest.QuestState;

/**
 * @author theOne
 */
public class Bernarde extends Quest
{
	private static final int Bernarde = 32300;

	private int condition = 0;

	public Bernarde(int id, String name, String descr)
	{
		super(id, name, descr);
		addStartNpc(Bernarde);
		addTalkId(Bernarde);
		addFirstTalkId(Bernarde);
	}

	@Override
	public String onAdvEvent(String event, L2Npc npc, L2PcInstance player)
	{
		QuestState st = player.getQuestState(getName());
		if (st == null)
			st = newQuestState(player);

		if (event.equalsIgnoreCase("HolyWater"))
		{
			long BadgesCount = st.getQuestItemsCount(9674);
			if (BadgesCount < 5)
				return "<html><body>�i���o:<br>�ܩ�p�A�A�S�������F�������\�i�ҡC</body></html>";
			st.takeItems(9674, 5);
			st.giveItems(9673, 1);
			return "<html><body>�i���o:<br>�b�o�̡C�{�b�A�л����ڭ̨I�Ϊ������M�w�����@�ɡI</body></html>";
		}
		else if (event.equalsIgnoreCase("Treasure"))
		{
			if (condition == 1)
				return "<html><body>�i���o:<br>�ݨӧA�w�g�礩�ڪ��]�I�ܡH</body></html>";
			long treasures = st.getQuestItemsCount(9684);
			if (treasures < 1)
				return "<html><body>�i���o:<br>�@�A�_���b���̶ܡH</body></html>";
			st.takeItems(9684, 1);
			condition = 1;
			return "<html><body>�i���o:<br>���§A�I�o�ñ���a�H�ܻ����C</body></html>";
		}
		else if (event.equalsIgnoreCase("rumors"))
		{
			int hLevel = HellboundManager.getInstance().getLevel();
			if (hLevel == 6)
				return "<html><body>�i���o:<br>�̪�c�]���D�`�n�����]�k�}�C�@�w������a��|���L�̼W�[�o�譱���w���C�A�|�լd�ܡH�]�\�A�|�o�{�@�ǯ�����U�ڭ̴�֤ڦC�����O�q�C</body></html>";
			if (hLevel == 7)
				return "<html><body>�i���o:<br>�ڪ��D�A������a�F�ѤU�h�ݡA�Ʀܤj�O����������Ʊ泣�����h���̡C�]�\�A��A�N�ǳƦn�F�A�A�|�Q��X�O�_�W�ߡH���ܮɡA�o�O�i�H�ϥ��]�k�~�A�����F��Ǫ����]�k�b�P�@���C�O�D�`���������~�]�k�v�C�����򤣯����A���աH</body></html>";
			if (hLevel == 8)
				return "<html><body>�i���o:<br>��ť�������~���j���w�Q�����}�^��~�����K�����I�����O�q�L�H�ϲ{�b�u�O�ɶ������D�C�۵M�A�@�e�ݥߤ@�ӼĹﶤ���[�j���A����|���O�q�A�������������A�ƦܻP�L���޲z�I</body></html>";
			if (hLevel == 9)
				return "<html><body>�i���o:<br>���ܦh���F�������l�H�̦b���K�����A�ڭ̧�e���q�����|�����C�ڭ̥������@�Ӥ�k�ӱ����Ҧ����L�̡I</body></html>";
			if (hLevel == 10)
				return "<html><body>�i���o:<br>��ť���~�������j���M���O���`�`�P�ʤF�A���K���������C�@�A�o�Ӧ��a�y�̲ץi�H�ݨ�i�����@�ӷs���ɥN�I�b�ڲ������\���N�q�@�ӳQ��n�_�Ӫ��Q�k�աI���O�A���ޥ��O�y�����ɭ� - �ڭ̥����h���U�ڭ̪��S�̦b�@�y�����C</body></html>";
			if (hLevel == 11)
				return "<html><body>�i���o:<br>�{�b�A�ڭ̥������ѤڦC���M�F�����C�ӥB�A�O���F��_�o���j�a���M���C</body></html>";
		}
		else if (event.equalsIgnoreCase("alreadysaid"))
			return "<html><body>�i���o:<br>�ڻ����F�A�{�b�ڥ����^�h�u�@�C�����U���l���ڪ������O�b�o�V���o�ê��j�b�C</body></html>";
		else if (event.equalsIgnoreCase("abouthelp"))
			return "<html><body>�i���o:<br>��N���q�� ����J�O��ө������A���ɥX�{�b�o�V�����j�b�C�p��d�G�A�L���믫�����C�b���̡A����𮧡I���M�L�o�áA�ګܮ`�ȡA���û����|�����@�ɤ������x�q�M��a���� ...</body></html>";
		else if (event.equalsIgnoreCase("quarry"))
			return "<html><body>�i���o:<br>�L�̻����O�ĥ۳������Q���u�@�ͲP�C�p�G�z�N����@�ϥL�̡A�Ӥ��O�@�Ӱ����O�b�Ҧ��P�N�i�J��a�C�����U�ڭ̱ĥ۳������o��ۥѡI</body></html>";

		return null;
	}

	@Override
	public String onFirstTalk(L2Npc npc, L2PcInstance player)
	{
		QuestState st = player.getQuestState(getName());
		if (st == null)
			st = newQuestState(player);

		int hellboundLevel = HellboundManager.getInstance().getLevel();
		if (hellboundLevel < 2)
			return "<html><body>�i���o:<br>�A�O�֡H�A�̬O�q�j���a��Ӫ��C�A�w�g�����F�ڭ̪��Ҧ��A�٭n����O�I���I�u�a�A�^�_�ڭ̦a�誺���R�I</body></html>";
		else if (hellboundLevel == 2)
		{
			if (!player.isTransformed())
				return "<html><body>�i���o:<br>�A�O�֡H�A�̬O�q�j���a��Ӫ��C�A�w�g�����F�ڭ̪��Ҧ��A�٭n����O�I���I�u�a�A�^�_�ڭ̦a�誺���R�I</body></html>";
			if (player.getTransformation().getId() != 101)
				return "<html><body>�i���o:<br>�A�O�֡H�A�̬O�q�j���a��Ӫ��C�A�w�g�����F�ڭ̪��Ҧ��A�٭n����O�I���I�u�a�A�^�_�ڭ̦a�誺���R�I</body></html>";
			return "32300.htm";
		}
		else if (hellboundLevel == 3)
		{
			if (!player.isTransformed())
				return "<html><body>�i���o:<br>�O�L�ڡA�q�j���Ө�ڭ̪��g�a�C�ݨӧA����O�۷�j�j�C</body></html>";
			if (player.getTransformation().getId() != 101)
				return "<html><body>�i���o:<br>�O�L�ڡA�q�j���Ө�ڭ̪��g�a�C�ݨӧA����O�۷�j�j�C</body></html>";
			return "32300-2.htm";
		}
		else if (hellboundLevel == 4)
		{
			if (!player.isTransformed())
				return "32300-5.htm";
			if (player.getTransformation().getId() != 101)
				return "32300-5.htm";
			return "32300-4.htm";
		}
		else if (hellboundLevel == 5)
		{
			if (!player.isTransformed())
				return "32300-6.htm";
			if (player.getTransformation().getId() != 101)
				return "32300-6.htm";
			return "<html><body>�i���o:<br>�ڡA�ܰ����W�������U�A�ڪ��B�͡I���§A�̡A�W������J�����F�A�F��I�n�C�{�b���������b�~�����u�@�U�C</body></html>";
		}
		else if (hellboundLevel >= 6)
		{
			if (!player.isTransformed())
				return "32300-3.htm";
			if (player.getTransformation().getId() != 101)
				return "32300-3.htm";
			return "32300-7.htm";
		}

		return null;
	}

	public static void main(String[] args)
	{
		new Bernarde(-1, "Bernarde", "hellbound");
	}
}
