import sys
from com.l2jserver.gameserver.model.quest.jython import QuestJython as JQuest
from com.l2jserver.gameserver.network.serverpackets import NpcSay
from com.l2jserver.util import Rnd

# Random Message
TEXT = [ "������ê���t���M���I�����Ǥ��F�A�̡I",\
         "�N���H�̳B���a�I",\
         "���H�̡I�h���a�I",\
         "�ǳW�I�j�a�ֵ��ڳB�M���H�̡I",\
         "��Z�����F�I�j�a�i��I"]

TEXT1 = [ "�I������ê�ڭ̤�Z�I�U��I",\
          "�I������ê�ڭ̤�Z�I�j�a�����ڡI"]
		 
# �w�|�h�i�H�����x
# delu_lizardman_special_commander
class delu_lizardman_special_commander(JQuest) :

    # init function.  Add in here variables that you'd like to be inherited by subclasses (if any)
    def __init__(self, id, name, descr) :
        self.delu_lizardman_special_commander = 21107
        self.FirstAttacked = False
        # finally, don't forget to call the parent constructor to prepare the event triggering
        # mechanisms etc.
        JQuest.__init__(self, id, name, descr)

    def onAttack (self, npc, player, damage, isPet, skill) :
        objId = npc.getObjectId()
        if self.FirstAttacked :
           if Rnd.get(40) : return
           npc.broadcastPacket(NpcSay(objId, 0, npc.getNpcId(), TEXT[Rnd.get(4)]))
        else :
           self.FirstAttacked = True
           npc.broadcastPacket(NpcSay(objId, 0, npc.getNpcId(), player.getName() + TEXT1[Rnd.get(1)]))
        return 

    def onKill (self, npc, player, isPet) :
        npcId = npc.getNpcId()
        if npcId == self.delu_lizardman_special_commander :
            objId = npc.getObjectId()
            self.FirstAttacked = False
        elif self.FirstAttacked :
            self.addSpawn(npcId, npc.getX(), npc.getY(), npc.getZ(), npc.getHeading(), True, 0)
        return 

QUEST = delu_lizardman_special_commander(-1, "delu_lizardman_special_commander", "ai")

QUEST.addKillId(QUEST.delu_lizardman_special_commander)

QUEST.addAttackId(QUEST.delu_lizardman_special_commander)