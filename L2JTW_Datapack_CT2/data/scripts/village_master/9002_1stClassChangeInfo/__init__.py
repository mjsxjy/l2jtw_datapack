# Made in Taiwan

import sys
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest

qn = "9002_1stClassChangeInfo"

NPCS = [30026,30031,30154,30358,30520,30525,30565,32139,32140,32147,32150,32153,\
32154,32157,32158,32160,30373,30288,30066,32094,30037,30289,30070,32095,32098,30290,\
30297,30462,32096,30500,30505,30508,32097,30498,30503,30594,32092,30499,30504,30595,\
32093,32196,32199,32193,32202,32171,32191]

# ��¾���� - ����
VHF = [30026,32154] # ���� - �H���Ԥh
VHH = [30031,32153] # ���� - �H���k�v
VEL = [30154,32147] # ���� - ���F
VDK = [30358,32160] # ���� - �·t���F
VOC = [30565,32150] # ���� - �b�~�H
VDF = [30520,30525,32157,32158,32171] # ���� - �G�H�Ԥh
VKM = [32139,32140] # ���� - ��Ѩ�

# ��¾���� - ����
THF = [30373,30288,30066,32094] # �Ԥh���| (�H���Ԥh/���F�Ԥh)
THH = [30037,30289,30070,32095,32098] # ����� (�H���k�v/���F�k�v)
TDK = [30290,30297,30462,32096] # �·t���F���| (�·t���F�Ԥh/�k�v)
TOC = [30500,30505,30508,32097] # �b�~�H���| (�b�~�H�Ԥh/�k�v)
TFW = [30498,30503,30594,32092] # �G�H�ܮw (�G�H�Ԥh)
TFB = [30499,30504,30595,32093] # �G�H�K�E (�G�H�Ԥh)
TKF = [32196,32199] # ��ѨϾԤh - �k
TKM = [32193,32202,32191] # ��ѨϾԤh - �k

# ��¾�D��
MEDALLION_OF_WARRIOR    = 1145 # ���h������
SWORD_OF_RITUAL         = 1161 # �����C
BEZIQUES_RECOMMENDATION = 1190 # �����w�����˨�
ELVEN_KNIGHT_BROOCH     = 1204 # ���F�M�h�ݰw
REORIA_RECOMMENDATION   = 1217 # �p���Q�Ȫ����˨�
MARK_OF_FAITH           = 1201 # �H������
ETERNITY_DIAMOND        = 1230 # �����p��
LEAF_OF_ORACLE          = 1235 # ���٤���
BEAD_OF_SEASON          = 1292 # �u�`���]
GAZE_OF_ABYSS           = 1244 # �`�W����
IRON_HEART              = 1252 # ���K����
JEWEL_OF_DARKNESS       = 1261 # �·t�_��
ORB_OF_ABYSS            = 1270 # �`�W���]
MARK_OF_RAIDER          = 1592 # ��ŧ�̼г�
KHAVATARI_TOTEM         = 1615 # �d�ڶ𨽤�����
MASK_OF_MEDIUM          = 1631 # �I�G�̪�����
SCAV_MARKS              = 1642 # ���ܪ̤���
ARTI_MARKS              = 1635 # �̲צX���Ү�
GWAINS_RECOMMENTADION   = 9753 # �S�ڭ������˨�
STEELRAZOR_EVALUATION   = 9772 # �S�����Ѩ��ɮת��������i��

# ���y�D�� - �۶H�Z���洫��
SHADOW_WEAPON_COUPON_DGRADE = 8869

