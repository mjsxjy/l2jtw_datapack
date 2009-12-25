# pmq
import sys
from com.l2jserver.gameserver.model.actor.instance import L2PcInstance
from com.l2jserver.gameserver.model.quest import State
from com.l2jserver.gameserver.model.quest import QuestState
from com.l2jserver.gameserver.model.quest.jython import QuestJython as JQuest

qn = "1108_enter_hellbound_island"

WARPGATES = [32314,32315,32316,32317,32318,32319]

class Quest (JQuest) :

 def __init__(self,id,name,descr):
   JQuest.__init__(self,id,name,descr)

 def onTalk (self,npc,player):
   st = player.getQuestState(qn)
   if not st: return

   npcId = npc.getNpcId()
   st1 = player.getQuestState("133_ThatsBloodyHot")
   st2 = player.getQuestState("130_PathToHellbound")
   if st1 :
     if npcId in WARPGATES and st1.getState() == State.COMPLETED :
       player.teleToLocation(-11319, 236431, -3268)
       htmltext = "<html><body>���t�����G<br><font color=\"FF0000\">�]�a����ɪ��Ҧ��\��|����ˡI�^</font></body></html>"
     else :
       htmltext = "<html><body>���t�����G<br>����q�L���A�ݨӹ��O�ݭn��L����C</body></html>"
   elif st2 :
     if npcId in WARPGATES and st2.getState() == State.COMPLETED :
       player.teleToLocation(-11319, 236431, -3268)
       htmltext = "<html><body>���t�����G<br><font color=\"FF0000\">�]�a����ɪ��Ҧ��\��|����ˡI�^</font></body></html>"
     else :
       htmltext = "<html><body>���t�����G<br>����q�L���A�ݨӹ��O�ݭn��L����C</body></html>"
   else :
     htmltext = "<html><body>���t�����G<br>����q�L���A�ݨӹ��O�ݭn��L����C</body></html>"
   st.exitQuest(1)
   return htmltext

QUEST       = Quest(-1,qn,"Teleports")

for npcId in WARPGATES :
    QUEST.addStartNpc(npcId)
    QUEST.addTalkId(npcId)
