# Made by Polo - Have fun! - Fixed by BiTi
# v0.3.1 by DrLecter
import sys
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest

qn = "636_TruthBeyond"

#Npc
ELIYAH = 31329
FLAURON = 32010

#Items
MARK = 8064

class Quest (JQuest) :

 def __init__(self,id,name,descr): JQuest.__init__(self,id,name,descr)

 def onEvent (self,event,st) :
    htmltext = event
    if htmltext == "31329-04.htm" :
       st.set("cond","1")
       st.setState(State.STARTED)
       st.playSound("ItemSound.quest_accept")
    elif htmltext == "32010-02.htm" :
       st.playSound("ItemSound.quest_finish")
       st.giveItems(MARK,1)
# pmq�ץ� st.unset("cond")
       st.exitQuest(1)
    return htmltext

 def onTalk (self,npc,player):
   st = player.getQuestState(qn)
   htmltext = "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>"
   if not st : return htmltext                                                                      # pmq�ץ�
                                                                                                    # pmq�ץ�
   npcId = npc.getNpcId()                                                                           # pmq�ץ�
   id = st.getState()                                                                               # pmq�ץ�
   cond = st.getInt("cond")                                                                         # pmq�ץ�
   if st.getQuestItemsCount(MARK) or st.getQuestItemsCount(8065) or st.getQuestItemsCount(8067) :   # pmq�ץ�
       htmltext = "31329-mark.htm"                                                                  # pmq�ץ�
       st.exitQuest(1)                                                                              # pmq�ץ�
   elif id == State.CREATED:                                                                        # pmq�ץ�
       if player.getLevel()>72 :                                                                    # pmq�ץ�
         htmltext = "31329-02.htm"                                                                  # pmq�ץ�
       else:
         htmltext = "31329-01.htm"
         st.exitQuest(1)
   elif id == State.STARTED :                                                                       # pmq�ץ�
       if npcId == ELIYAH :
         htmltext = "31329-05.htm"
       elif npcId == FLAURON :
         if cond == 1 :
           htmltext = "32010-01.htm"
           st.set("cond","2")
         else :
           htmltext = "32010-02.htm"
   return htmltext
   

QUEST       = Quest(636,qn,"���v�᪺�u��")


QUEST.addStartNpc(ELIYAH)

QUEST.addTalkId(ELIYAH)
QUEST.addTalkId(FLAURON)
