# ���եθ}��

import sys
import time
from net.sf.l2j.gameserver.ai import CtrlIntention
from net.sf.l2j.gameserver.datatables import SkillTable
from net.sf.l2j.gameserver.instancemanager import FrintezzaManager
from net.sf.l2j.gameserver.model import L2Character
from net.sf.l2j.gameserver.model.actor.instance import L2NpcInstance 
from net.sf.l2j.gameserver.model.actor.instance import L2PcInstance
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest
from net.sf.l2j.gameserver.serverpackets import NpcSay
from net.sf.l2j.gameserver.serverpackets import Earthquake
from net.sf.l2j.gameserver.serverpackets import MagicSkillUse
from net.sf.l2j.gameserver.serverpackets import PlaySound
from net.sf.l2j.gameserver.serverpackets import SocialAction

# NPCS
IMPERIAL_TOMB_GUIDE = 32011 # �ӳ��޾ɪ�
HALISHWEAK = 29046 # �����L
HALISHSTRONG = 29047 # �����L�ܨ�
TELECUBE = 29061 # �̫᪺�ӳ� - �ಾ����

# ITEMS
SCROLL = 8073 # �ܵY���F�����ɯ}�G��

MSG1 = "<html><body>�b���ɨ��@��Pı�������F��C�U���A�ӧa�C<br>�]�{�b�ܵY���F���b�ӳ������A�ҥH����i�h�C�^</body></html>"
MSG2 = "<html><body>�S�������C�ڬ��٬O�o�ѫ����W�D�D�H��Ĳ�~��C</body></html>"

class frintezza(JQuest) :
  def __init__(self,id,name,descr) :
      JQuest.__init__(self,id,name,descr)

  def onTalk (self,npc,player):
     st = player.getQuestState("frintezza")
     st2 = player.getQuestState("654_JourneytoaSettlement")
     if not st : return
     Enable = FrintezzaManager.getInstance().isEnableEnterToLair() and st.getQuestItemsCount(SCROLL)
     npcId = npc.getNpcId()
     if st2:
        if st2.getState() == State.COMPLETED :
           if Enable :
              FrintezzaManager.getInstance().setScarletSpawnTask()
              FrintezzaManager.getInstance().addPlayerToLair(st.player)
              st.player.teleToLocation(174243,-86318,-5107) # ���նǰe��m
           else:
              st.exitQuest(1)
              return MSG1
        else:
           st.exitQuest(1)
           return MSG1
     else:
        st.exitQuest(1)
        return MSG1
     return

  def onAttack (self,npc,player,damage,isPet):
     npcId = npc.getNpcId()
     objId = npc.getObjectId()
     heading = npc.getHeading()
     if npcId == HALISHWEAK :
        if npc.getCurrentHp() < npc.getMaxHp() * 0.25 :
           npc.reduceCurrentHp(9999999,npc)
           newNpc = self.addSpawn(HALISHSTRONG, npc)
           newNpc.setHeading(heading)
           newNpc.broadcastPacket(SocialAction(objId,3))
           newNpc.getAI().setIntention(CtrlIntention.AI_INTENTION_ATTACK, player);
     return

  def onKill(self,npc,player,isPet):
     st = player.getQuestState("frintezza")
     if not st: return
     npcId = npc.getNpcId()
     objId = npc.getObjectId()
     heading = npc.getHeading()
     if npcId == HALISHSTRONG :
        FrintezzaManager.getInstance().setBossDead()
        self.addSpawn(TELECUBE,npc.getX(),npc.getY(),npc.getZ(),0,False,600000)
        st.exitQuest(1)
     return

QUEST       = frintezza(-1,"frintezza","ai")

QUEST.addStartNpc(IMPERIAL_TOMB_GUIDE)
QUEST.addTalkId(IMPERIAL_TOMB_GUIDE)
QUEST.addKillId(HALISHSTRONG)
QUEST.addAttackId(HALISHWEAK)
QUEST.addAttackId(HALISHSTRONG)

