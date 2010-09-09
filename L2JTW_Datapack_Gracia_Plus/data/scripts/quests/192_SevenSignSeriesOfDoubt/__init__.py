#Created by Bloodshed
import sys

from com.l2jserver.gameserver.model.quest           import State
from com.l2jserver.gameserver.model.quest           import QuestState
from com.l2jserver.gameserver.model.quest.jython    import QuestJython as JQuest
from com.l2jserver.gameserver.network.serverpackets import ExStartScenePlayer

qn = "192_SevenSignSeriesOfDoubt"

# NPCs
CROOP        = 30676
HECTOR       = 30197
STAN         = 30200
CORPSE       = 32568
HOLLINT      = 30191
# ITEMS
CROOP_INTRO  = 13813
JACOB_NECK   = 13814
CROOP_LETTER = 13815

class Quest (JQuest) :

	def __init__(self,id,name,descr):
		JQuest.__init__(self,id,name,descr)
		self.questItemIds = [CROOP_INTRO, JACOB_NECK, CROOP_LETTER]

	def onAdvEvent (self,event,npc,player) :
		htmltext = event
		st = player.getQuestState(qn)
		if not st : return

		if event == "30676-03.htm" :
			st.set("cond","1")
			st.setState(State.STARTED)
			st.playSound("ItemSound.quest_accept")
		elif event.isdigit() :
			if int(event) == 8 :
				st.set("cond","2")
				st.playSound("ItemSound.quest_middle")
				player.showQuestMovie(int(event))
				return ""
		elif event == "30197-03.htm" :
			st.set("cond","4")
			st.takeItems(CROOP_INTRO,1)
			st.playSound("ItemSound.quest_middle")
		elif event == "30200-04.htm" :
			st.set("cond","5")
			st.playSound("ItemSound.quest_middle")
		elif event == "32568-02.htm" :
			st.set("cond","6")
			st.giveItems(JACOB_NECK,1)
			st.playSound("ItemSound.quest_middle")
		elif event == "30676-12.htm" :
			st.set("cond","7")
			st.takeItems(JACOB_NECK,1)
			st.giveItems(CROOP_LETTER,1)
			st.playSound("ItemSound.quest_middle")
		elif event == "30191-03.htm" :
			if player.getLevel() < 79 :
				htmltext = "<html><body>Only characters who are <font color=\"LEVEL\">level 79</font> or higher may complete this quest.</body></html>"
			else :
				st.takeItems(CROOP_LETTER,1)
				st.addExpAndSp(52518015,5817677)
				st.unset("cond")
				st.setState(State.COMPLETED)
				st.exitQuest(False)
				st.playSound("ItemSound.quest_finish")
		return htmltext

	def onTalk (self,npc,player) :
		htmltext = "<html><body>目前沒有執行任務，或條件不符。</body></html>" 
		st = player.getQuestState(qn) 
		if not st : return htmltext

		npcId = npc.getNpcId()
		id = st.getState()
		cond = st.getInt("cond")

		if id == State.COMPLETED :
			if npcId == CROOP :
				htmltext = "30676-13.htm"
		elif id == State.CREATED :
			if npcId == CROOP and cond == 0:
				if player.getLevel() >= 79 :
					htmltext = "30676-01.htm"
				else :
					htmltext = "30676-00.htm"
					st.exitQuest(True)
		elif id == State.STARTED :
			if npcId == CROOP :
				if cond == 1 :
					htmltext = "30676-04.htm"
				elif cond == 2 :
					htmltext = "30676-05.htm"
					st.set("cond","3")
					st.playSound("ItemSound.quest_middle")
					st.giveItems(CROOP_INTRO,1)
				elif cond in [3,4,5] :
					htmltext = "30676-06.htm"
				elif cond == 6 :
					htmltext = "30676-07.htm"
			elif npcId == HECTOR :
				if cond == 3 :
					htmltext = "30197-01.htm"
				elif cond in [4,5,6,7] :
					htmltext = "30197-04.htm"
			elif npcId == STAN :
				if cond == 4 :
					htmltext = "30200-01.htm"
				elif cond in [5,6,7] :
					htmltext = "30200-05.htm"
			elif npcId == CORPSE :
				if cond in [0,1,2,3,4] :
					htmltext = "32568-03.htm"
				elif cond == 5 :
					htmltext = "32568-01.htm"
			elif npcId == HOLLINT :
				if cond == 7 :
					htmltext = "30191-01.htm"
		return htmltext

QUEST	= Quest(192,qn,"七封印，可疑的連續死亡事件")

QUEST.addStartNpc(CROOP)
QUEST.addStartNpc(HOLLINT)
QUEST.addTalkId(CROOP)
QUEST.addTalkId(HECTOR)
QUEST.addTalkId(STAN)
QUEST.addTalkId(CORPSE)
QUEST.addTalkId(HOLLINT)