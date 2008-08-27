# By L2J_JP SANDMAN
import sys
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest

qn = "654_JourneytoaSettlement"

#NPC
SPIRIT      = 31453     #�L�W���F��

#TARGET
TARGET_1    = 21294     #�s���ܦ�
TARGET_2    = 21295     #�s���ܦϥ���

#ITEM
ITEM        = 8072      #�ܦϥ֭�

#REWARD
SCROLL      = 8073      #�ܵY���F�����ɯ}�G��

class Quest (JQuest) :

  def __init__(self,id,name,descr): 
      JQuest.__init__(self,id,name,descr)
      self.questItemIds = [ITEM]

  def onEvent (self,event,st) :
    htmltext = event
    if event == "31453-2.htm" :
       st.set("cond","1")
       st.setState(State.STARTED)
       st.playSound("ItemSound.quest_accept")
    elif event == "31453-3.htm" :
       st.set("cond","2")
       st.playSound("ItemSound.quest_middle")
    elif event == "31453-5.htm" :
       st.giveItems(SCROLL,1)
       st.takeItems(ITEM,1)
       st.playSound("ItemSound.quest_finish")
       st.exitQuest(1)
    return htmltext

  def onTalk (Self,npc,player):
    htmltext = "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>"
    st = player.getQuestState(qn)
    if not st: return htmltext
    cond = st.getInt("cond")
    npcId = npc.getNpcId()
    id = st.getState()
    if id == State.CREATED or id == State.COMPLETED:
       preSt = player.getQuestState("119_LastImperialPrince")
       if preSt: preId = preSt.getState()
       if player.getLevel() < 74 :
          htmltext = "31453-0.htm"
          st.exitQuest(1)
       elif not preSt:
          htmltext = "<html><body><font color=\"LEVEL\">�̫᪺�Ӥl</font>���ȩ|�������C</body></html>"
          st.exitQuest(1)
       elif preId != State.COMPLETED :
          htmltext = "<html><body><font color=\"LEVEL\">�̫᪺�Ӥl</font>���ȩ|�������C</body></html>"
          st.exitQuest(1)
       else :
          htmltext = "31453-1.htm"
    elif npcId == SPIRIT :
       if cond == 1 :
          htmltext = "31453-2.htm"
       elif cond == 3 :
          htmltext = "31453-4.htm"
    return htmltext

  def onKill (self,npc,player,isPet) :
    st = player.getQuestState(qn)
    if not st: return
    npcId = npc.getNpcId()
    if st.getInt("cond") == 2 and  st.getRandom(100) < 5 :
       st.set("cond","3")
       st.giveItems(ITEM,1)
       st.playSound("ItemSound.quest_middle")
    return

QUEST = Quest(654,qn,"�ﱵ�̲ת�����")

QUEST.addStartNpc(SPIRIT)

QUEST.addTalkId(SPIRIT)

QUEST.addKillId(TARGET_1)
QUEST.addKillId(TARGET_2)
