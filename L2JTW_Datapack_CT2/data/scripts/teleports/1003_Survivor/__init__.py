#made by Kerberos
import sys
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest

qn = "1003_Survivor"
# pmq �ɥR
# �}�����
# MSG1 = ["�ثe�}�����ج��ثe�b�ĸs�����⤧�U�A�ӥB�ڭx���b�i������C�C"]
# �������
# MSG2 = ["�ثe�������ج��ثe�b�ĸs�����⤧�U�A�ӥB�ڭx���b�i������C�C"]
       # ["�ثe�������ج��ثe�b�ĸs�����⤧�U�A���_�I�a�M�_��Ǵ��P���p�X���x�ե��b�����W�h�ëǩM�I�k�ëǡC�C"]
       # ["�ثe�������ج��ثe�b�ĸs�����⤧�U�A���ڤ誺�j����դw�M�z�F�e����������Ŧ�������A�ѤU���]�N�u���ѨM��d�i�h�I�C" ]

class Quest (JQuest) :

 def __init__(self,id,name,descr): JQuest.__init__(self,id,name,descr)

 def onAdvEvent (self,event,npc,player):
    st = player.getQuestState(qn)
    if not st: return
    if event:
       if player.getLevel() < 75:
          return "32632-3.htm"
       if st.getQuestItemsCount(57) >= 150000 :
          st.takeItems(57,150000)
          player.teleToLocation(-149406, 255247, -80)
          return
    return event

 def onTalk (self,npc,player):
   st = player.getQuestState(qn)
   if not st :
      return ""
   return "32632-1.htm"

QUEST       = Quest(-1,qn,"Teleports")
QUEST.addStartNpc(32632)
QUEST.addTalkId(32632)