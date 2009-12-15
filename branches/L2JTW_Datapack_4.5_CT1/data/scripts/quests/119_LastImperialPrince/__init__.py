# Made in Taiwan

import sys
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest

qn = "119_LastImperialPrince"

#NPC
SPIRIT	= 31453 # �L�W���F��
DEVORIN	= 32009 # �L�ܵY

#ITEM
BROOCH	= 7262 # �}�ª��ݰw

#REWARD
ADENA	= 57 # ����
AMOUNT	= 68787 # �ƶq

class Quest (JQuest) :

  def __init__(self,id,name,descr): JQuest.__init__(self,id,name,descr)

  def onEvent (self,event,st) :
     htmltext = event
     if event == "31453-04.htm" :
        st.set("cond","1")
        st.setState(State.STARTED)
        st.playSound("ItemSound.quest_accept")
     elif event == "32009-03.htm" :
        st.set("cond","2")
        st.playSound("ItemSound.quest_middle")
     elif event == "31453-07.htm" :
        st.giveItems(ADENA,AMOUNT)
        st.unset("cond")
        st.setState(State.COMPLETED)
        st.playSound("ItemSound.quest_finish")
     return htmltext

  def onTalk (self,npc,player):
     htmltext = "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>"
     st = player.getQuestState(qn)
     if not st : return htmltext
     id = st.getState()
     cond = st.getInt("cond")
     npcId = npc.getNpcId()
     if id == State.CREATED :
        if player.getLevel() > 73 and st.getQuestItemsCount(BROOCH) :
           htmltext = str(npcId)+"-01.htm"
        else :
           htmltext = str(npcId)+"-00.htm"
           st.exitQuest(1)
     elif id == State.STARTED :
        if npcId == SPIRIT :
           if cond == 1 :
              htmltext = str(npcId)+"-04.htm"
           if cond == 2 :
              htmltext = str(npcId)+"-05.htm"
        elif npcId == DEVORIN :
           if cond == 1 :
              htmltext = str(npcId)+"-01.htm"
           if cond == 2 :
              htmltext = str(npcId)+"-03.htm"
     elif id == State.COMPLETED :
        htmltext = "<html><body>�o�O�w�g���������ȡC</body></html>"
     return htmltext

QUEST     = Quest(119,qn,"�̫᪺�Ӥl")

QUEST.addStartNpc(SPIRIT)
QUEST.addTalkId(SPIRIT)
QUEST.addTalkId(DEVORIN)
