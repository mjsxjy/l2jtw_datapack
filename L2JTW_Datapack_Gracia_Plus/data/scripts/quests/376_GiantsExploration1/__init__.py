# Exploration of Giants Cave, part 1 version 0.1 
# by DrLecter
import sys
from com.l2jserver import Config
from com.l2jserver.gameserver.model.quest import State
from com.l2jserver.gameserver.model.quest import QuestState
from com.l2jserver.gameserver.model.quest.jython import QuestJython as JQuest
#Quest info
QUEST_NUMBER,QUEST_NAME,QUEST_DESCRIPTION = 376,"GiantsExploration1","���H�}�ު����I-�W�g"
qn = "376_GiantsExploration1"

#Variables
#Ancient parchment drop rate in %
DROP_RATE   = 15*Config.RATE_QUEST_DROP
MAX = 100
#Mysterious Book drop rate in %
DROP_RATE_2 = 5*Config.RATE_QUEST_DROP
#By changing this setting you can make a group of recipes harder to get
RP_BALANCE = 50
#Changing this value to non-zero, will turn recipes to 100% instead of 60%
ALT_RP_100 = 0


#Quest items
ANC_SCROLL = 5944
DICT1  = 5891 
DICT2  = 5892 #Given as a proof for 2nd part
MST_BK = 5890

#Quest items vs rewards (recipes for low sealed armor parts, 60%)
EXCHANGE = [
 #collection items list,     rnd_1, rnd_2
[[5937,5938,5939,5940,5941], 5346, 5354], #medical theory, tallum_tunic,     tallum_hose
[[5932,5933,5934,5935,5936], 5332, 5334], #architecture,   drk_crstl_leather,tallum_leather
[[5922,5923,5924,5925,5926], 5416, 5418], #golem plans,    drk_crstl_breastp,tallum_plate
[[5927,5928,5929,5930,5931], 5424, 5340]  #basics of magic,drk_crstl_gaiters,dark_crystal_legg
]

