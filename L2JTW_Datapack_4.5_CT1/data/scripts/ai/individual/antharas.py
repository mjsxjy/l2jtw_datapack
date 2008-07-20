import sys
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest
from net.sf.l2j.gameserver.model.actor.instance import L2PcInstance
from net.sf.l2j.gameserver.instancemanager import AntharasManager

# NPCS
HEART           = 13001 # ���ɪ���Ŧ
ANTHARAS_OLD    = 29019 # �w��紵 (�ª�)
ANTHARAS_WEAK   = 29066 # �w��紵 (�z�ƪ�)
ANTHARAS_NORMAL = 29067 # �w��紵 (���q��)
ANTHARAS_STRONG = 29068 # �w��紵 (�j�ƪ�)
TELECUBE	= 31859 # �ǰe����

# ITEM
PORTAL_STONE    = 3865

MSG1 = "<html><body>����ť�쮨���ӻy���D���n�G<br><font color=\"LEVEL\">�{�b�٤��ह�\�A��w��紵��ԡC�Ц^�a�C</font></body></html>"
MSG2 = "<html><body>����ť�쮨���ӻy���D���n�G<br><font color=\"LEVEL\">�֦��ǰe�ۤ��H�~��P�w��紵��ԡC�Ц^�a�C</font></body></html>"
MSG3 = "<html><body>����ť�쮨���ӻy���D���n�G<br><font color=\"LEVEL\">�w�g���H�i�J�w��紵�_�ޡC�b�L�̻P�a�s����Ե������e�������A�̶i�J�C</font></body></html>"

# Boss: Antharas
class antharas(JQuest) :
  def __init__(self,id,name,descr):
     self.antharas = 29019
     JQuest.__init__(self,id,name,descr)

  def onTalk (self,npc,player):
     st = player.getQuestState("antharas")
     if not st : return
     npcId = npc.getNpcId()
     if npcId == HEART :
        if AntharasManager.getInstance().isEnableEnterToLair():
           if st.getQuestItemsCount(PORTAL_STONE) > 0 :
              st.takeItems(PORTAL_STONE,1)
              AntharasManager.getInstance().setAntharasSpawnTask()
              AntharasManager.getInstance().addPlayerToLair(st.player)
              st.player.teleToLocation(180226,114979,-7704)
              return
           else:
              st.exitQuest(1)
              return MSG2
        else:
           st.exitQuest(1)
           return MSG1
     return

  def onKill (self,npc,player,isPet):
     st = player.getQuestState("antharas")
     if not st: return
     AntharasManager.getInstance().setCubeSpawn()
     st.exitQuest(1)
     return

QUEST      = antharas(-1,"antharas","ai")

QUEST.addStartNpc(HEART)
QUEST.addTalkId(HEART)
QUEST.addKillId(ANTHARAS_OLD)
QUEST.addKillId(ANTHARAS_WEAK)
QUEST.addKillId(ANTHARAS_NORMAL)
QUEST.addKillId(ANTHARAS_STRONG)
