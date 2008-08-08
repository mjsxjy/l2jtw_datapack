# Upgrade your Hatchling to Strider version 0.2
# by DrLecter & DraX_

#Quest info
QUEST_NUMBER      = 421
QUEST_NAME        = "LittleWingAdventures"
QUEST_DESCRIPTION = "Little Wing's Big Adventures"
qn = "421_LittleWingAdventures"

#Configuration

#Minimum pet and player levels required to complete the quest (defaults 55 and 45)
MIN_PET_LEVEL = 55
MIN_PLAYER_LEVEL = 45
# Maximum distance allowed between pet and owner; if it's reached while talking to any NPC, quest is aborted
MAX_DISTANCE = 100

#Messages
default = "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>"
event_1 = "<html><head><body>�J���մ��G<br>�ڷ�M�����D��~�I���A����O���D...�ϥ��ڡC�ڹ葉�s...�ҥH��...<br>����...�o�˧a�A��ı�o�h���b����j��<font color=\"LEVEL\">����̲�</font>�ݤ���n�C��쵹�A���s���]�O�L�r...��r��A�W������Ƥ���A�ڸ�L�����۳z�L�H�O���pô�A�i�H��O�ͱ��ܡH�ϥ��ڭ̭Ǫ����Y�ܦn�C�ҥH���A�ڷ|�g�H���L�A���L��A�M�A�����s�n�@�I...���դF�ܡH�A���էڪ��N��ܡH</body></html>"
error_1 = "<html><head><body>�A�ݭn�֦��@�Y���s�A�åB�N�L�l��X�ӡA�H�����o�ӥ��ȡC</body></html>"
error_2 = "<html><head><body>�K�I�o�ͤF����ơH������S���t�~�@�����s�H�o���O�쥻�����s�a�H</body></html>"
error_3 = "<html><head><body>�J���մ��G<br>�A�����ŻݨD"+str(MIN_PLAYER_LEVEL)+"�H�W�~��Ѧ����ȡC</body></html>"
error_4 = "<html><head><body>�J���մ��G<br>�A���d�����ŻݨD"+str(MIN_PET_LEVEL)+"�H�W�~��Ѧ����ȡC</body></html>"
error_5 = "�A���d�����O���s�A���Ȥ��_�C"
error_6 = "�A���d�����b����A���Ȥ��_�C"
qston_1 = "<html><head><body>�J���մ��G<br>�K�A�A���N�O���e�n�ۭn�i���s�����ӤH�ܡH�p��H�ڸ�A���L�i���s�O�������A�ҥH�s�A�O�i�A�A�o����T��...�ᮬ�F�a�H�I�N��O��e���t�A�⥦�i���y�s�p��H�A�a�۪��p���A�{�b���Ӫ��j�F�a...�H�A�n���n�⨺�p���ܦ��y�s...�H<br><a action=\"bypass -h Quest "+str(QUEST_NUMBER)+"_"+QUEST_NAME+" 16\">�߰ݬO�_���D���k</a></body></html>"
qston_2 = "<html><head><body>�J���մ��G<br>�ڤw�g��A���h�б�<font color=\"LEVEL\">����̲�</font>�I�I�������M���ܡI�H</body></html>"
qston_3 = "<html><head><body>����̲��G<br>����I�A�䤣��<font color=\"LEVEL\">���B�P�B�����B�`�W�������</font>�C �O���I �L�̥����b<font color=\"LEVEL\">�y�H����</font>�C</body></html>"
order_1 = "<html><head><body>����̲��G<br>�A�����s�����ܤU<font color=\"LEVEL\">���B�P�B�����B�`�W�������</font>���ĲG�����U�e�������C�O�ˮ`���@�N���U�A�������A���۳o�ǧ��몺���l�A�b���s�ܧ���G����N���K�b����쪺�ˤf�W�a�C</body></html>"
end_msg = "<html><head><body>����̲��G<br>�A�����s�����ܦn�C"
end_msg2= "�w�g���ܬ��y�s�F�A���ߧA�C</body></html>"

#Quest items
FT_LEAF = 4325
CONTROL_ITEMS = { 3500:4422, 3501:4423, 3502:4424 }

#NPCs
SG_CRONOS = 30610
FY_MYMYU  = 30747

#Mobs
GUARDIAN = 27189

import sys
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest
from net.sf.l2j.gameserver.serverpackets import NpcSay

