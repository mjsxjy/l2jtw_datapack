# 2010-06-26 by Gnacik
# Based on official server Franz

import sys
from com.l2jserver import Config
from com.l2jserver.gameserver.model.quest import State
from com.l2jserver.gameserver.model.quest import QuestState
from com.l2jserver.gameserver.model.quest.jython import QuestJython as JQuest

qn = "701_Proof_Of_Existence"

# ���ȸ��
# 701	1	�s�b������	���h�]��	�_��Ǵ��P���p�X��a���԰��k�v�����^�����D�A���C�h�L�h�𪺭�]�O�Ӧ۩�Z�u�k��--�R���Գo���]���C���y�o����A�ҩ��o���O�h�L�̻ݭn�p���P�쮣�ߪ���H�C�@�����\�y�������ҡA�a�^�Z�u�k�������y�B�`�̿��e�C\n\n�n�y�����ؼЩǪ�-�Z�u�k��--�R���ԡB�B�尩�e�B�B���L��\n	2	13875	13876													2	0	0													-181958	208968	4424	78	0	0	�������� �F��Ű�	1	1	1	32559	-186109	242500	2550	�S�����󭭨�	�b�������ئa�Ϫ���汵���ȫ�^�Ӫ��h�L�̥ظ@�F�]���A�]���x�o��ӭx�έ��C�F�h��A�Ӭ_��Ǵ��P���p�X��a���԰��k�v�����^����������ߡA��O���b�M��_�I�a�ӸѨM����...	0																																																																						0						0	10273	0	285	1	1	57											1	0											

# NPCs
ARTIUS = 32559

# ITEMS
DEADMANS_REMAINS = 13875

# MOBS
MOBS = [22606,22607,22608,22609]

# SETTINGS
DROP_CHANCE = 80

class Quest (JQuest) :
	def __init__(self,id,name,descr):
		JQuest.__init__(self,id,name,descr)
		self.questItemIds = [DEADMANS_REMAINS]

	def onAdvEvent(self, event, npc, player) :
		htmltext = event
		st = player.getQuestState(qn)
		if not st : return

		if event == "32559-03.htm" :
			st.setState(State.STARTED)
			st.set("cond","1")
			st.playSound("ItemSound.quest_accept")
		elif event == "32559-quit.htm" :
			st.unset("cond")
			st.exitQuest(True)
			st.playSound("ItemSound.quest_finish")
		return htmltext

	def onTalk (self, npc, player) :
		htmltext = "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>"
		st = player.getQuestState(qn)
		if not st : return htmltext

		cond = st.getInt("cond")

		if npc.getNpcId() == ARTIUS :
			first = player.getQuestState("10273_GoodDayToFly")
			if first and first.getState() == State.COMPLETED and st.getState() == State.CREATED and player.getLevel() >= 78 :
				htmltext = "32559-01.htm"
			elif cond == 1 :
				itemcount = st.getQuestItemsCount(DEADMANS_REMAINS)
				if itemcount > 0 :
					st.takeItems(DEADMANS_REMAINS, -1)
					st.rewardItems(57,itemcount * 2500)
					st.playSound("ItemSound.quest_itemget")
					htmltext = "32559-06.htm"
				else :
					htmltext = "32559-04.htm"
			elif cond == 0 :
				htmltext = "32559-00.htm"
		return htmltext

	def onKill(self, npc, player, isPet) :
		st = player.getQuestState(qn)
		if not st : return

		if st.getInt("cond") == 1 and npc.getNpcId() in MOBS :
			numItems, chance = divmod(DROP_CHANCE * Config.RATE_QUEST_DROP,100)
			if st.getRandom(100) < chance :
				numItems += 1
			if numItems :
				st.giveItems(DEADMANS_REMAINS,1)
				st.playSound("ItemSound.quest_itemget")
		return

QUEST	= Quest(701,qn,"�s�b������")

QUEST.addStartNpc(ARTIUS)
QUEST.addTalkId(ARTIUS)

for i in MOBS :
	QUEST.addKillId(i)