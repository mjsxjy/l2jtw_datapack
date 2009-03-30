import sys
from net.sf.l2j.gameserver.model.quest        import State
from net.sf.l2j.gameserver.model.quest        import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest

qn = "5025_Evolve"

#Minimum pet level in order to evolve
WOLF_MIN_LEVEL    = 55
GREATW_MIN_LEVEL  = 70
BABY_MIN_LEVEL    = 55
STRIDER_MIN_LEVEL = 55

#Maximum distance allowed between pet and owner
MAX_DISTANCE = 100

#Messages
default = "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>"
error_1 = "<html><body><br>���F�i���d���A�����l����d���ñN�e�a��ڪ���n���ڬݲM���C<br>�Y�l��@���ۤz���d���ζZ���ӻ��A�N�L�k���z�i�ơC<br>�ӥB�A�d�������Ť]�n�F��@�w���{�פ~��C</body></html>"
error_2 = "<html><body><br>�z�S���i�i�ƪ��d���ڡC�ܤ֭n���@���d���A�o�˧ڤ~������z�i���d���a�H</body></html>"
error_3 = "<html><body><br>�z�����l����d���A�ñN�e�a��ڪ���A�n���ڬݲM���C</body></html>"
error_lvl_wolf = "<html><body><br>�z���T���ũ|���F��"+str(WOLF_MIN_LEVEL)+"�A�ҥH�L�k�i�ơC</body></html>"
error_lvl_greatw = "<html><body><br>�z�����O�T���ũ|���F��"+str(GREATW_MIN_LEVEL)+"�A�ҥH�L�k�i�ơC</body></html>"
error_lvl_fenrir = "<html><body><br>�z���y�T���ũ|���F��"+str(GREATW_MIN_LEVEL)+"�A�ҥH�L�k�i�ơC</body></html>"
error_lvl_baby = "<html><body><br>�z���p�d�����ũ|���F��"+str(BABY_MIN_LEVEL)+"�A�ҥH�L�k�i�ơC</body></html>"
error_lvl_strider = "<html><body><br>�z���y�s���ũ|���F��"+str(STRIDER_MIN_LEVEL)+"�A�ҥH�L�k�i�ơC</body></html>"
end_msg = "<html><body><br>�I~�u���W���u�@�C<br>�w�g�N�z���d���i�ơA�Цn�n�Y��z���s�d���a�C</body></html>"

NPCSCH = [35440,35442,35444,35446,35448,35450,35567,35569,35571,35573,35575,35577,35579]

#Items
WOLF_COLLAR           = 2375  # �T����
GREAT_WOLF_NECK       = 9882  # ���O�T����
FENRIR_NECK           = 10426 # �y�T����
GREAT_SNOW_WOLF_NECK  = 10307 # ���O�T����
SNOW_FENRIR_NECK      = 10611 # �ծy�T����
BABY_BUFFALO_PAN      = 6648  # �p��������
BABY_KOOK_OCARINA     = 6650  # �p���A������
BABY_COUGAR_CHIME     = 6649  # �p�Ѫꤧ��
IMPROVED_BUFFALO_PAN  = 10311 # ��}����������
IMPROVED_KOOK_OCARINA = 10313 # ��}���Ѫꤧ��
IMPROVED_COUGAR_CHIME = 10312 # ��}�����A������
WSTRIDER_BUGLE        = 4422  # ���s����
SSTRIDER_BUGLE        = 4423  # �P�s����
TSTRIDER_BUGLE        = 4424  # �����s����
RED_WSTRIDER_BUGLE    = 10308 # �������s����
RED_SSTRIDER_BUGLE    = 10309 # �����P�s����
RED_TSTRIDER_BUGLE    = 10310 # ���������s����

#Pets
WOLF     = 12077 # �T
GREATW   = 16025 # ���O�T
FENRIR   = 16041 # �y�T
SFENRIR  = 16042 # �ծy�T
GREATSW  = 16037 # ���O�T
BABYS    = [12780,12781,12782] # �p�����B�p���A���B�p�Ѫ�
WSTRIDER = 12526 # ���y�s
SSTRIDER = 12527 # �P�y�s
TSTRIDER = 12528 # �����y�s

UPDATE_CONTROL_ITEMS = { 
			WOLF_COLLAR:GREAT_WOLF_NECK,
			GREAT_WOLF_NECK:FENRIR_NECK,
			BABY_BUFFALO_PAN:IMPROVED_BUFFALO_PAN,
			BABY_KOOK_OCARINA:IMPROVED_KOOK_OCARINA,
			BABY_COUGAR_CHIME:IMPROVED_COUGAR_CHIME,
			GREAT_SNOW_WOLF_NECK:SNOW_FENRIR_NECK
			}

