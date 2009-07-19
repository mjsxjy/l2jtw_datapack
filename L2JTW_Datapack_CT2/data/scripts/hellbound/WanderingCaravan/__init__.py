# By Psychokiller1888

import sys
from net.sf.l2j.gameserver.model.quest           import State
from net.sf.l2j.gameserver.model.quest           import QuestState
from net.sf.l2j.gameserver.model.quest.jython    import QuestJython as JQuest
from net.sf.l2j.gameserver.model.itemcontainer   import PcInventory
from net.sf.l2j.gameserver.model                 import L2ItemInstance
from net.sf.l2j.gameserver.network.serverpackets import InventoryUpdate
from net.sf.l2j.gameserver.network.serverpackets import SystemMessage
from net.sf.l2j.gameserver.network               import SystemMessageId

qn = "WanderingCaravan"

SAND_SCORPION           = 22334   # �F��
DESERT_SCORPION         = 22335   # �F�z��
WANDERING_CARAVAN       = 22339   # �Q��v���Ӷ�
BASIC_CERTIFICATE       = 9850    # �Ӷ���Ż{�Ү�
STANDARD_CERTIFICATE    = 9851    # �Ӷ����Ż{�Ү�
MARK_BETRAYAL           = 9676    # �I�q�̪�����
SCORPION_POISON_STINGER = 10012   # �Ȥl���r�w

class Quest (JQuest):
	def __init__(self,id,name,descr):
		JQuest.__init__(self,id,name,descr)

	def onKill (self,npc,player,isPet):
		npcId = npc.getNpcId()
		if npcId == WANDERING_CARAVAN:
			bcertificate = player.getInventory().getItemByItemId(BASIC_CERTIFICATE)
			scertificate = player.getInventory().getItemByItemId(STANDARD_CERTIFICATE)
			if bcertificate and not scertificate:
				item = player.getInventory().addItem("Quest", MARK_BETRAYAL, 1, player, None)
				iu = InventoryUpdate()
				iu.addItem(item)
				player.sendPacket(iu);
				sm = SystemMessage(SystemMessageId.YOU_PICKED_UP_S1_S2)
				sm.addItemName(item)
				sm.addNumber(1)
				player.sendPacket(sm)
		if npcId in [22334,22335]:
			bcertificate = player.getInventory().getItemByItemId(BASIC_CERTIFICATE)
			scertificate = player.getInventory().getItemByItemId(STANDARD_CERTIFICATE)
			if bcertificate and not scertificate:
				item = player.getInventory().addItem("Quest", SCORPION_POISON_STINGER, 1, player, None)
				iu = InventoryUpdate()
				iu.addItem(item)
				player.sendPacket(iu);
				sm = SystemMessage(SystemMessageId.YOU_PICKED_UP_S1_S2)
				sm.addItemName(item)
				sm.addNumber(1)
				player.sendPacket(sm)
		return

QUEST = Quest(-1, qn, "hellbound")

QUEST.addKillId(22339)
QUEST.addKillId(22334)
QUEST.addKillId(22335)