def get_control_item(st) :
  item = st.getPlayer().getPet().getControlItemId()
  if st.getState() == State.CREATED :
      st.set("item",str(item))
  else :
      if  st.getInt("item") != item : item = 0
  return item  

def get_distance(player) :
    is_far = False
    if abs(player.getPet().getX() - player.getX()) > MAX_DISTANCE :
        is_far = True
    if abs(player.getPet().getY() - player.getY()) > MAX_DISTANCE :
        is_far = True
    if abs(player.getPet().getZ() - player.getZ()) > MAX_DISTANCE :
        is_far = True
    return is_far

class Quest (JQuest) :

 def __init__(self,id,name,descr):
   JQuest.__init__(self,id,name,descr)
   self.questItemIds = [FT_LEAF]
   self.killedTrees = []

 def onEvent (self,event,st) :
    htmltext = event
    if event == "16" :
       htmltext = event_1
       st.setState(State.STARTED)
       st.set("id","0")
       st.set("cond","1")
       st.playSound("ItemSound.quest_accept")
    return htmltext

 def onTalk (self,npc,player):
   htmltext = default
   st = player.getQuestState(qn)
   if not st : return htmltext
   id = st.getState()
   cond = st.getInt("cond")
   if id == State.COMPLETED :
      st.setState(State.CREATED)
      id = State.CREATED
   npcId = npc.getNpcId()
   if player.getPet() == None :
       htmltext = error_1
       st.exitQuest(1)
   elif player.getPet().getTemplate().npcId not in [12311,12312,12313] : #npcIds for hatchlings
       htmltext = error_5
       st.exitQuest(1)
   elif player.getPet().getLevel() < MIN_PET_LEVEL :
       st.exitQuest(1)
       htmltext = error_4
   elif get_distance(player) :
       st.exitQuest(1)
       htmltext = error_6
   elif get_control_item(st) == 0 :
       st.exitQuest(1)
       htmltext = error_2
   elif npcId == SG_CRONOS :
      if id == State.CREATED :
         if player.getLevel() < MIN_PLAYER_LEVEL :
            st.exitQuest(1)
            htmltext = error_3
         else :   
            htmltext = qston_1
      else :
         htmltext = qston_2
   elif npcId == FY_MYMYU :
     if id == State.STARTED and cond < 3 :
        if st.getQuestItemsCount(FT_LEAF) == 0 and st.getInt("id") == 0 :
           st.set("cond","2")
           st.giveItems(FT_LEAF,4)
           st.playSound("ItemSound.quest_itemget")
           htmltext = order_1
        else :
            htmltext = qston_3
     elif id == State.STARTED and cond >= 3:
        name = player.getPet().getName()
        if name == None : name = " "
        else : name = " "+name+" "
        htmltext = end_msg+name+end_msg2
        item=CONTROL_ITEMS[player.getInventory().getItemByObjectId(player.getPet().getControlItemId()).getItemId()]
        player.getPet().deleteMe(player) #both despawn pet and delete controlitem
        st.giveItems(item,1)
        st.exitQuest(1)
        st.playSound("ItemSound.quest_finish")
   return htmltext

 def onAttack(self, npc, player, damage, isPet) :
   st = player.getQuestState(str(QUEST_NUMBER)+"_"+QUEST_NAME)
   if not st:
     return
   npcId = npc.getNpcId()
   for pc, mobId, in self.killedTrees:
      if pc == player and mobId == npcId:
         return
   if isPet :
      pet = player.getPet()
      if st.getRandom(100) <= 2 and st.getQuestItemsCount(FT_LEAF) >= 0:
         st.takeItems(FT_LEAF,1)
         st.playSound("ItemSound.quest_middle")
         npc.broadcastPacket(NpcSay(npc.getNpcId(),0,npcId,"gives me spirit leaf...!"))
         self.killedTrees.append([player,npcId])
         if st.getQuestItemsCount(FT_LEAF) == 0 :
            st.set("cond","3")
   return 

# Quest class and state definition
QUEST       = Quest(QUEST_NUMBER, str(QUEST_NUMBER)+"_"+QUEST_NAME, QUEST_DESCRIPTION)

# Quest NPC starter initialization
QUEST.addStartNpc(SG_CRONOS)
# Quest initialization
QUEST.addTalkId(SG_CRONOS)

QUEST.addTalkId(FY_MYMYU)

for i in range(27185,27189):
   QUEST.addAttackId(i)