# event:[newclass,[html],item]
EVENTS={
"class_change_1":[1,["HF-hae1.htm","HF-hae2.htm","HF-hae3.htm","HF-hae4.htm","HF-1st.htm","HF-2nd.htm"],MEDALLION_OF_WARRIOR],
"class_change_4":[4,["HF-hbe1.htm","HF-hbe2.htm","HF-hbe3.htm","HF-hbe4.htm","HF-1st.htm","HF-2nd.htm"],SWORD_OF_RITUAL],
"class_change_7":[7,["HF-hce1.htm","HF-hce2.htm","HF-hce3.htm","HF-hce4.htm","HF-1st.htm","HF-2nd.htm"],BEZIQUES_RECOMMENDATION],
"class_change_19":[19,["HF-eae1.htm","HF-eae2.htm","HF-eae3.htm","HF-eae4.htm","HF-1st.htm","HF-2nd.htm"],ELVEN_KNIGHT_BROOCH],
"class_change_22":[22,["HF-ebe1.htm","HF-ebe2.htm","HF-ebe3.htm","HF-ebe4.htm","HF-1st.htm","HF-2nd.htm"],REORIA_RECOMMENDATION],
"class_change_11":[11,["HH-hae1.htm","HH-hae2.htm","HH-hae3.htm","HH-hae4.htm","HH-1st.htm","HH-2nd.htm"],BEAD_OF_SEASON],
"class_change_15":[15,["HH-hbe1.htm","HH-hbe2.htm","HH-hbe3.htm","HH-hbe4.htm","HH-1st.htm","HH-2nd.htm"],MARK_OF_FAITH],
"class_change_26":[26,["HH-eae1.htm","HH-eae2.htm","HH-eae3.htm","HH-eae4.htm","HH-1st.htm","HH-2nd.htm"],ETERNITY_DIAMOND],
"class_change_29":[29,["HH-ebe1.htm","HH-ebe2.htm","HH-ebe3.htm","HH-ebe4.htm","HH-1st.htm","HH-2nd.htm"],LEAF_OF_ORACLE],
"class_change_32":[32,["DK-fae1.htm","DK-fae2.htm","DK-fae3.htm","DK-fae4.htm","DK-1st.htm","DK-2nd.htm"],GAZE_OF_ABYSS],
"class_change_35":[35,["DK-fbe1.htm","DK-fbe2.htm","DK-fbe3.htm","DK-fbe4.htm","DK-1st.htm","DK-2nd.htm"],IRON_HEART],
"class_change_39":[39,["DK-mae1.htm","DK-mae2.htm","DK-mae3.htm","DK-mae4.htm","DK-1st.htm","DK-2nd.htm"],JEWEL_OF_DARKNESS],
"class_change_42":[42,["DK-mbe1.htm","DK-mbe2.htm","DK-mbe3.htm","DK-mbe4.htm","DK-1st.htm","DK-2nd.htm"],ORB_OF_ABYSS],
"class_change_45":[45,["ORC-fae1.htm","ORC-fae2.htm","ORC-fae3.htm","ORC-fae4.htm","ORC-1st.htm","ORC-2nd.htm"],MARK_OF_RAIDER],
"class_change_47":[47,["ORC-fbe1.htm","ORC-fbe2.htm","ORC-fbe3.htm","ORC-fbe4.htm","ORC-1st.htm","ORC-2nd.htm"],KHAVATARI_TOTEM],
"class_change_50":[50,["ORC-me1.htm","ORC-me2.htm","ORC-me3.htm","ORC-me4.htm","ORC-1st.htm","ORC-2nd.htm"],MASK_OF_MEDIUM],
"class_change_54":[54,["DFW-e1.htm","DFW-e2.htm","DFW-e3.htm","DFW-e4.htm","DFW-1st.htm","DFW-2nd.htm"],SCAV_MARKS],
"class_change_56":[56,["DFB-e1.htm","DFB-e2.htm","DFB-e3.htm","DFB-e4.htm","DFB-1st.htm","DFB-2nd.htm"],ARTI_MARKS],
"class_change_125":[125,["KF-e1.htm","KF-e1.htm","KF-e1.htm","KF-e2.htm","KF-1st.htm","KF-1st.htm"],GWAINS_RECOMMENTADION],
"class_change_126":[126,["KM-e1.htm","KM-e1.htm","KM-e1.htm","KM-e2.htm","KF-1st.htm","KF-1st.htm"],STEELRAZOR_EVALUATION]
}

