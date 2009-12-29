import sys
from com.l2jserver.gameserver.model.quest import State
from com.l2jserver.gameserver.model.quest import QuestState
from com.l2jserver.gameserver.model.quest.jython import QuestJython as JQuest

qn = "240_ImTheOnlyOneYouCanTrust"

# NPC
KINTAIJIN = 32640

# Mobs
MOBS = [22617,22624,22625,22626]

# QUEST ITEM
STAKATOFANGS = 14879

class Quest (JQuest) :
  def __init__(self,id,name,descr):
    JQuest.__init__(self,id,name,descr)
    self.questItemIds = [STAKATOFANGS]

  def onAdvEvent (self,event,npc, player) :
    htmltext = event
    st = player.getQuestState(qn)
    if not st : return

    if event == "32640-3.htm" :
      st.set("cond","1")
      st.setState(State.STARTED)
      st.playSound("ItemSound.quest_accept")
    return htmltext

  def onTalk (self,npc,player):
    htmltext = "<html><body>You are either not on a quest that involves this NPC, or you don't meet this NPC's minimum quest requirements.</body></html>"
    st = player.getQuestState(qn)
    if not st : return htmltext

    npcId = npc.getNpcId()
    id = st.getState()
    cond = st.getInt("cond")

    if id == State.COMPLETED :
      htmltext = "32640-10.htm"
    elif id == State.CREATED :
      if player.getLevel() >= 81 :
        htmltext = "32640-1.htm"
      else :
        htmltext = "32640-0.htm"
        st.exitQuest(1)
    else :
      if cond == 1 :
        htmltext = "32640-8.htm"
      elif cond == 2 :
        st.takeItems(STAKATOFANGS,-1)
        st.addExpAndSp(589542,36800)
        st.exitQuest(False)
        st.playSound("ItemSound.quest_finish")
        htmltext = "32640-9.htm"
    return htmltext

  def onKill(self,npc,player,isPet):
    st = player.getQuestState(qn)
    if not st or isPet: return
    if st.getState() != State.STARTED : return

    st.giveItems(STAKATOFANGS,1)
    if st.getQuestItemsCount(STAKATOFANGS) >= 25 :
      st.set("cond","2")
      st.playSound("ItemSound.quest_middle")
    else :
      st.playSound("ItemSound.quest_itemget")
    return

QUEST = Quest(240,qn,"I'm the Only One You Can Trust")

QUEST.addStartNpc(KINTAIJIN)
QUEST.addTalkId(KINTAIJIN)

for mobId in MOBS:
  QUEST.addKillId(mobId)