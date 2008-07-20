# Made in Taiwan

import sys
from net.sf.l2j import Config
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest
from net.sf.l2j.gameserver.instancemanager import FourSepulchersManager

# NPCS
NS      = 31453 # �L�W���F��
WGA     = 31452 # �®�S���`�F
WGB     = 31454 # �®�S���`�F
CSM     = 31921 # ���A�̳��Ӻ޲z��
ESM     = 31922 # �Ϊv�̳��Ӻ޲z��
GSM     = 31923 # �j��̳��Ӻ޲z��
JSM     = 31924 # �f�P�̳��Ӻ޲z��
COEA    = 31919 # �㺸���ȤB�ͽö������`�F
COEB    = 31920 # �㺸���ȤB�ͽê��`�F
HGKB    = [31925,31930,31935,31940] # �k��§����u���H
HGKV    = [31926,31931,31936,31941] # �l��§����u���H
HGKC    = [31927,31932,31937,31942] # �B��§����u���H
HGKM    = [31928,31933,31938,31943] # �J��§����u���H
HGKD    = [31929,31934,31939,31944] # ����§����u���H

# ITEMS
ALECTIA         = 7256 # �ȹp�������t�M
TISHAS          = 7257 # �ҮL�䪺�t�M
MEKARA          = 7258 # ���d�Ԫ��t�M
MORIGUL         = 7259 # ���Q�溸���t�M
ENT_PASS        = 7075 # ���ӳq����
USED_PASS       = 7261 # �ϥιL�����ӳq����
BROOCH          = 7262 # �}�ª��ݰw
SEALED_BOX      = 7255 # �ʦL���c�l
RELIC_PART      = 7254 # �}�H���򪫸H��
HALLS_KEY       = 7260 # §�����_��

# MSG
HGKB_MSG = "<html><body>�k��§����u���H�J<br>�S���_�͡C</body></html>"
HGKV_MSG = "<html><body>�l��§����u���H�J<br>�S���_�͡C</body></html>"
HGKC_MSG = "<html><body>�B��§����u���H�J<br>�S���_�͡C</body></html>"
HGKM_MSG = "<html><body>�J��§����u���H�J<br>�S���_�͡C</body></html>"
HGKD_MSG = "<html><body>����§����u���H�J<br>�S���_�͡C</body></html>"

MOBS = range(18120,18256)

# REWARDS
REWARDS = [81,151,959,1895,2500,4040,4042,4043,5529,5545,5546]

qn = "620_FourGoblets"

