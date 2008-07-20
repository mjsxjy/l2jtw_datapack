# Exploration of Giants Cave, part 2 version 0.1 
# by DrLecter
import sys
from net.sf.l2j import Config
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest

#Quest info
QUEST_NUMBER,QUEST_NAME,QUEST_DESCRIPTION = 377,"GiantsExploration2","���H�}�ު����I-�U�g"
qn = "377_GiantsExploration2"

#Variables
#Titan Ancient Books drop rate in %
DROP_RATE=15*Config.RATE_DROP_QUEST
MAX = 100
#Alternative rewards. Set this to a non-zero value and recipes will be 100% instead of 60%
ALT_RP_100=0

#Quest items
ANC_BOOK = 5955
DICT2    = 5892

#Quest collections
EXCHANGE = [
[5945, 5946, 5947, 5948, 5949], #science basis
[5950, 5951, 5952, 5953, 5954]  #culture
]

#Messages
efault   = "<html><head><body>�ڨS������ܥi�H��A�����C</body></html>"
error_1   = "<html><head><body>���u�լd�����B�M�G<br>���§A���n�N�A���A���ŦA���@�I���ɭԡA�A�ӧ�ڧa�C<br><font color=\"LEVEL\">(���ŹF��57�H�W�~����榹����)</font></body></html>"
start     = "<html><head><body>���u�լd�����B�M�G<br>�ҥH�A�J�����s�A�N�o����害���ڭ̡A��E�E�E�o�˧ڥi�H�Ӭݤ@�U�o���Ѫ����e�C�o�u�O�O�H��_���E�E�E����٦���h���j�N�򪫬O�ڭ��٨S�o�{���A�]�\�A���@�N���ڭ��~���M�o���٥��M�򪺥j�N�򪫡A�ڭ̲{�b�n�䪺�O<font color=\"LEVEL\">���H����ǲz�סB�U���H��Ʀ~Ų</font>�C<br>�ڭ̪����v�O�A�L�k�ڵ���<font color=\"LEVEL\">A�Ũ</font>�A��M�A�p�G����L���򪫡A�ڭ̬O���|�������A�ڭ̥u���������U���H�����y�C<br><a action=\"bypass -h Quest 377_GiantsExploration2 yes\">���@�N�M��j�N���m</a><br><a action=\"bypass -h Quest 377_GiantsExploration2 0\">�{�b�ڨS���ɶ����A</a><br></body></html>"
starting  = "Starting.htm"
checkout  = "<html><head><body>���u�լd�����B�M�G<br>�Ӧn�F�I�A�ש�^�ӤF�I��M���m���L�{���J��x���ܡH<br>���ڬݬݧA���F�Ǥ���E�E�E<br><a action=\"bypass -h Quest 377_GiantsExploration2 show\">���L�[�ݧ�쪺���m</a></body></html>"
checkout2 = "<html><head><body>���u�լd�����B�M�G<br>�Ӧn�F�I�A�ש�^�ӤF�I��M���m���L�{���J��x���ܡH<br>��E�E�E�o�O����H�o�@�ǥj�N�����m�A���D�A��N���e½Ķ�X�ӡA���M�o���ڬO�S���γB���A�ڨS���ɶ��h�F�Ѥ��e�A�o�N�O������ڵ��A�����j�N��������媺�ηN�C�]�\�A�٦���L�����m�O�کһݭn���E�E�E<br><br><a action=\"bypass -h Quest 377_GiantsExploration2 show\">���L�[�ݨ�L�����m</a></body></html>"
no_items  = "<html><head><body>���u�լd�����B�M�G<br>��E�E�E�o�̨S���ڷQ�n���F��A�A�����~��A���_�I�F�C�ڬ۫H�A�i�H������n�u�n�A�A�V�O�@�I�E�E�E�Aı�o�O�H<br><a action=\"bypass -h Quest 377_GiantsExploration2 Starting.htm\">�ڷ|�~���M���m</a><br><a action=\"bypass -h Quest 377_GiantsExploration2 0\">�ڷQ�n��</a></body></html>"
tnx4items = "<html><head><body>���u�լd�����B�M�G<br>�u�O�Ӧn�F�I�o�ǴN�O�ڦb�M�䪺�F��E�E�E���h�a�A�o�O�ڪ��@�I�߷N�C���ޫ�ˡA�ڬ۫H�b���H�}�޸��٦���h�����m�٨S�Q�o�{�A�A�@�N�~��h�M��ܡH<br><a action=\"bypass -h Quest 377_GiantsExploration2 Starting.htm\">���@�N�~���M���m</a><br><a action=\"bypass -h Quest 377_GiantsExploration2 0\">�ڷQ�n��</a></body></html>"
ext_msg   = "Quest aborted"

