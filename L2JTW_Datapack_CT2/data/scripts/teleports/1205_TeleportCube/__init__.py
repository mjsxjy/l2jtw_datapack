import sys
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest
from net.sf.l2j.gameserver.model.actor.instance import L2PcInstance

qn = "1205_TeleportCube"

TELECUBE_S = 32107 # �ɺ����_�� - �ǰe����
TELECUBE_F = 29061 # �̫᪺�ӳ� - �ಾ����

MSG4 = "�w���}�ɺ����_�ޡC"
MSG5 = "�w���}�̫᪺�ӳ��C"

class Quest (JQuest):

  def __init__(self,id,name,descr): JQuest.__init__(self,id,name,descr)

  def onFirstTalk (self,npc,player):
      st = player.getQuestState(qn)
      npcId = npc.getNpcId()
      if npcId == TELECUBE_S :
         player.teleToLocation(10468,-24569,-3650)
         return MSG4
      elif npcId == TELECUBE_F :
         player.teleToLocation(147704,-56319,-2780)
         return MSG5
      return

QUEST       = Quest(1205, qn, "Teleports")

QUEST.addStartNpc(TELECUBE_S)
QUEST.addStartNpc(TELECUBE_F)
QUEST.addFirstTalkId(TELECUBE_S)
QUEST.addFirstTalkId(TELECUBE_F)