class Quest (JQuest) :
   def __init__(self,id,name,descr):
       JQuest.__init__(self,id,name,descr)

   def onEvent (self,event,st) :
      htmltext = event
      if event in ["class_change_1","class_change_4","class_change_7","class_change_19","class_change_22","class_change_11","class_change_15","class_change_26","class_change_29","class_change_32","class_change_35","class_change_39","class_change_42","class_change_45","class_change_47","class_change_50","class_change_54","class_change_56","class_change_125","class_change_126"] :
         newclass,html,item = EVENTS[event]
         htmltext = html
         if st.player.getClassId().getId() in [1,4,7,19,22,11,15,26,29,32,35,39,42,45,47,50,54,56,125,126] :
               htmltext = html[4]
               st.exitQuest(1)
         elif st.player.getClassId().getId() in [2,3,5,6,8,9,88,89,90,91,92,93,20,21,23,24,99,100,101,102,12,13,14,16,17,94,95,96,97,98,27,28,30,103,104,105,33,34,36,37,106,107,108,109,40,41,43,110,111,112,46,48,113,114,51,52,115,116,55,57,117,118,127,128,131,132,129,130,135,133,134,136] :
               htmltext = html[5]
               st.exitQuest(1)
         else :
            if st.player.getLevel() > 19:
               if st.getQuestItemsCount(item) :
                  st.takeItems(item,1)
                  st.giveItems(SHADOW_WEAPON_COUPON_DGRADE,15)
                  st.playSound("ItemSound.quest_fanfare_2")
                  st.player.setClassId(newclass)
                  st.player.setBaseClass(newclass)
                  st.player.broadcastUserInfo()
                  htmltext = html[3]
                  st.exitQuest(1)
               else :
                  htmltext = html[2]
                  st.exitQuest(1)
            else :
               if st.getQuestItemsCount(item) :
                  htmltext = html[1]
                  st.exitQuest(1)
               else :
                  htmltext = html[0]
                  st.exitQuest(1)
      return htmltext

   def onTalk (self,npc,player) :
      htmltext = "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>"
      st = player.getQuestState(qn)
      npcId = npc.getNpcId()
      classId = player.getClassId().getId()
      raceId = player.getRace().ordinal()
############################################################################
      if npcId in VHF : # ���� - �H���Ԥh
         if raceId == 0 :
            if classId in [0,1,4,7,2,3,5,6,8,9,88,89,90,91,92,93] :
               htmltext = str(npcId)+"-01f.htm"
            else :
               htmltext = str(npcId)+"-00.htm"
         else :
            htmltext = str(npcId)+"-00.htm"
############################################################################
      elif npcId in VHH : # ���� - �H���k�v
         if raceId == 0 :
            if classId in [10,11,15,12,13,14,16,17,94,95,96,97,98] :
               htmltext = str(npcId)+"-01m.htm"
            else :
               htmltext = str(npcId)+"-00.htm"
         else :
            htmltext = str(npcId)+"-00.htm"
############################################################################
      elif npcId in VEL : # ���� - ���F
         if raceId == 1 :
            if classId in [18,19,22,20,21,23,24,99,100,101,102] :
               htmltext = str(npcId)+"-01f.htm"
            elif classId in [25,26,29,27,28,30,103,104,105] :
               htmltext = str(npcId)+"-01m.htm"
         else :
            htmltext = str(npcId)+"-00.htm"
############################################################################
      elif npcId in VDK : # ���� - �·t���F
         if raceId == 2 :
            if classId in [31,32,35,33,34,36,37,106,107,108,109] :
               htmltext = str(npcId)+"-01f.htm"
            elif classId in [38,39,42,40,41,43,110,111,112] :
               htmltext = str(npcId)+"-01m.htm"
         else :
            htmltext = str(npcId)+"-00.htm"