#Messages
default   = "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>"
error_1   = "<html><body>���u�լd�����B�M�G<br>���§A���n�N�A���A���ŦA���@�I���ɭԡA�A�ӧ�ڧa�C<br><font color=\"LEVEL\">(���ŹF��51�H�W�~����榹����)</font></body></html>"
start     = "<html><body>���u�լd�����B�M�G<br>�������u�լd�����ڥ��b�M�䦳�g�窺�_�I�a�A�ӥ[�J�ڭ̱��d���H�}�ޥj�N�򪫪��ζ��A��ثe����A�ڭ̤����|�����m�|����M��A�]�A<font color=\"LEVEL\">���H�����[�]�p�ϡB���H���]�k�z�סB���H���ؿv���n�B���H����ǲz��</font><br>�p�G�A�@�N�[�J�M����m�A�ڱN�����A�@�ǳ��v�C<br><a action=\"bypass -h Quest 376_GiantsExploration1 yes\">���@�N�[�J�M����m</a><br><a action=\"bypass -h Quest 376_GiantsExploration1 0\">�ڨS������</a><br></body></html>"
starting  = "Starting.htm"
checkout  = "<html><body>���u�լd�����B�M�G<br>�Ӧn�F�I�A�ש�^�ӤF�I��M���m���L�{���J��x���ܡH<br>���ڬݬݧA���F����E�E�E<br><a action=\"bypass -h Quest 376_GiantsExploration1 show\">���L�[�ݧ�쪺���m</a><br><a action=\"bypass -h Quest 376_GiantsExploration1 myst\">���L�[�ݧ�쪺��L���~</a></body></html>"
checkout2 = "<html><body>���u�լd�����B�M�G<br>�Ӧn�F�I�A�ש�^�ӤF�I��M���m���L�{���J��x���ܡH<br>��E�E�E�o�O����H�o�@�ǥj�N�����m�A���D�A��N���e½Ķ�X�ӡA���M�o���ڬO�S���γB���A�ڨS���ɶ��h�F�Ѥ��e�A�o�N�O������ڵ��A�����j�N����¦��媺�ηN�C�]�\�A�٦���L�����m�O�کһݭn���E�E�E<br><a action=\"bypass -h Quest 376_GiantsExploration1 show\">���L�[�ݨ�L�����m</a><br><a action=\"bypass -h Quest 376_GiantsExploration1 myst\">���L�[�ݨ�L�����~</a><br></body></html>"
no_items  = "<html><body>���u�լd�����B�M�G<br>��E�E�E�o�̨S���ڷQ�n���F��A�A�����~��A���_�I�F�C�ڬ۫H�A�i�H������n�u�n�A�A�V�O�@�I�E�E�E�Aı�o�O�H<br><a action=\"bypass -h Quest 376_GiantsExploration1 Starting.htm\">�ڷ|�~���M���m</a><br><a action=\"bypass -h Quest 376_GiantsExploration1 0\">�ڷQ�n��</a></body></html>"
tnx4items = "<html><body>���u�լd�����B�M�G<br>�u�O�Ӧn�F�I�o�ǴN�O�ڦb�M�䪺�F��E�E�E���h�a�A�o�O�ڪ��@�I�߷N�C���ޫ�ˡA�ڬ۫H�b���H�}�޸��٦���h�����m�٨S�Q�o�{�A�A�@�N�~��h�M��ܡH<br><a action=\"bypass -h Quest 376_GiantsExploration1 Starting.htm\">���@�N�~��</a><br><a action=\"bypass -h Quest 376_GiantsExploration1 0\">�ڷQ�n��</a><br></body></html>"
go_part2  = "<html><body>���u�լd�����B�M�G<br>�u�O�O�H�P����A�o���s���O����ѡH�ڷQ�p�G�S����L�H�������A�ڭ̬O�L�k�o���������e�C���L�O��ߡA�ڪ��D���@�ӤH�i�H���ڭ̡A�ЧA�h�߰�<font color=\"LEVEL\">�ڷ竰���ܮw�޲z���J����</font>�A�L���ӤF�ѳo���Ѫ����e�C<br></body></html>"
no_part2  = "<html><body>���u�լd�����B�M�G<br>�ڨèS���o�{���󦳥Ϊ����m�E�E�E�ڧڭ̩Ҫ��A���H���������ʨèS���Ҿڨ��ҩ��A�ҵo�{���H��άO��Z�O�u���A�N�p�P�ڧi�D�A���A�ڭ̥D�n�O�b��M<font color=\"LEVEL\">���H�����[�]�p�ϡB���H���]�k�z�סB���H���ؿv���n�B���H����ǲz��</font>�o�Ǥ��m�A�A�����a�ӧ��㪺���m�A�ڭ̤~��i�@�B�Ӭ�s�C</body></html>"
ok_part2  = "<html><body>�ܮw�޲z���J�����G<br>�x�A�o�O����ѡH���f�M�s�A�a�ӵ��ڬݬݪ��ܡH��E�E�E�ڬݬݡE�E�E�o���ѬO�ΫD�`�j�Ѫ���r�g�����E�E�E��E�E�E��F�A�A��o���j�N��������害�h��<font color=\"LEVEL\">���f�M</font>�ݬݡC���F�o�����A�L�N�i�H�F�ѳo���ѡA�֮��h���L�a�C</body></html>"
gogogo_2  = "<html><body>���u�լd�����B�M�G<br>�A�ٱa�۳o���Ѧb�o������H�H�ڭ̲{�������ѬO�L�k�F�ѳo���Ѫ����e�A�a�۳o���ѥh��<font color=\"LEVEL\">�ڷ竰���ܮw�޲z���J����</font>�C</body></html>"
ext_msg   = "Quest aborted"

#NPCs
HR_SOBLING = 31147
WF_CLIFF   = 30182

#Mobs
MOBS = range(20647,20651)

