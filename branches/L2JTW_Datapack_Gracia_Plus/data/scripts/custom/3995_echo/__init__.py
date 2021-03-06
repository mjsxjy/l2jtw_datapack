# Formerly based on Elektra's script
# updated by DrLecter for the Official L2J Datapack Project.
# Visit http://www.l2jdp.com/forum// for more details.

qn = "3995_echo"

NPCS        = [31042,31043]
ADENA       = 57
COST        = 200

QuestId     = 3995
QuestName   = "echo"
QuestDesc   = "custom"

#score:[crystal,msg_ok,msg_noadena,msg_noscore]
LIST={
4410:[4411,"01","02","03"],
4409:[4412,"04","05","06"],
4408:[4413,"07","08","09"],
4420:[4414,"10","11","12"],
4421:[4415,"13","14","15"],
4419:[4417,"16","05","03"],
4418:[4416,"17","05","03"]
}


import sys
from com.l2jserver.gameserver.model.quest import State
from com.l2jserver.gameserver.model.quest import QuestState
from com.l2jserver.gameserver.model.quest.jython import QuestJython as JQuest

class Quest (JQuest) :

 def __init__(self,id,name,descr): JQuest.__init__(self,id,name,descr)

 def onAdvEvent (self,event,npc,player) :
    st = player.getQuestState(qn)
    if not (st and event.isdigit()): return
    score=int(event)
    if score in LIST.keys() :
      crystal,ok,noadena,noscore=LIST[score]
      npcId = str(npc.getNpcId())
      if not st.getQuestItemsCount(score) :
         htmltext=npcId+"-"+noscore+".htm"
      elif st.getQuestItemsCount(ADENA) < COST :
         htmltext=npcId+"-"+noadena+".htm"
      else :
         st.takeItems(ADENA,COST)
         st.giveItems(crystal,1)
         htmltext=npcId+"-"+ok+".htm"
    else :
      htmltext=""
    st.exitQuest(1)
    return htmltext

 def onFirstTalk (self,npc,player): # rocknow �ץ�
    st = player.getQuestState(qn)
    if not st :
       st = self.newQuestState(player)
    npcId = npc.getNpcId()
    if npcId == 31042 :
        htmltext = "1.htm"
    if npcId == 31043 :
        htmltext = "2.htm"
    return htmltext


QUEST       = Quest(-1,qn,QuestDesc)

for npc in NPCS:
   QUEST.addStartNpc(npc)
   QUEST.addFirstTalkId(npc)
   QUEST.addTalkId(npc)