EXCHANGE_CONTROL_ITEMS = {
			GREAT_WOLF_NECK:GREAT_SNOW_WOLF_NECK,
			FENRIR_NECK:SNOW_FENRIR_NECK,
			WSTRIDER_BUGLE:RED_WSTRIDER_BUGLE,
			SSTRIDER_BUGLE:RED_SSTRIDER_BUGLE,
			TSTRIDER_BUGLE:RED_TSTRIDER_BUGLE
			}

def get_control_item(st) :
  item = st.getPlayer().getPet().getControlItemId()
  if st.getState() == State.CREATED :
    st.set("item",str(item))
  else :
    if st.getInt("item") != item :
      item = 0
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

 def __init__(self, id, name, descr): 
   JQuest.__init__(self, id, name, descr)

 def onEvent(self, event, st) :
   player = st.getPlayer()
   if event == "wolf" :
     if player.getPet() == None :
       htmltext = error_1
       st.exitQuest(1)
     elif player.getPet().getTemplate().npcId not in [WOLF] :
       htmltext = error_2
       st.exitQuest(1)
     elif player.getPet().getLevel() < WOLF_MIN_LEVEL :
       htmltext = error_lvl_wolf
       st.exitQuest(1)
     elif get_distance(player) :
       htmltext = error_3
       st.exitQuest(1)
     elif get_control_item(st) == 0 :
       htmltext = error_2
       st.exitQuest(1)
     else :
       htmltext = end_msg
       item = UPDATE_CONTROL_ITEMS[player.getInventory().getItemByObjectId(player.getPet().getControlItemId()).getItemId()]
       player.getPet().deleteMe(player) #both despawn pet and delete controlitem
       st.giveItems(item, 1)
       st.exitQuest(1)
       st.playSound("ItemSound.quest_finish")
   elif event == "greatw" :
     if player.getPet() == None :
       htmltext = error_1
       st.exitQuest(1)
     elif player.getPet().getTemplate().npcId not in [GREATW] :
       htmltext = error_2
       st.exitQuest(1)
     elif player.getPet().getLevel() < GREATW_MIN_LEVEL :
       htmltext = error_lvl_greatw
       st.exitQuest(1)
     elif get_distance(player) :
       htmltext = error_3
       st.exitQuest(1)
     elif get_control_item(st) == 0 :
       htmltext = error_2
       st.exitQuest(1)
     else :
       htmltext = end_msg
       item = UPDATE_CONTROL_ITEMS[player.getInventory().getItemByObjectId(player.getPet().getControlItemId()).getItemId()]
       player.getPet().deleteMe(player) #both despawn pet and delete controlitem
       st.giveItems(item, 1)
       st.exitQuest(1)
       st.playSound("ItemSound.quest_finish")
   elif event == "baby" :
     if player.getPet() == None :
       htmltext = error_1
       st.exitQuest(1)
     elif player.getPet().getTemplate().npcId not in BABYS :
       htmltext = error_2
       st.exitQuest(1)
     elif player.getPet().getLevel() < BABY_MIN_LEVEL :
       htmltext = error_lvl_baby
       st.exitQuest(1)
     elif get_distance(player) :
       htmltext = error_3
       st.exitQuest(1)
     elif get_control_item(st) == 0 :
       htmltext = error_2
       st.exitQuest(1)
     else :
       htmltext = end_msg
       item = UPDATE_CONTROL_ITEMS[player.getInventory().getItemByObjectId(player.getPet().getControlItemId()).getItemId()]
       player.getPet().deleteMe(player) #both despawn pet and delete controlitem
       st.giveItems(item, 1)
       st.exitQuest(1)
       st.playSound("ItemSound.quest_finish")
   elif event == "greatsw" :
     if player.getPet() == None :
       htmltext = error_1
       st.exitQuest(1)
     elif player.getPet().getTemplate().npcId not in [GREATW] :
       htmltext = error_2
       st.exitQuest(1)
     elif player.getPet().getLevel() < WOLF_MIN_LEVEL :
       htmltext = error_lvl_wolf
       st.exitQuest(1)
     elif get_distance(player) :
       htmltext = error_3
       st.exitQuest(1)
     elif get_control_item(st) == 0 :
       htmltext = error_2
       st.exitQuest(1)
     else :
       htmltext = end_msg
       item = EXCHANGE_CONTROL_ITEMS[player.getInventory().getItemByObjectId(player.getPet().getControlItemId()).getItemId()]
       player.getPet().deleteMe(player) #both despawn pet and delete controlitem
       st.giveItems(item, 1)
       st.exitQuest(1)
       st.playSound("ItemSound.quest_finish")
   elif event == "fenrir" :
     if player.getPet() == None :
       htmltext = error_1
       st.exitQuest(1)
     elif player.getPet().getTemplate().npcId not in [FENRIR] :
       htmltext = error_2
       st.exitQuest(1)
     elif player.getPet().getLevel() < GREATW_MIN_LEVEL :
       htmltext = error_lvl_fenrir
       st.exitQuest(1)
     elif get_distance(player) :
       htmltext = error_3
       st.exitQuest(1)
     elif get_control_item(st) == 0 :
       htmltext = error_2
       st.exitQuest(1)
     else :
       htmltext = end_msg
       item = EXCHANGE_CONTROL_ITEMS[player.getInventory().getItemByObjectId(player.getPet().getControlItemId()).getItemId()]
       player.getPet().deleteMe(player) #both despawn pet and delete controlitem
       st.giveItems(item, 1)
       st.exitQuest(1)
       st.playSound("ItemSound.quest_finish")
   elif event == "wstrider" :
     if player.getPet() == None :
       htmltext = error_1
       st.exitQuest(1)
     elif player.getPet().getTemplate().npcId not in [WSTRIDER] :
       htmltext = error_2
       st.exitQuest(1)
     elif player.getPet().getLevel() < STRIDER_MIN_LEVEL :
       htmltext = error_lvl_strider
       st.exitQuest(1)
     elif get_distance(player) :
       htmltext = error_3
       st.exitQuest(1)
     elif get_control_item(st) == 0 :
       htmltext = error_2
       st.exitQuest(1)
     else :
       htmltext = end_msg
       item = EXCHANGE_CONTROL_ITEMS[player.getInventory().getItemByObjectId(player.getPet().getControlItemId()).getItemId()]
       player.getPet().deleteMe(player) #both despawn pet and delete controlitem
       st.giveItems(item, 1)
       st.exitQuest(1)
       st.playSound("ItemSound.quest_finish")
   elif event == "sstrider" :
     if player.getPet() == None :
       htmltext = error_1
       st.exitQuest(1)
     elif player.getPet().getTemplate().npcId not in [SSTRIDER] :
       htmltext = error_2
       st.exitQuest(1)
     elif player.getPet().getLevel() < STRIDER_MIN_LEVEL :
       htmltext = error_lvl_strider
       st.exitQuest(1)
     elif get_distance(player) :
       htmltext = error_3
       st.exitQuest(1)
     elif get_control_item(st) == 0 :
       htmltext = error_2
       st.exitQuest(1)
     else :
       htmltext = end_msg
       item = EXCHANGE_CONTROL_ITEMS[player.getInventory().getItemByObjectId(player.getPet().getControlItemId()).getItemId()]
       player.getPet().deleteMe(player) #both despawn pet and delete controlitem
       st.giveItems(item, 1)
       st.exitQuest(1)
       st.playSound("ItemSound.quest_finish")
   elif event == "tstrider" :
     if player.getPet() == None :
       htmltext = error_1
       st.exitQuest(1)
     elif player.getPet().getTemplate().npcId not in [TSTRIDER] :
       htmltext = error_2
       st.exitQuest(1)
     elif player.getPet().getLevel() < STRIDER_MIN_LEVEL :
       htmltext = error_lvl_strider
       st.exitQuest(1)
     elif get_distance(player) :
       htmltext = error_3
       st.exitQuest(1)
     elif get_control_item(st) == 0 :
       htmltext = error_2
       st.exitQuest(1)
     else :
       htmltext = end_msg
       item = EXCHANGE_CONTROL_ITEMS[player.getInventory().getItemByObjectId(player.getPet().getControlItemId()).getItemId()]
       player.getPet().deleteMe(player) #both despawn pet and delete controlitem
       st.giveItems(item, 1)
       st.exitQuest(1)
       st.playSound("ItemSound.quest_finish")                                 
   return htmltext

 def onTalk(self, npc, player):
   htmltext = default
   st = player.getQuestState(qn)
   if not st : return htmltext
   htmltext = "Chamberlain.htm"
   return htmltext

QUEST       = Quest(5025, qn, "Custom")

for i in NPCSCH:
   QUEST.addStartNpc(i)
   QUEST.addTalkId(i)