class Quest (JQuest) :

 def __init__(self,id,name,descr):
     JQuest.__init__(self,id,name,descr)
     self.questItemIds = [DICT1, MST_BK]

 def onEvent (self,event,st) :
    id = st.getState() 
    htmltext = event
    if event == "yes" :
       htmltext = starting
       st.setState(State.STARTED)
       st.set("progress","PART1")
       st.set("cond","1")
       st.set("awaitBook","1")
       st.giveItems(DICT1,1)
       st.playSound("ItemSound.quest_accept")
    elif event == "0" :
       htmltext = ext_msg
       st.playSound("ItemSound.quest_finish")
       st.takeItems(DICT1,-1)
       st.takeItems(MST_BK,-1)
       st.exitQuest(1)
    elif event == "show" :
       htmltext = no_items
       for i in range(len(EXCHANGE)) :
           dec=2**len(EXCHANGE[i][0])
           for j in range(len(EXCHANGE[i][0])) :
               if st.getQuestItemsCount(EXCHANGE[i][0][j]) :
                  dec = dec >> 1
           if dec == 1 :
              htmltext = tnx4items
              for k in range(len(EXCHANGE[i][0])) :
                  st.takeItems(EXCHANGE[i][0][k], 1)
              if st.getRandom(100) < RP_BALANCE :
                 item = EXCHANGE[i][1]
              else :
                 item = EXCHANGE[i][2]
              if ALT_RP_100 != 0 : item += 1
              st.giveItems(item,1)
    elif event == "myst" :
       if st.getQuestItemsCount(MST_BK) :
          if id == State.STARTED and st.get("progress") == "PART1" :
             st.set("progress","PART2")
             st.set("cond","2")
             htmltext = go_part2
          elif id == State.STARTED and st.get("progress") == "PART2":
             htmltext = gogogo_2
       else :
           htmltext = no_part2
    return htmltext

 def onTalk (self,npc,player):
   htmltext = default
   st = player.getQuestState(qn)
   if not st : return htmltext

   npcId = npc.getNpcId()
   id = st.getState()
   if npcId == HR_SOBLING:
      if id == State.CREATED :
         st.set("cond","0")
         htmltext = start
         if player.getLevel() < 51 :
            st.exitQuest(1)
            htmltext = error_1
      elif id == State.STARTED :
         if st.getQuestItemsCount(ANC_SCROLL) == 0 :
            htmltext = checkout
         else :
            htmltext = checkout2
   elif npcId == WF_CLIFF :
      if id == State.STARTED and st.getQuestItemsCount(MST_BK) and st.get("progress") == "PART2" :
            htmltext = ok_part2
            st.takeItems(MST_BK,1)
            st.giveItems(DICT2,1)
            st.set("cond","3")
            st.playSound("ItemSound.quest_middle")
   return htmltext

 def onKill(self,npc,player,isPet) :
     # a Mysterious Book may drop to any party member that still hasn't gotten it
     partyMember = self.getRandomPartyMember(player,"awaitBook","1")
     if partyMember :
        st = partyMember.getQuestState(qn)
        drop = st.getRandom(100)
        if drop < DROP_RATE_2  and not st.getQuestItemsCount(MST_BK):
           st.giveItems(MST_BK,1)
           st.unset("awaitBook")
           st.playSound("ItemSound.quest_middle")
     # In addition, drops go to one party member among those who are either in
     # progress PART1 or in PART2
     partyMember = self.getRandomPartyMemberState(player, State.STARTED)
     if not partyMember : return
     st = partyMember.getQuestState(qn)  
     numItems, chance = divmod(DROP_RATE,MAX)
     if st.getRandom(MAX) < chance :
        numItems = numItems + 1
     if int(numItems) != 0 :
        st.giveItems(ANC_SCROLL,int(numItems))
        st.playSound("ItemSound.quest_itemget")
     return  

# Quest class and state definition
QUEST       = Quest(QUEST_NUMBER, str(QUEST_NUMBER)+"_"+QUEST_NAME, QUEST_DESCRIPTION)

# Quest NPC starter initialization
QUEST.addStartNpc(HR_SOBLING)
# Quest initialization
QUEST.addTalkId(HR_SOBLING)

QUEST.addTalkId(WF_CLIFF)

for i in MOBS :
  QUEST.addKillId(i)