#NPCs
HR_SOBLING = 31147

#Mobs
MOBS = [ 20654,20656,20657,20658 ]

class Quest (JQuest) :

 def __init__(self,id,name,descr):
     JQuest.__init__(self,id,name,descr)
     self.questItemIds = [DICT2]

 def onEvent (self,event,st) :
    id = st.getState() 
    htmltext = event
    if event == "yes" :
       htmltext = starting
       st.setState(State.STARTED)
       st.set("cond","1")
       st.playSound("ItemSound.quest_accept")
    elif event == "0" :
       htmltext = ext_msg
       st.playSound("ItemSound.quest_finish")
       st.takeItems(DICT2,1)
       st.exitQuest(1)
    elif event == "show" :
       htmltext = no_items
       for i in range(len(EXCHANGE)) :
           dec=2**len(EXCHANGE[i])
           for j in range(len(EXCHANGE[i])) :
               if st.getQuestItemsCount(EXCHANGE[i][j]) > 0 :
                  dec = dec >> 1
           if dec == 1 :
              htmltext = tnx4items
              for k in range(len(EXCHANGE[i])) :
                  st.takeItems(EXCHANGE[i][k], 1)
              luck = st.getRandom(100) 
              if luck > 75   : item=5420 #nightmare leather 60%
              elif luck > 50 : item=5422 #majestic plate 60%
              elif luck > 25 : item=5336 #nightmare armor 60%
              else           : item=5338 #majestic leather 60%
              if ALT_RP_100 != 0 : item +=1
              st.giveItems(item,1)
    return htmltext

 def onTalk (self,npc,player):
   htmltext = default
   st = player.getQuestState(qn)
   if not st : return htmltext

   npcId = npc.getNpcId()
   id = st.getState()
   if st.getQuestItemsCount(DICT2) != 1 :
      st.exitQuest(1) 
   elif id == State.CREATED :
      st.set("cond","0")
      htmltext = start
      if player.getLevel() < 57 :
         st.exitQuest(1)
         htmltext = error_1
   elif id == State.STARTED :
      if st.getQuestItemsCount(ANC_BOOK) == 0 :
         htmltext = checkout
      else :
         htmltext = checkout2
   return htmltext

 def onKill(self,npc,player,isPet) :
     partyMember = self.getRandomPartyMemberState(player,State.STARTED)
     if not partyMember : return
     st = partyMember.getQuestState(qn)
     numItems, chance = divmod(DROP_RATE,MAX)
     drop = st.getRandom(MAX)
     if drop < chance :
        numItems = numItems +1
     if int(numItems) != 0 :
        st.giveItems(ANC_BOOK,int(numItems))
        st.playSound("ItemSound.quest_itemget")
     return  

# Quest class and state definition
QUEST       = Quest(QUEST_NUMBER, str(QUEST_NUMBER)+"_"+QUEST_NAME, QUEST_DESCRIPTION)

# Quest NPC starter initialization
QUEST.addStartNpc(HR_SOBLING)
# Quest initialization
QUEST.addTalkId(HR_SOBLING)

for i in MOBS :
  QUEST.addKillId(i)