############################################################################
      elif npcId in VOC : # ���� - �b�~�H
         if raceId == 3 :
            if classId in [44,45,47,46,48,113,114] :
               htmltext = str(npcId)+"-01f.htm"
            elif classId in [49,50,51,52,115,116] :
               htmltext = str(npcId)+"-01m.htm"
         else :
            htmltext = str(npcId)+"-00.htm"
############################################################################
      elif npcId in VDF : # ���� - �G�H
         if raceId == 4 :
            if classId in [53,54,56,55,57,117,118] :
               htmltext = str(npcId)+"-01.htm"
         else :
            htmltext = str(npcId)+"-00.htm"
############################################################################
      elif npcId in VKM : # ���� - ��Ѩ�
         htmltext = str(npcId)+"-01.htm"
############################################################################
      elif npcId in THF : # �Ԥh���| - �H���Ԥh/���F�Ԥh
         if raceId in [0,1] :
            if classId in [0,1,4,7,2,3,5,6,8,9,88,89,90,91,92,93] :
               htmltext = "HF-01h.htm"
            elif classId in [18,19,22,20,21,23,24,99,100,101,102] :
               htmltext = "HF-01e.htm"
            else :
               htmltext = "HF-00.htm"
         else :
            htmltext = "HF-00.htm"
############################################################################
      elif npcId in THH : # ����� - �H���k�v/���F�k�v
         if raceId in [0,1] :
            if classId in [10,11,15,12,13,14,16,17,94,95,96,97,98] :
               htmltext = "HH-01h.htm"
            elif classId in [25,26,29,27,28,30,103,104,105] :
               htmltext = "HH-01e.htm"
            else :
               htmltext = "HH-00.htm"
         else :
            htmltext = "HH-00.htm"
############################################################################
      elif npcId in TDK : # �·t���F���| - �·t���F�Ԥh/�·t���F�k�v
         if raceId == 2 :
            if classId in [31,32,35,33,34,36,37,106,107,108,109] :
               htmltext = "DK-01f.htm"
            elif classId in [38,39,42,40,41,43,110,111,112] :
               htmltext = "DK-01m.htm"
         else :
            htmltext = "DK-00.htm"
############################################################################
      elif npcId in TOC : # �b�~�H���| - �b�~�H�Ԥh/�b�~�H�k�v
         if raceId == 3 :
            if classId in [44,45,47,46,48,113,114] :
               htmltext = "ORC-01f.htm"
            elif classId in [49,50,51,52,115,116] :
               htmltext = "ORC-01m.htm"
         else :
            htmltext = "ORC-00.htm"
############################################################################
      elif npcId in TFW : # �ܮw - �G�H�Ԥh 
         if raceId == 4 :
            if classId in [53,54,56,55,57,117,118] :
               htmltext = "DFW-01.htm"
         else :
            htmltext = "DFW-00.htm"
############################################################################
      elif npcId in TFB : # �K�E - �G�H�Ԥh 
         if raceId == 4 :
            if classId in [53,54,56,55,57,117,118] :
               htmltext = "DFB-01.htm"
         else :
            htmltext = "DFB-00.htm"
############################################################################
      elif npcId in TKF : # ��ѨϤ��| - ��ѨϾԤh(�k)
         if raceId == 5 :
            if classId in [123,125,127,128,131,132] :
               htmltext = "KF-01.htm"
            else :
               htmltext = "KFF-00.htm"
         else :
            htmltext = "KF-00.htm"
############################################################################
      elif npcId in TKM : # ��ѨϤ��| - ��ѨϾԤh(�k)
         if raceId == 5 :
            if classId in [124,126,129,130,135,133,134,136] :
               htmltext = "KM-01.htm"
            else :
               htmltext = "KFM-00.htm"
         else :
            htmltext = "KF-00.htm"
############################################################################
      return htmltext

QUEST      = Quest(9002,qn,"village_master")

for i in NPCS:
  QUEST.addStartNpc(i)
  QUEST.addTalkId(i)
