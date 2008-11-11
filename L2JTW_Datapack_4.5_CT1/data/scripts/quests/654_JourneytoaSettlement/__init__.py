# Made in Taiwan

import sys
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest

qn = "654_JourneytoaSettlement"

# NPC
NAMELESS_SPIRIT 	= 31453 # �L�W���F��
# MOBS Canyon Antelope
CANYON_ANTELOPE 	= [21294, 21295] # �s���ܦ�
# ITEMS
ANTELOPE_SKIN		= 8072 # �ܦϥ֭�
SCROLL			= 8073 # �ܵY���F�����ɯ}�G��

class Quest (JQuest) :

 def __init__(self,id,name,descr):
     JQuest.__init__(self,id,name,descr)
     self.questItemIds = [ANTELOPE_SKIN]
  
 def onEvent(self, event, st):
    htmltext = event
    if event == "31453-02.htm" :
       st.set("cond","1")
       st.setState(State.STARTED)
    elif event == "31453-03.htm" :
       st.set("cond","2")
       st.playSound("ItemSound.quest_accept")
    elif event == "31453-05.htm" :
       st.giveItems(SCROLL,1)
       st.takeItems(ANTELOPE_SKIN,1)
       st.unset("cond")
       st.setState(State.COMPLETED)
       st.playSound("ItemSound.quest_finish")
    return htmltext

 def onTalk (self,npc,player):
    htmltext="<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>"
    st = player.getQuestState(qn)
    st2 = player.getQuestState("119_LastImperialPrince")
    if not st : return htmltext
    npcId = npc.getNpcId()
    cond = st.getInt("cond")
    if st.getState() == State.CREATED :
       if st2:
	  if st2.getState() == State.COMPLETED and player.getLevel() > 73 :
	     htmltext= str(npcId)+"-01.htm"
	  else:
	     htmltext= str(npcId)+"-00.htm"
	     st.exitQuest(1)
       else:
	  htmltext= str(npcId)+"-00.htm"
	  st.exitQuest(1)
    elif st.getState() == State.STARTED:
       if cond == 1 :
	  htmltext = str(npcId)+"-02.htm"
       elif cond == 2 :
	  htmltext = str(npcId)+"-03a.htm"
       elif cond == 3 :
	  htmltext = str(npcId)+"-04.htm"
    elif st.getState() == State.COMPLETED:
       htmltext= str(npcId)+"-01.htm"
    return htmltext

 def onKill(self,npc,player,isPet):
    st = player.getQuestState(qn)
    if not st: return
    if st.getState() == State.STARTED :
       if st.getInt("cond") == 2 :
	  if st.getRandom(100) < 5 :
	     st.set("cond","3")
	     st.giveItems(ANTELOPE_SKIN,1)
	     st.playSound("ItemSound.quest_middle")
    return

QUEST	    = Quest(654,qn,"�ﱵ�̲ת�����")

QUEST.addStartNpc(NAMELESS_SPIRIT)
QUEST.addTalkId(NAMELESS_SPIRIT)

for mob in CANYON_ANTELOPE :
    QUEST.addKillId(mob)
