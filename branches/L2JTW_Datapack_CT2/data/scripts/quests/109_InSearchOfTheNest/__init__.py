# Created by Eyerobot, edited by Emperorc
import sys
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest

qn = "109_InSearchOfTheNest"

# ~~~~~ npcId list: ~~~~~
Pierce          = 31553
Corpse          = 32015
Kahman          = 31554
# ~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~ itemId list: ~~~~~~
Memo            = 8083
Golden_Badge_Recruit = 7246
Golden_Badge_Soldier = 7247
# ~~~~~~~~~~~~~~~~~~~~~~~~~~

class Quest (JQuest) : 

    def __init__(self,id,name,descr):
    	JQuest.__init__(self,id,name,descr)
    	self.questItemIds = [Memo]

    def onAdvEvent (self,event,npc,player) :
        st = player.getQuestState(qn)
        if not st: return
        htmltext = event
        cond = st.getInt("cond")
        if event == "Memo" and cond == 1 :
            st.giveItems(Memo,1)
            st.set("cond","2")
            st.playSound("ItemSound.quest_itemget")
            return
        elif event == "31553-02.htm" and cond == 2 :
            st.takeItems(Memo,-1)
            st.set("cond","3")
            st.playSound("ItemSound.quest_middle") 
        return htmltext

    def onTalk (self,npc,player):
        htmltext = "<html><head><body>目前沒有執行任務，或條件不符。</body></html>"
        st = player.getQuestState(qn)
        if st :
            npcId = npc.getNpcId()
            cond = st.getInt("cond")
            state = st.getState()
            if state == State.COMPLETED :
                htmltext = "<html><body>這是已經完成的任務。</body></html>"
            elif state == State.CREATED :
                if st.getPlayer().getLevel() >= 66 and npcId == Pierce and (st.getQuestItemsCount(Golden_Badge_Recruit) > 0 or st.getQuestItemsCount(Golden_Badge_Soldier) > 0) :
                    st.setState(State.STARTED)
                    st.playSound("ItemSound.quest_accept")
                    st.set("cond","1")
                    htmltext = "<html><body>Mercenary Captain Pierce:<br>I sent out a scout a while ago, and he hasn't reported back yet. \
                    Please follow his trail and discover his fate.</body></html>" #this is custom, if someone knows this html from retail, please contribute it.
                else :
                    htmltext = "31553-00.htm"
                    st.exitQuest(1)
                    st.playSound("ItemSound.quest_giveup")
            elif state == State.STARTED :
                if npcId == Corpse :
                    if cond == 1 :
                        htmltext = "32015-01.htm"
                    elif cond == 2 :
                        htmltext = "<html><body>This is nothing else here. Maybe you should take that memo to Pierce?</body></html>"#again, custom, see note above
                elif npcId == Pierce :
                    if cond == 1 :
                        htmltext = "<html><body>Mercenary Captain Pierce:<br>Please find my scout!</body></html>"#custom
                    elif cond == 2 :
                        htmltext = "31553-01.htm"
                    elif cond == 3 :
                        htmltext = "<html><body>Mercenary Captain Pierce:<br>Thanks for your help. See Kahman for your reward!</body></html>"#custom
                elif npcId == Kahman and cond == 3 :
                    htmltext = "31554-01.htm"
                    st.giveItems(57,25461)
                    st.addExpAndSp(146113,13723)
                    st.unset("cond")
                    st.exitQuest(False)
                    st.playSound("ItemSound.quest_finish")
        return htmltext 

QUEST = Quest(109,qn,"尋找巢穴")

QUEST.addStartNpc(Pierce)

QUEST.addTalkId(Pierce)
QUEST.addTalkId(Corpse)
QUEST.addTalkId(Kahman)