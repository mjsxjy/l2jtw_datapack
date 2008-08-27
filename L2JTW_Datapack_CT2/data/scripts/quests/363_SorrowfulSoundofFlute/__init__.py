# Jovial Accordian Written By Elektra
# Fixed by mr
import sys
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest

qn = "363_SorrowfulSoundofFlute"

class Quest (JQuest) :

 def __init__(self,id,name,descr):
     JQuest.__init__(self,id,name,descr)
     self.questItemIds = [4319]

 def onEvent (self,event,st) :
    htmltext = event
    if event == "1" :
        st.set("cond","1")
        st.setState(State.STARTED)
        st.playSound("ItemSound.quest_accept")
        htmltext = "30956_2.htm"
    elif event == "5" :
        st.giveItems(4420,1)
        st.playSound("ItemSound.quest_finish")
        st.exitQuest(1)
        htmltext = "30956_5.htm"
    return htmltext


 def onTalk (self,npc,player):
   htmltext = "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>"
   st = player.getQuestState(qn)
   if not st : return htmltext

   npcId = npc.getNpcId()
   id = st.getState()
   if npcId != 30956 and id != State.STARTED : return htmltext

   if id == State.CREATED :
     st.set("cond","0")
   if npcId == 30956 and st.getInt("cond") == 0 :
        htmltext = "30956_1.htm"
   elif npcId == 30956 and st.getInt("cond") == 1 :
        htmltext = "<html><body>�Ч��K�K�v�Ŷ��ִ�...</body></html>"
   elif npcId == 30595 and st.getInt("cond") == 1 :
        st.set("cond","2")
        htmltext = "30595_1.htm"
   elif npcId == 30595 and st.getInt("cond") > 1 :
        htmltext = "<html><body>�^�h�䭵�֮a�R�R�Y...</body></html>"
   elif npcId == 30956 and st.getInt("cond") == 2 :
        st.giveItems(4319,1)
        st.set("cond","3")
        htmltext = "30956_3.htm"
   elif npcId == 30956 and st.getInt("cond") == 3 :
        htmltext = "<html><body>�Ч䭵�֮a�ں��ڧ�...</body></html>"
   elif npcId == 30959 and st.getInt("cond") == 3 :
        st.takeItems(4319,1)
        st.set("cond","4")
        htmltext = "30959_1.htm"
   elif npcId == 30959 and st.getInt("cond") == 4 :
        htmltext = "<html><body>�A�^�h�䭵�֮a�R�R�Y...</body></html>"
   elif npcId == 30956 and st.getInt("cond") == 4 :
        htmltext = "30956_4.htm"
   return htmltext


QUEST       = Quest(363,qn,"�d�˪����n")

QUEST.addStartNpc(30956)
QUEST.addTalkId(30956)

QUEST.addTalkId(30595)
QUEST.addTalkId(30959)