class Quest (JQuest) :

 def __init__(self,id,name,descr):
     JQuest.__init__(self,id,name,descr)
     self.questItemIds = [ALECTIA,TISHAS,MEKARA,MORIGUL]

 def onAdvEvent (self,event,npc,player) :
    st = player.getQuestState(qn)
    if not st : return htmltext
    npcId = npc.getNpcId()
    htmltext = event

    if htmltext == "START" : # �L�W���F�� - ����Ĳ�o
       st.set("four","1")
       st.set("cond","1")
       st.set("box","1")
       st.setState(State.STARTED)
       st.playSound("ItemSound.quest_accept")
       return "31453-12.htm"

    elif event == "FINISH" : # �L�W���F�� - ���ȧ���
       st.set("four","2")
       st.takeItems(ALECTIA,-1)
       st.takeItems(TISHAS,-1)
       st.takeItems(MEKARA,-1)
       st.takeItems(MORIGUL,-1)
       st.giveItems(BROOCH,1)
       st.playSound("ItemSound.quest_finish")
       return "31453-18.htm"

    elif event == "ABORT" : # �L�W���F�� - ���ȩ��
       st.playSound("ItemSound.quest_finish")
       st.exitQuest(1)
       return "31453-14.htm"

    elif event == "CONTINUE" : # �L�W���F�� - �����~��
       if st.getInt("cond")==1 and st.getInt("four")==2 :
          st.set("cond","2")
          st.playSound("ItemSound.quest_accept")
          return "31453-15.htm"
       else:
          return "31453-15.htm"

    elif event == "OUT" : # �®�S���`�F - �ǰe�ܨ�§�̦x�|
       st.player.teleToLocation(169590,-90218,-2914)
       return str(npcId)+"-06.htm"

    elif event == "1" : # �®�S���`�F - �洫�s�@���b
       st.giveItems(6881,1)
       st.takeItems(RELIC_PART,1000)
       return str(npcId)+"-10.htm"
    elif event == "2" :
       st.giveItems(6883,1)
       st.takeItems(RELIC_PART,1000)
       return str(npcId)+"-10.htm"
    elif event == "3" :
       st.giveItems(6885,1)
       st.takeItems(RELIC_PART,1000)
       return str(npcId)+"-10.htm"
    elif event == "4" :
       st.giveItems(6887,1)
       st.takeItems(RELIC_PART,1000)
       return str(npcId)+"-10.htm"
    elif event == "5" :
       st.giveItems(6889,1)
       st.takeItems(RELIC_PART,1000)
       return str(npcId)+"-10.htm"
    elif event == "6" :
       st.giveItems(6891,1)
       st.takeItems(RELIC_PART,1000)
       return str(npcId)+"-10.htm"
    elif event == "7" :
       st.giveItems(6893,1)
       st.takeItems(RELIC_PART,1000)
       return str(npcId)+"-10.htm"
    elif event == "8" :
       st.giveItems(6895,1)
       st.takeItems(RELIC_PART,1000)
       return str(npcId)+"-10.htm"
    elif event == "9" :
       st.giveItems(6897,1)
       st.takeItems(RELIC_PART,1000)
       return str(npcId)+"-10.htm"
    elif event == "10" :
       st.giveItems(6899,1)
       st.takeItems(RELIC_PART,1000)
       return str(npcId)+"-10.htm"

    elif event == "OPENBOX1" : # �®�S���`�F - �}�ʦL�c�l
       if st.getInt("box") != 2 : return "���ȩ|�������C"
       if st.getQuestItemsCount(SEALED_BOX) :
          st.takeItems(SEALED_BOX,1)
          if st.getRandom(100) < 35 :
             st.giveItems(REWARDS[st.getRandom(len(REWARDS))],1)
             return str(npcId)+"-11.htm"
          else:
             if st.getRandom(100) < 40 :
                return str(npcId)+"-12.htm"
             else:
                return str(npcId)+"-13.htm"

    elif event == "OPENBOX2" : # �㺸���ȤB�ͽê��`�F - �}�ʦL���c�l
       if st.getInt("box") != 2 : return "���ȩ|�������C"
       if st.getQuestItemsCount(SEALED_BOX) :
          st.takeItems(SEALED_BOX,1)
          if st.getRandom(100) < 20 :
             st.giveItems(REWARDS[st.getRandom(len(REWARDS))],1)
             return str(npcId)+"-02.htm"
          else:
             if st.getRandom(100) < 40 :
                return str(npcId)+"-03.htm"
             else:
                return str(npcId)+"-04.htm"
       elif st.getQuestItemsCount(SEALED_BOX)==0 :
          return str(npcId)+"-05.htm"

    elif event == "INTOFS" : # ���Ӻ޲z�� - �i�J�|�j���ӱ���
       npc.onBypassFeedback(player,"Entry")
       return

    return htmltext

 def onTalk (self,npc,player):
    htmltext = "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>"
    st = player.getQuestState(qn)
    npcId = npc.getNpcId()
    id = st.getState()
    cond = st.getInt("cond")
    four = st.getInt("four")
    wigoth = st.getInt("wigoth")
    box = st.getInt("box")
    if not st : return htmltext

    if id == State.CREATED :
       if npcId == NS : # �L�W���F��
          if st.getPlayer().getLevel() > 73 :
             htmltext = str(npcId)+"-01.htm"
          else:
             htmltext = str(npcId)+"-00.htm"
             st.exitQuest(1)

    elif id == State.STARTED :
       if npcId == NS : # �L�W���F��
          if cond == 1 :
             if st.getQuestItemsCount(ALECTIA) and st.getQuestItemsCount(TISHAS) and st.getQuestItemsCount(MEKARA) and st.getQuestItemsCount(MORIGUL) :
                htmltext = str(npcId)+"-16.htm"
             else :
                htmltext = str(npcId)+"-13.htm"
          elif four == 2 or cond == 2 :
             htmltext = str(npcId)+"-19.htm"

       elif npcId == WGA : # �®�S���`�F - �ӫҳ���(���ѫ����L���v�l��)
          st.set("box","2")
          if st.getQuestItemsCount(ALECTIA) + st.getQuestItemsCount(TISHAS) + st.getQuestItemsCount(MEKARA) + st.getQuestItemsCount(MORIGUL) <= 1:
             htmltext = str(npcId)+"-01.htm"
             st.set("wigoth","1")
          elif st.getQuestItemsCount(ALECTIA) + st.getQuestItemsCount(TISHAS) + st.getQuestItemsCount(MEKARA) + st.getQuestItemsCount(MORIGUL) == 2:
             htmltext = str(npcId)+"-02.htm"
             st.set("wigoth","2")
          elif st.getQuestItemsCount(ALECTIA) + st.getQuestItemsCount(TISHAS) + st.getQuestItemsCount(MEKARA) + st.getQuestItemsCount(MORIGUL) == 3:
             htmltext = str(npcId)+"-04.htm"
             st.set("wigoth","3")
          elif st.getQuestItemsCount(ALECTIA) + st.getQuestItemsCount(TISHAS) + st.getQuestItemsCount(MEKARA) + st.getQuestItemsCount(MORIGUL) == 4:
             htmltext = str(npcId)+"-05.htm"
             st.set("wigoth","4")
          elif st.getQuestItemsCount(ALECTIA) + st.getQuestItemsCount(TISHAS) + st.getQuestItemsCount(MEKARA) + st.getQuestItemsCount(MORIGUL) > 4:
             htmltext = str(npcId)+"-05.htm"

       elif npcId == WGB : # �®�S���`�F - ��§�̦x�|
          if st.getInt("box") != 2 : return "���ȩ|�������C"
          if four==1 :
             if st.getQuestItemsCount(RELIC_PART) < 1000 and st.getQuestItemsCount(SEALED_BOX) > 0 :
                htmltext = str(npcId)+"-02.htm"
             elif st.getQuestItemsCount(RELIC_PART) > 999 and st.getQuestItemsCount(SEALED_BOX) == 0 :
                htmltext = str(npcId)+"-03.htm"
             elif st.getQuestItemsCount(RELIC_PART) > 999 and st.getQuestItemsCount(SEALED_BOX) > 0 :
                htmltext = str(npcId)+"-04.htm"
             elif st.getQuestItemsCount(RELIC_PART) == 0 and st.getQuestItemsCount(SEALED_BOX) == 0 :
                htmltext = str(npcId)+"-01.htm"
          elif four==2 :
             if st.getQuestItemsCount(RELIC_PART) < 1000 and st.getQuestItemsCount(SEALED_BOX) > 0 :
                htmltext = str(npcId)+"-06.htm"
             elif st.getQuestItemsCount(RELIC_PART) > 999 and st.getQuestItemsCount(SEALED_BOX) == 0 :
                htmltext = str(npcId)+"-07.htm"
             elif st.getQuestItemsCount(RELIC_PART) > 999 and st.getQuestItemsCount(SEALED_BOX) > 0 :
                htmltext = str(npcId)+"-08.htm"
             elif st.getQuestItemsCount(RELIC_PART) == 0 and st.getQuestItemsCount(SEALED_BOX) == 0 :
                htmltext = str(npcId)+"-05.htm"

       elif npcId in [COEA,COEB] : # �㺸���ȤB�ͽê��`�F
          htmltext = str(npcId)+"-01.htm"

       elif npcId in [CSM,ESM,GSM,JSM]: # ���Ӻ޲z��
         if FourSepulchersManager.getInstance().IsEntryTime() :
             if not player.isInParty():
                  return "�պ�5�H��������~�i�H�ӽСC"
             elif not player.getParty().isLeader(player):
                  return "�պ�5�H��������~�i�H�ӽСC"
             elif player.getParty().getMemberCount() != 5:
                  return "�պ�5�H��������~�i�H�ӽСC"
             else :
                  htmltext = str(npcId)+"-01.htm"
         else :
             htmltext = str(npcId)+"-02.htm"

       elif npcId in HGKB : # �k��§����u���H
        if not player.isInParty():
             return "�պ�5�H��������~�i�H�ӽСC"
        elif not player.getParty().isLeader(player):
             return "�պ�5�H��������~�i�H�ӽСC"
        elif player.getParty().getMemberCount() != 5:
             return "�պ�5�H��������~�i�H�ӽСC"
        elif FourSepulchersManager.getInstance().IsAttackTime() :
             if st.getQuestItemsCount(HALLS_KEY) :
                npc.onBypassFeedback(player,"open_gate")
                partyMembers = [player]
                party = player.getParty()
                if party :
                   partyMembers = party.getPartyMembers().toArray()
                   for player in partyMembers :
                       pst = player.getQuestState(qn)
                       pst.takeItems(HALLS_KEY,-1)
                return
             else :
                return HGKB_MSG
        else :
            return "���󤣲šA�L�k�i�J�C"
       elif npcId in HGKV : # �l��§����u���H
        if not player.isInParty():
             return "�պ�5�H��������~�i�H�ӽСC"
        elif not player.getParty().isLeader(player):
             return "�պ�5�H��������~�i�H�ӽСC"
        elif player.getParty().getMemberCount() != 5:
             return "�պ�5�H��������~�i�H�ӽСC"
        elif FourSepulchersManager.getInstance().IsAttackTime() :
             if st.getQuestItemsCount(HALLS_KEY) :
                npc.onBypassFeedback(player,"open_gate")
                partyMembers = [player]
                party = player.getParty()
                if party :
                   partyMembers = party.getPartyMembers().toArray()
                   for player in partyMembers :
                       pst = player.getQuestState(qn)
                       pst.takeItems(HALLS_KEY,-1)
                return
             else :
                return HGKV_MSG
        else :
            return "���󤣲šA�L�k�i�J�C"
       elif npcId in HGKC : # �B��§����u���H
        if not player.isInParty():
             return "�պ�5�H��������~�i�H�ӽСC"
        elif not player.getParty().isLeader(player):
             return "�պ�5�H��������~�i�H�ӽСC"
        elif player.getParty().getMemberCount() != 5:
             return "�պ�5�H��������~�i�H�ӽСC"
        elif FourSepulchersManager.getInstance().IsAttackTime() :
             if st.getQuestItemsCount(HALLS_KEY) :
                npc.onBypassFeedback(player,"open_gate")
                partyMembers = [player]
                party = player.getParty()
                if party :
                   partyMembers = party.getPartyMembers().toArray()
                   for player in partyMembers :
                       pst = player.getQuestState(qn)
                       pst.takeItems(HALLS_KEY,-1)
                return
             else :
                return HGKC_MSG
        else :
            return "���󤣲šA�L�k�i�J�C"
       elif npcId in HGKM : # �J��§����u���H
        if not player.isInParty():
             return "�պ�5�H��������~�i�H�ӽСC"
        elif not player.getParty().isLeader(player):
             return "�պ�5�H��������~�i�H�ӽСC"
        elif player.getParty().getMemberCount() != 5:
             return "�պ�5�H��������~�i�H�ӽСC"
        elif FourSepulchersManager.getInstance().IsAttackTime() :
             if st.getQuestItemsCount(HALLS_KEY) :
                npc.onBypassFeedback(player,"open_gate")
                partyMembers = [player]
                party = player.getParty()
                if party :
                   partyMembers = party.getPartyMembers().toArray()
                   for player in partyMembers :
                       pst = player.getQuestState(qn)
                       pst.takeItems(HALLS_KEY,-1)
                return
             else :
                return HGKM_MSG
        else :
            return "���󤣲šA�L�k�i�J�C"
       elif npcId in HGKD : # ����§����u���H
        if not player.isInParty():
             return "�պ�5�H��������~�i�H�ӽСC"
        elif not player.getParty().isLeader(player):
             return "�պ�5�H��������~�i�H�ӽСC"
        elif player.getParty().getMemberCount() != 5:
             return "�պ�5�H��������~�i�H�ӽСC"
        elif FourSepulchersManager.getInstance().IsAttackTime() :
             if st.getQuestItemsCount(HALLS_KEY) :
                npc.onBypassFeedback(player,"open_gate")
                partyMembers = [player]
                party = player.getParty()
                if party :
                   partyMembers = party.getPartyMembers().toArray()
                   for player in partyMembers :
                       pst = player.getQuestState(qn)
                       pst.takeItems(HALLS_KEY,-1)
                return
             else :
                return HGKD_MSG
        else :
            return "���󤣲šA�L�k�i�J�C"

    return htmltext

 def onKill(self,npc,player,isPet):
    st = player.getQuestState(qn)
    npcId = npc.getNpcId()
    if not st : return
    if st.getState() == State.STARTED :
       if st.getInt("cond")==1 or st.getInt("cond")==2 :
          if npcId in MOBS :
             if st.getRandom(100) < 30 :
                st.giveItems(SEALED_BOX,1)
                st.set("box","1")
                st.playSound("ItemSound.quest_itemget")
    return

QUEST       = Quest(620,qn,"�|�t�M")

QUEST.addStartNpc(NS)
QUEST.addTalkId(NS)
QUEST.addTalkId(WGA)
QUEST.addTalkId(WGB)
QUEST.addTalkId(CSM)
QUEST.addTalkId(ESM)
QUEST.addTalkId(GSM)
QUEST.addTalkId(JSM)
QUEST.addTalkId(COEA)
QUEST.addTalkId(COEB)

for npc1 in HGKB:
    QUEST.addTalkId(npc1)

for npc2 in HGKV:
    QUEST.addTalkId(npc2)

for npc3 in HGKC:
    QUEST.addTalkId(npc3)

for npc4 in HGKM:
    QUEST.addTalkId(npc4)

for npc5 in HGKD:
    QUEST.addTalkId(npc5)

for mob in MOBS:
    QUEST.addKillId(mob)
