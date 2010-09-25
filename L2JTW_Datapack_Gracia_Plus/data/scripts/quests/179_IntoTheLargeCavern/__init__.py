# Update by pmq 14-09-2010

import sys
from com.l2jserver.gameserver.instancemanager      import InstanceManager
from com.l2jserver.gameserver.model.actor.instance import L2PcInstance
from com.l2jserver.gameserver.model.entity         import Instance
from com.l2jserver.gameserver.model.quest          import State
from com.l2jserver.gameserver.model.quest          import QuestState
from com.l2jserver.gameserver.model.quest.jython   import QuestJython as JQuest
from com.l2jserver.util                            import Rnd

qn = "179_IntoTheLargeCavern"

#NPC'S
KEKROPUS             = 32138 # ���� �ͧJ������
MENACING_MACHINE     = 32258 # ���j����˸m
#ITEM
PUMA_SKIN_SHIRT      = 10021 # �������Ũ�m
PUMA_SKIN_GAITERS    = 10022 # ��������H��
RED_CRESCENT_EARRING = 10122 # ���s�����
MECKLACE_OF_DEVOTION = 10123 # �^�m����
RING_OF_DEVOTION     = 10124 # �^�m�٫�

class Quest (JQuest) :

	def __init__(self,id,name,descr):
		JQuest.__init__(self,id,name,descr)

	def onAdvEvent (self,event,npc,player) :
		htmltext = event
		st = player.getQuestState(qn)
		if not st : return

		if event == "32138-03.htm" :
			st.set("cond","1")
			st.setState(State.STARTED)
			st.playSound("ItemSound.quest_accept")
		elif event == "32258-08.htm" :
			st.giveItems(PUMA_SKIN_SHIRT, 1)
			st.giveItems(PUMA_SKIN_GAITERS, 1)
			st.unset("cond")
			st.exitQuest(False)
			st.playSound("ItemSound.quest_finish")
		elif event == "32258-09.htm" :
			if st.getRandom(100) < 50 :
				st.giveItems(MECKLACE_OF_DEVOTION, 1)
				st.giveItems(RING_OF_DEVOTION, 1)
			else :
				st.giveItems(RED_CRESCENT_EARRING, 2)
			st.unset("cond")
			st.exitQuest(False)
			st.playSound("ItemSound.quest_finish")
		elif event == "quit" :
			instanceId = player.getInstanceId()
			instance = InstanceManager.getInstance().getInstance(instanceId)
			player.setInstanceId(0)
			player.teleToLocation(-74058,52040,-3680)
			htmltext = ""
		return htmltext

	def onTalk (self,npc,player):
		htmltext = "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>"
		st = player.getQuestState(qn)
		if not st: return htmltext

		npcId = npc.getNpcId()
		id = st.getState()
		cond = st.getInt("cond")

		if id == State.COMPLETED :
			if npcId == KEKROPUS :
				htmltext = "<html><body>�o�O�w�g���������ȡC</body></html>"
			elif npcId == MENACING_MACHINE :
				htmltext = "32258-10.htm"
		elif id == State.CREATED :
			if npcId == KEKROPUS and cond == 0 :
				if player.getRace().ordinal() == 5 :
					st1 = player.getQuestState("178_IconicTrinity")
					if st1 and st1.getState() == State.COMPLETED and st.getPlayer().getLevel() >= 17 :
						htmltext = "32138-01.htm"
					else :
						htmltext = "32138-01a.htm"
						st.exitQuest(1)
				else :
					htmltext = "32138-00.htm"
					st.exitQuest(1)
		elif id == State.STARTED:
			if npcId == KEKROPUS and cond == 1 :
				htmltext = "32138-05.htm"
			elif npcId == MENACING_MACHINE and cond == 1 :
				htmltext = "32258-01.htm"
		return htmltext

QUEST		= Quest(179,qn,"�i�J�j�Ŭ}")

QUEST.addStartNpc(KEKROPUS)

QUEST.addTalkId(KEKROPUS)
QUEST.addTalkId(MENACING_MACHINE)