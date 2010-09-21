# pmq
import sys
from com.l2jserver.gameserver.model.quest import State
from com.l2jserver.gameserver.model.quest import QuestState
from com.l2jserver.gameserver.model.quest.jython import QuestJython as JQuest

qn = "700_CursedLife"

# ���ȸ��
# 700	1	���A�G���ͩR	�ѩ���A�G���ͩR	�_��Ǵ��P���p�X��a���X�Y�޲z�L--�h�L���ǥ��A�n�D���˥X�{�b�������ئa�ϤW�Ū����J�M�L����U�Ǫ��̡A�Ӹѩ񨺨Ǩ���A�G�ӥ��h�ۥѪ��ͩR�̡C\n\n�n�y�����ؼЩǪ�-���J�B�����N�B�s�N\n	3	13872	13873	13874												3	0	0	0												-174600	219711	4424	75	0	0	�������� �F��Ű�	1	1	1	32560	-186072	241295	2613	�S�����󭭨�	�_��Ǵ��P���p�X��a���X�Y�޲z��--�h�L���ǥ����b�M��_�I�a�A�]���L�h���O�L��������H�A�{�b�o���F���A�G���]���A�]���Ʊ��ǥѶа��L�̡A�M�ᬰ�L�̧�^�ۥѡCť�������]���~�M�|�]���X�{�b�P�򪺥���@�ӥͩR...	0																																																																						0						0	10273	0	285	1	1	57											1	0											

#NPC
NPC = 32560

class Quest (JQuest) :

	def __init__(self,id,name,descr):
		JQuest.__init__(self,id,name,descr)
		self.questItemIds = []

	def onAdvEvent (self,event,npc, player) :
		htmltext = event
		st = player.getQuestState(qn)
		if not st : return
		if event == "32560-00.htm" :
			st2 = player.getQuestState("10273_GoodDayToFly")
			if st2 and st2.getState() == State.COMPLETED and player.getLevel() >= 75 :
				htmltext = "32560-01.htm"
			else :
				htmltext = "32560-00.htm"
				st.exitQuest(1) 
		elif event == "32560-04.htm" :
			st.set("cond","1")
			st.setState(State.STARTED)
			st.playSound("ItemSound.quest_accept")
		return htmltext

	def onTalk (self,npc,player):
		htmltext = "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>"
		st = player.getQuestState(qn)
		if not st : return htmltext

		npcId = npc.getNpcId()
		id = st.getState()
		cond = st.getInt("cond")

		if id == State.CREATED :
			if npcId == 32560 and cond == 0 :
				htmltext = "32560-01.htm"
		elif id == State.STARTED :
			if npcId == 32560 and cond == 1 :
				htmltext = "32560-05.htm"
		return htmltext

QUEST		= Quest(700,qn,"���A�G���ͩR")

QUEST.addStartNpc(NPC)

QUEST.addTalkId(NPC)
