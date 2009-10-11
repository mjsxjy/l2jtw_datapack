# pmq
import sys
from net.sf.l2j.gameserver.model.quest          import State
from net.sf.l2j.gameserver.model.quest          import QuestState
from net.sf.l2j.gameserver.model.quest.jython   import QuestJython as JQuest
from net.sf.l2j.gameserver.model.actor.instance import L2PcInstance

qn = "HB_Deltuva"

DELTUVA = 32313

class Quest (JQuest) :

	def __init__(self,id,name,descr):
		JQuest.__init__(self,id,name,descr)

	def onTalk (self,npc,player):
		st = player.getQuestState(qn)
		if not st: return

		npcId = npc.getNpcId()
		st1 = player.getQuestState("132_MatrasCuriosity")
		htmltext = "<html><body>�D���g�ڡG<br>�ݨӧA���٨S���i�h�L���K������C�]���ӹL�M�I�A�ҥH�L�k���A�̶i�h�C</body></html>"
		if st1 :
			if npcId == DELTUVA and st1.getState() == State.COMPLETED :
				player.teleToLocation(17957, 283361, -9705)
				htmltext = "<html><body>�D���g�ڡG<br><font color=\"FF0000\">�]�o�O���նǰe�|����ˡI�^</font></body></html>"
				st.exitQuest(1)
		st.exitQuest(1)
		return htmltext

QUEST = Quest(-1, qn, "hellbound")

QUEST.addStartNpc(DELTUVA)
QUEST.addTalkId(DELTUVA)