import sys
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest
from net.sf.l2j.gameserver.model.actor.instance import L2PcInstance

qn = "1205_TeleportCube"

TELECUBE_A = 31859 # �w��紵�_�� - �ǰe����
TELECUBE_V = 31759 # �کԥd���_�� - �ǰe����
TELECUBE_B = 29055 # �ڷű_�� - �ǰe����
TELECUBE_S = 32107 # �ɺ����_�� - �ǰe����
TELECUBE_F = 29061 # �̫᪺�ӳ� - �ಾ����

MSG1 = "�w���}�w��紵�_�ޡC"
MSG2 = "�w���}�کԥd���_�ޡC"
MSG3 = "�w���}�ڷű_�ޡC"
MSG4 = "�w���}�ɺ����_�ޡC"
MSG5 = "�w���}�̫᪺�ӳ��C"

class Quest (JQuest):

  def __init__(self,id,name,descr): JQuest.__init__(self,id,name,descr)

  def onFirstTalk (self,npc,player):
      st = player.getQuestState(qn)
      npcId = npc.getNpcId()
      if npcId == TELECUBE_A :
         player.teleToLocation(82671,148650,-3468)
         return MSG1
      elif npcId == TELECUBE_V :
         player.teleToLocation(147704,-56319,-2780)
         return MSG2
      elif npcId == TELECUBE_B :
         player.teleToLocation(146331,25762,-2018)
         return MSG3
      elif npcId == TELECUBE_S :
         player.teleToLocation(10468,-24569,-3650)
         return MSG4
      elif npcId == TELECUBE_F :
         player.teleToLocation(147704,-56319,-2780)
         return MSG5
      return

QUEST       = Quest(1205, qn, "Teleports")

QUEST.addStartNpc(TELECUBE_A)
QUEST.addStartNpc(TELECUBE_V)
QUEST.addStartNpc(TELECUBE_B)
QUEST.addStartNpc(TELECUBE_S)
QUEST.addStartNpc(TELECUBE_F)
QUEST.addFirstTalkId(TELECUBE_A)
QUEST.addFirstTalkId(TELECUBE_V)
QUEST.addFirstTalkId(TELECUBE_B)
QUEST.addFirstTalkId(TELECUBE_S)
QUEST.addFirstTalkId(TELECUBE_F)
