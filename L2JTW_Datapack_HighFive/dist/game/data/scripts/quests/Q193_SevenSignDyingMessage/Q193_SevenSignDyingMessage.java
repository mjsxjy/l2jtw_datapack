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
package quests.Q193_SevenSignDyingMessage;

import com.l2jserver.gameserver.ai.CtrlIntention;
import com.l2jserver.gameserver.datatables.SkillTable;
import com.l2jserver.gameserver.model.actor.L2Npc;
import com.l2jserver.gameserver.model.actor.instance.L2MonsterInstance;
import com.l2jserver.gameserver.model.actor.instance.L2PcInstance;
import com.l2jserver.gameserver.model.quest.Quest;
import com.l2jserver.gameserver.model.quest.QuestState;
import com.l2jserver.gameserver.model.quest.State;
import com.l2jserver.gameserver.network.NpcStringId;
import com.l2jserver.gameserver.network.serverpackets.NpcSay;

/**
 * @author Plim
 * Update by pmq High Five 12-06-2011
 */

public class Q193_SevenSignDyingMessage extends Quest
{
	private static final String qn = "193_SevenSignDyingMessage";
	
	//NPCs
	private static final int HOLLINT = 30191;
	private static final int CAIN = 32569;
	private static final int ERIC = 32570;
	private static final int ATHEBALDT = 30760;
	private static final int SHILENSEVIL = 27343;
	
	//ITEMS
	private static final int JACOB_NECK = 13814;
	private static final int DEADMANS_HERB = 13816;
	private static final int SCULPTURE = 14353;
	
	private boolean ShilensevilOnSpawn = false;

	@Override
	public String onAdvEvent(String event, L2Npc npc, L2PcInstance player)
	{
		String htmltext = event;
		QuestState st = player.getQuestState(qn);
		
		if (st == null)
			return htmltext;
		
		if (npc.getNpcId() == HOLLINT)
		{
			if (event.equalsIgnoreCase("30191-02.htm"))
			{
				st.setState(State.STARTED);
				st.set("cond", "1");
				st.giveItems(JACOB_NECK, 1);
				st.playSound("ItemSound.quest_accept");
			}
		}
		
		else if (npc.getNpcId() == CAIN)
		{
			if (event.equalsIgnoreCase("32569-05.htm"))
			{
				st.set("cond", "2");
				st.takeItems(JACOB_NECK, 1);
				st.playSound("ItemSound.quest_middle");
			}
			
			else if (event.equalsIgnoreCase("9"))
			{
				st.takeItems(DEADMANS_HERB, 1);
				st.set("cond", "4");
				st.playSound("ItemSound.quest_middle");
				player.showQuestMovie(9);
				return "";
			}
			
			else if (event.equalsIgnoreCase("32569-09.htm"))
			{
				if (ShilensevilOnSpawn)
					htmltext = "<html><body>���x�ͦ]�G<br>���x�ͦ]���ۻP�ǤH�԰��A�]���S���`�N��z����L��͡C<br>�]��L�����a���b�i���ܡC�^</body></html>";
				else
				{
					npc.broadcastPacket(new NpcSay(npc.getObjectId(), 0, npc.getNpcId(), "�u" + player.getName() + "�v�I�ڭ̱o���˨��өǤH�A�ڷ|�ɥ��O�����A���I"));
					L2MonsterInstance monster = (L2MonsterInstance) addSpawn(SHILENSEVIL, 82624, 47422, -3220, 0, false, 300000, true);
					monster.broadcastPacket(new NpcSay(monster.getObjectId(), 0, monster.getNpcId(), NpcStringId.YOU_ARE_NOT_THE_OWNER_OF_THAT_ITEM));  // ���Ӫ��~���D�H���O�A��...
					monster.setRunning();
					monster.addDamageHate(player, 0, 999);
					monster.getAI().setIntention(CtrlIntention.AI_INTENTION_ATTACK, st.getPlayer());
					ShilensevilOnSpawn = true;
					startQuestTimer("spawnS", 300000, npc, player);
					startQuestTimer("aiplayer", 30000, npc, player);
				}
			}
			else if (event.equalsIgnoreCase("spawnS"))
			{
				if (ShilensevilOnSpawn)
				{
					ShilensevilOnSpawn = false;
					npc.broadcastPacket(new NpcSay(SHILENSEVIL, 0, SHILENSEVIL, NpcStringId.NEXT_TIME_YOU_WILL_NOT_ESCAPE));  // �p�ߡI�U���N���ଡ�ۦ^�h�F�C
					htmltext = "";
				}
				else
					htmltext = "";
			}
			
			else if (event.equalsIgnoreCase("aiplayer"))
			{
				if (ShilensevilOnSpawn == true)
				{
					npc.setTarget(player);
					npc.doCast(SkillTable.getInstance().getInfo(1011, 18));  // Guess Skill
					startQuestTimer("aiplayer", 30000, npc, player);
					return "";
				}
				else
				{
					cancelQuestTimer("aiplayer", npc, player);
					return "";
				}
			}
			
			else if (event.equalsIgnoreCase("32569-13.htm"))
			{
				st.set("cond", "6");
				st.takeItems(SCULPTURE, 1);
				st.playSound("ItemSound.quest_middle");
			}
		}
		
		else if (npc.getNpcId() == ERIC)
		{
			if (event.equalsIgnoreCase("32570-02.htm"))
			{
				st.set("cond", "3");
				st.giveItems(DEADMANS_HERB, 1);
				st.playSound("ItemSound.quest_middle");
			}
		}
		
		else if (npc.getNpcId() == ATHEBALDT)
		{
			if (event.equalsIgnoreCase("30760-02.htm"))
			{
				//st.addExpAndSp(52518015, 5817677);
				st.addExpAndSp(25000000, 2500000); //High Five
				st.unset("cond");
				st.setState(State.COMPLETED);
				st.exitQuest(false);
				st.playSound("ItemSound.quest_finish");
			}
		}
		
		return htmltext;
	}
	
