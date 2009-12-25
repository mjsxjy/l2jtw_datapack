# Made by disKret
import sys
from com.l2jserver.gameserver.model.quest import State
from com.l2jserver.gameserver.model.quest import QuestState
from com.l2jserver.gameserver.model.quest.jython import QuestJython as JQuest

qn = "33_MakeAPairOfDressShoes"

LEATHER = 1882
THREAD = 1868
ADENA = 57
DRESS_SHOES_BOX = 7113

class Quest (JQuest) :

 def __init__(self,id,name,descr): JQuest.__init__(self,id,name,descr)

 def onEvent (self,event,st) :
   htmltext = event
   if event == "30838-1.htm" :
     st.set("cond","1")
     st.setState(State.STARTED)
     st.playSound("ItemSound.quest_accept")
   if event == "31520-1.htm" :
     st.set("cond","2")
     st.playSound("ItemSound.quest_accept")   #pmq�ק�
   if event == "30838-3.htm" :
     st.set("cond","3")
     st.playSound("ItemSound.quest_accept")   #pmq�ק�
   if event == "30838-5.htm" :
     if st.getQuestItemsCount(LEATHER) >= 200 and st.getQuestItemsCount(THREAD) >= 600 and st.getQuestItemsCount(ADENA) >= 200000 :
       st.takeItems(LEATHER,200)
       st.takeItems(THREAD,600)
       st.takeItems(ADENA,200000)
       st.playSound("ItemSound.quest_accept") #pmq�ק�
       st.set("cond","4")
     else :
       htmltext = "30838-3a.htm"              #pmq�W�[���
   if event == "30164-1.htm" :
     if st.getQuestItemsCount(ADENA) >= 300000 :
       st.takeItems(ADENA,300000)
       st.set("cond","5")
       st.playSound("ItemSound.quest_accept") #pmq�ק�
     else :
       htmltext = "30164-1b.htm"              #pmq�W�[���
   if event == "30838-7.htm" :
     st.giveItems(DRESS_SHOES_BOX,1)
     st.playSound("ItemSound.quest_finish")
     st.unset("cond")
     st.exitQuest(False)
   return htmltext

 def onTalk (self,npc,player):
   htmltext = "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>"
   st = player.getQuestState(qn)
   if not st : return htmltext

   npcId = npc.getNpcId()
   id = st.getState()
   cond = st.getInt("cond")
   if id == State.COMPLETED:
     htmltext = "<html><body>�o�O�w�g���������ȡC</body></html>"
   elif npcId == 30838 and cond == 0 and st.getQuestItemsCount(DRESS_SHOES_BOX) == 0 :
     fwear=player.getQuestState("37_PleaseMakeMeFormalWear")
     if fwear :
       if fwear.get("cond") == "7" :
         htmltext = "30838-0.htm"
       else:
         htmltext = "30838-8.htm"  #pmq�W�[���
         st.exitQuest(1)
     else:
       htmltext = "30838-8.htm"    #pmq�W�[���
       st.exitQuest(1)
   elif id == State.STARTED :    
       if npcId == 31520 and cond == 1 :
         htmltext = "31520-0.htm"
       elif npcId == 31520 and cond == 2 :
         htmltext = "31520-1a.htm"  #pmq�W�[���
       elif npcId == 30838 and cond == 1 :
         htmltext = "30838-1a.htm"  #pmq�W�[���
       elif npcId == 30838 and cond == 2 :
         htmltext = "30838-2.htm"
       elif npcId == 30838 and cond == 3 :
         htmltext = "30838-4.htm"
       elif npcId == 30164 and cond == 4 :
         htmltext = "30164-0.htm"
       elif npcId == 30838 and cond == 4 :
         htmltext = "30838-5a.htm"  #pmq�W�[���
       elif npcId == 30164 and cond == 5 :
         htmltext = "30164-1a.htm"  #pmq�W�[���
       elif npcId == 30838 and cond == 5 :
         htmltext = "30838-6.htm"
   return htmltext

QUEST       = Quest(33,qn,"�����ڻs�@���åΪ��־c")


QUEST.addStartNpc(30838)
QUEST.addTalkId(30838)

QUEST.addTalkId(30164)
QUEST.addTalkId(31520)