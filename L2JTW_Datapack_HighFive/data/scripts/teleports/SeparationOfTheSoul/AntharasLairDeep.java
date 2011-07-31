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
package teleports.SeparationOfTheSoul;

import com.l2jserver.gameserver.model.actor.L2Npc;
import com.l2jserver.gameserver.model.actor.instance.L2PcInstance;
import com.l2jserver.gameserver.model.quest.Quest;
import com.l2jserver.gameserver.model.quest.QuestState;

/**
 * @author pmq
 */
public class AntharasLairDeep extends Quest
{
	private static final int[] TELEPORTERS = {32864,32865,32866,32867,32868,32869,32870,32891};
	
	@Override
	public String onTalk(L2Npc npc, L2PcInstance player)
	{
		String htmltext = "";
		QuestState st = player.getQuestState(getName());
		
		if (st == null)
			return getNoQuestMsg(player);
		
		if (player.getLevel() >= 80)
			player.teleToLocation(148447,110582,-3944);
		else
			htmltext = "<html><body>�������F��G<br>�w��紵�����u���L�����a�\�L�F�ڪ��y�e�Ӥw�A���ڪ��F��o�w�����}�H�C<br>���M�����U�a���F��S��E���b�@�_�A�����٬O��Pı�o��ڭ̩����۳s�ۡC�p�G�A�@�N���ܡA�ڥi�H��A�ǰe��ڨ��������F��Ҧb���B�C���L�A�ݨӧA�٨S����Ư൲�X�ڨ��Ǥw�Q���H���F��O�q�C<br>�]�Y�n���ʨ��L�������F��A���ⵥ�ť����F��<font color=\"LEVEL\">����80�H�W</font>�C�^</body></html>";
		
		return htmltext;
	}
	
	public AntharasLairDeep(int questId, String name, String descr)
	{
		super(questId, name, descr);
		
		for (int teleporters : TELEPORTERS)
		{
			addStartNpc(teleporters);
			addTalkId(teleporters);
		}
	}
	
	public static void main(String[] args)
	{
		new AntharasLairDeep(-1, AntharasLairDeep.class.getSimpleName(), "teleports");
	}
}
