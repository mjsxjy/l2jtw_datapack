# Made by disKret
import sys
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest

qn = "15_SweetWhisper"

#NPC
VLADIMIR = 31302
HIERARCH = 31517
M_NECROMANCER = 31518

class Quest (JQuest) :

 def __init__(self,id,name,descr): JQuest.__init__(self,id,name,descr)

 def onAdvEvent (self,event,npc, player) :
   htmltext = event
   st = player.getQuestState(qn)
   if not st : return
   cond = st.getInt("cond")
   if event == "31302-1.htm" :
     st.set("cond","1")
     st.setState(State.STARTED)
     st.playSound("ItemSound.quest_accept")
   if event == "31518-1.htm" :
     if cond == 1 :
       st.set("cond","2")
       st.playSound("ItemSound.quest_middle")
   if event == "31517-1.htm" :
     if cond == 2 :
       st.addExpAndSp(350531,28204)
       st.unset("cond")
       st.playSound("ItemSound.quest_finish")
       st.exitQuest(False)
   return htmltext

 def onTalk (self,npc,player):
   htmltext = "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>"
   st = player.getQuestState(qn)
   if not st : return htmltext

   npcId = npc.getNpcId()
   cond = st.getInt("cond")
   id = st.getState()
   if id == State.COMPLETED :
        htmltext = "<html><body>�o�O�w�g���������ȡC</body></html>"
   elif id == State.CREATED :
       if player.getLevel() >= 60 :
         htmltext = "31302-0.htm"
       else:
         htmltext = "31302-0a.htm"
         st.exitQuest(1)
   elif id == State.STARTED :
       if npcId == VLADIMIR and cond == 1:
         htmltext = "31302-1a.htm"
       elif npcId == M_NECROMANCER and cond == 1 :
         htmltext = "31518-0.htm"
       elif npcId == M_NECROMANCER and cond == 2 :
         htmltext = "31518-1a.htm"
       elif npcId == HIERARCH and cond == 2 :
         htmltext = "31517-0.htm"
   return htmltext

QUEST       = Quest(15,qn,"�������ӻy")


QUEST.addStartNpc(31302)
QUEST.addTalkId(31302)

QUEST.addTalkId(31517)
QUEST.addTalkId(31518)