	@Override
	public String onTalk(L2Npc npc, L2PcInstance player)
	{
		String htmltext = "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>";
		QuestState st = player.getQuestState(qn);
		QuestState first = player.getQuestState("192_SevenSignSeriesOfDoubt");
		
		if (st == null)
			return htmltext;
		
		if (npc.getNpcId() == HOLLINT)
		{
			switch (st.getState())
			{
				case State.CREATED :
					if(first != null && first.getState() == State.COMPLETED && player.getLevel() >= 79)
						htmltext = "30191-01.htm";
					else
					{
						htmltext = "30191-00.htm";
						st.exitQuest(true);
					}
					break;
				
				case State.STARTED :
					if (st.getInt("cond") == 1)
						htmltext = "30191-03.htm";
					break;
					
				case State.COMPLETED :
					htmltext = "<html><body>�o�O�w�g���������ȡC</body></html>";
			}
		}
		
		else if (npc.getNpcId() == CAIN)
		{
			if (st.getState() == State.STARTED)
			{
				switch (st.getInt("cond"))
				{
					case 1 :
						htmltext = "32569-01.htm";
						break;
				
					case 2 :
						htmltext = "32569-06.htm";
						break;
				
					case 3 :
						htmltext = "32569-07.htm";
						break;
						
					case 4 :
						htmltext = "32569-08.htm";
						break;
						
					case 5 :
						htmltext = "32569-10.htm";
						break;
				}
			}
		}
		
		else if (npc.getNpcId() == ERIC)
		{
			if (st.getState() == State.STARTED)
			{
				switch (st.getInt("cond"))
				{
					case 2 :
						htmltext = "32570-01.htm";
						break;
				
					case 3 :
						htmltext = "32570-03.htm";
						break;
				}
			}
		}
		
		else if (npc.getNpcId() == ATHEBALDT)
		{
			if (st.getState() == State.STARTED)
			{
				if (st.getInt("cond") == 6)
					htmltext = "30760-01.htm";
			}
		}
		
		return htmltext;
	}
	
	@Override
	public String onKill(L2Npc npc, L2PcInstance player, boolean isPet)
	{
		QuestState st = player.getQuestState(qn);
		
		if (st == null)
			return super.onKill(npc, player, isPet);
		
		if (npc.getNpcId() == SHILENSEVIL && st.getInt("cond") == 4)
		{
			ShilensevilOnSpawn = false;
			npc.broadcastPacket(new NpcSay(npc.getObjectId(), 0, npc.getNpcId(), "�u" + player.getName() + "�v�I�{�b�ڴN���A�@�B..���L�A�ڤ@�w�|���A���C"));
			npc.broadcastPacket(new NpcSay(CAIN, 0, CAIN, "�ܦn�A�u" + player.getName() + "�v�C�ܰ��������o�W�A�C"));
			st.giveItems(SCULPTURE, 1);
			st.set("cond", "5");
			st.playSound("ItemSound.quest_middle");
		}
		
		return super.onKill(npc, player, isPet);
	}
	
	public Q193_SevenSignDyingMessage(int questId, String name, String descr)
	{
		super(questId, name, descr);
		
		addStartNpc(HOLLINT);
		addTalkId(HOLLINT);
		addTalkId(CAIN);
		addTalkId(ERIC);
		addTalkId(ATHEBALDT);
		addKillId(SHILENSEVIL);
		
		questItemIds = new int[]
		{ JACOB_NECK, DEADMANS_HERB, SCULPTURE };
	}
	
	public static void main(String[] args)
	{
		new Q193_SevenSignDyingMessage(193, qn, "�C�ʦL�A���e���T��");
	}
}
