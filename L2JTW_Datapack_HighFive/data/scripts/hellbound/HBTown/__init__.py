# author: Psycho(killer1888) / L2jFree
# By: evill33t & vital
# Update by pmq 12-05-2011
import sys
from java.lang                                       import System
from com.l2jserver.gameserver.ai                     import CtrlIntention
from com.l2jserver.gameserver.datatables             import DoorTable
from com.l2jserver.gameserver.datatables             import ItemTable
from com.l2jserver.gameserver.datatables             import SpawnTable
from com.l2jserver.gameserver.instancemanager        import HellboundManager
from com.l2jserver.gameserver.instancemanager        import InstanceManager
from com.l2jserver.gameserver.model                  import L2CharPosition
from com.l2jserver.gameserver.model                  import L2ItemInstance
from com.l2jserver.gameserver.model.actor            import L2Summon
from com.l2jserver.gameserver.model.entity           import Instance
from com.l2jserver.gameserver.model.itemcontainer    import PcInventory
from com.l2jserver.gameserver.model.quest            import State
from com.l2jserver.gameserver.model.quest            import QuestState
from com.l2jserver.gameserver.model.quest.jython     import QuestJython as JQuest
from com.l2jserver.gameserver.network                import SystemMessageId
from com.l2jserver.gameserver.network.serverpackets  import CreatureSay
from com.l2jserver.gameserver.network.serverpackets  import InventoryUpdate
from com.l2jserver.gameserver.network.serverpackets  import MagicSkillUse
from com.l2jserver.gameserver.network.serverpackets  import NpcSay
from com.l2jserver.gameserver.network.serverpackets  import SystemMessage
from com.l2jserver.gameserver.util                   import Util
from com.l2jserver.util                              import Rnd

qn = "HBTown"

debug = False

# NPCs
KANAF          = 32346  # �d�Ǥ�
PRISONER       = 32358  # �����R��
STELE          = 32343  # ����۸O

# Mobs
AMASKARI       = 22449  # ���ڤh�d�� ���ݱM�a
KEYMASTER      = 22361  # ���K���� �_�ͦu��
GUARD          = 22359  # ����ĵ�çL
NATIVE         = 22450  # �Q���ݪ�����
LIST = [22359, 22360]   # ����ĵ�çL / ���Ϩ��ާL

# Items
KEY            = 9714   # �c�]�课�_��

AMASKARI_TEXT  = ["�����A���`���ݵۧA�I","�p�H�A�u���H��_","�����A�ڱ��F�A�Ӵ�����a�H�ۥ�","�D�H�ڦC�����|�ܰ���","��ӬO�A..."]
SLAVES_TEXT    = ["�ש�ۥѤF�I","���§A�ϧڡI","�ڥi�H�^�a�աI","�o�A�����U�A�ڪ��B�͡I"]

KLOCS = [
		[14264,250333,-1935,15133],
		[19961,256249,-2086,47344],
		[17271,252888,-2010,64381],
		[15784,252413,-2010,49254],
		[22029,254160,-2005,60246]
]

ReturnPort = [[16278,283633,-9709]]

dataIndex  = 0

class PyObject :
	pass

def sendSlaves(self,player,world):
	playerList = InstanceManager.getInstance().getInstance(player.getInstanceId()).getPlayers().toArray()
	for slave in world.AmaskariSlaves.npclist:
		#char = playerList[Rnd.get(len(playerList))]
		#player = L2World.getInstance().findPlayer(char)
		slave.setRunning()
		slave.addDamageHate(player, 0, 999)
		slave.getAI().setIntention(CtrlIntention.AI_INTENTION_ATTACK, player)

def callGuards(self,npc,player,world):
	guardList = []
	newNpc = self.addSpawn(GUARD, npc.getX()+50, npc.getY(), npc.getZ(), 0, False, 0, False, world.instanceId)
	guardList.append(newNpc)
	newNpc = self.addSpawn(GUARD, npc.getX()-50, npc.getY(), npc.getZ(), 0, False, 0, False, world.instanceId)
	guardList.append(newNpc)
	newNpc = self.addSpawn(GUARD, npc.getX(), npc.getY()+50, npc.getZ(), 0, False, 0, False, world.instanceId)
	guardList.append(newNpc)
	newNpc = self.addSpawn(GUARD, npc.getX(), npc.getY()-50, npc.getZ(), 0, False, 0, False, world.instanceId)
	guardList.append(newNpc)
	for mob in guardList:
		mob.setRunning()
		mob.addDamageHate(player, 0, 999)
		mob.getAI().setIntention(CtrlIntention.AI_INTENTION_ATTACK, player)

def spawnAmaskari(self,world):
	world.amaskariAttacked = False
	amaskari = self.addSpawn(AMASKARI, 19496, 253125, -2030, 0, False, 0, False, world.instanceId)
	self.Amaskari = amaskari
	world.AmaskariSlaves = PyObject()
	world.AmaskariSlaves.npclist = []
	newNpc = self.addSpawn(NATIVE, amaskari.getX(), amaskari.getY()+300, amaskari.getZ(), 0, False, 0, False, world.instanceId)
	world.AmaskariSlaves.npclist.append(newNpc)
	newNpc = self.addSpawn(NATIVE, amaskari.getX(), amaskari.getY()-300, amaskari.getZ(), 0, False, 0, False, world.instanceId)
	world.AmaskariSlaves.npclist.append(newNpc)
	newNpc = self.addSpawn(NATIVE, amaskari.getX()+300, amaskari.getY(), amaskari.getZ(), 0, False, 0, False, world.instanceId)
	world.AmaskariSlaves.npclist.append(newNpc)
	newNpc = self.addSpawn(NATIVE, amaskari.getX()-300, amaskari.getY(), amaskari.getZ(), 0, False, 0, False, world.instanceId)
	world.AmaskariSlaves.npclist.append(newNpc)
	newNpc = self.addSpawn(NATIVE, amaskari.getX()+300, amaskari.getY()+300, amaskari.getZ(), 0, False, 0, False, world.instanceId)
	world.AmaskariSlaves.npclist.append(newNpc)
	newNpc = self.addSpawn(NATIVE, amaskari.getX()-300, amaskari.getY()-300, amaskari.getZ(), 0, False, 0, False, world.instanceId)
	world.AmaskariSlaves.npclist.append(newNpc)
	newNpc = self.addSpawn(NATIVE, amaskari.getX()+300, amaskari.getY()-300, amaskari.getZ(), 0, False, 0, False, world.instanceId)
	world.AmaskariSlaves.npclist.append(newNpc)
	newNpc = self.addSpawn(NATIVE, amaskari.getX()-300, amaskari.getY()+300, amaskari.getZ(), 0, False, 0, False, world.instanceId)
	world.AmaskariSlaves.npclist.append(newNpc)
	for slave in world.AmaskariSlaves.npclist:
		slave.setRunning()
		slave.getAI().setIntention(CtrlIntention.AI_INTENTION_FOLLOW, amaskari)

def autochat(npc,text) :
	if npc: npc.broadcastPacket(NpcSay(npc.getObjectId(),0,npc.getNpcId(),text))
	return

def dropItem(player,npc,itemId,count):
	ditem = ItemTable.getInstance().createItem("Loot", itemId, count, player)
	ditem.dropMe(npc, npc.getX(), npc.getY(), npc.getZ()); 

def checkCondition(player):
	if not player.getLevel() >= 78:
		sm = SystemMessage.getSystemMessage(SystemMessageId.C1_LEVEL_REQUIREMENT_NOT_SUFFICIENT)
		sm.addCharName(player)
		player.sendPacket(sm)
		return False
	return True

def teleportPlayer(self,player,teleto):
	player.setInstanceId(teleto.instanceId)
	player.teleToLocation(teleto.x,teleto.y,teleto.z)
	pet = player.getPet()
	if pet != None :
		pet.setInstanceId(teleto.instanceId)
		pet.teleToLocation(teleto.x,teleto.y,teleto.z)
	return

def getExistingInstanceId(player):
	instanceId = 0
	party = player.getParty()
	if party == None:
		return 0
	for partyMember in party.getPartyMembers().toArray():
		if partyMember.getInstanceId()!=0:
			instanceId = partyMember.getInstanceId()
	return instanceId

def exitInstance(player,tele):
	player.setInstanceId(0)
	player.teleToLocation(tele.x, tele.y, tele.z)
	pet = player.getPet()
	if pet != None :
		pet.setInstanceId(0)
		pet.teleToLocation(tele.x, tele.y, tele.z)

class Quest(JQuest):

	def __init__(self, id, name, descr):
		JQuest.__init__(self, id, name, descr)
		self.worlds = {}
		self.world_ids = []
		self.Slaves = {}
		self.currentWorld = 0
		self.Lock = 0
		self.ALock = 0
		self.NATIVELock = 0
		self.hellboundLevel = 0
		self.trustp = 0
		try:
			self.trustp = int(self.loadGlobalQuestVar("trust10p"))
		except:
			pass
		self.saveGlobalQuestVar("trust10p", str(self.trustp))
		if HellboundManager.getInstance().getLevel() == 10: self.startQuestTimer("CheckTrustP", 60000, None, None, True)

	def onAdvEvent(self, event, npc, player):
		if event == "CheckTrustP":
			if self.trustp >= 500000:
				HellboundManager.getInstance().changeLevel(11)
				self.trustp = 0
				self.saveGlobalQuestVar("trust10p", str(self.trustp))
				self.cancelQuestTimers("CheckTrustP")
		elif event == "decayNpc":
			npc.decayMe()
		elif event == "NATIVESay":
			world = self.worlds[npc.getInstanceId()]
			for npc in world.AmaskariSlaves.npclist:
				npc.broadcastPacket(NpcSay(22450, 0, 22450, "�ڷ|...�N...����...����...�I"))
		elif event == "freeprisoner":
			world = self.worlds[npc.getInstanceId()]
			sayNpc = npc.getObjectId()
			npc.broadcastPacket(NpcSay(sayNpc, 0, npc.getNpcId(), "�h�����U�I�ݦu�̰��W�N�n�ӤF�ָ��_��..."))
			self.startQuestTimer("decayNpc", 5000, npc, None)
			chance = Rnd.get(100)
			if chance <= 30:
				if not world.guardsSpawned:
					callGuards(self,npc,player,world)
					world.guardsSpawned = True
					npc.broadcastPacket(NpcSay(22359, 0, 22359, "�o.�{.�J.�I.��...�I"))
					hellboundLevel = HellboundManager.getInstance().getLevel()
					if hellboundLevel == 10:
						HellboundManager.getInstance().increaseTrust(50)
						self.trustp += 50
						self.saveGlobalQuestVar("trust10p", str(self.trustp))
		elif event == "key":
			world = self.worlds[npc.getInstanceId()]
			if not world.instanceFinished:
				key = player.getInventory().getItemByItemId(KEY)
				if key != None:
					world.instanceFinished = True
					player.destroyItemByItemId("Moonlight Stone", KEY, 1, player, True)
					instance = InstanceManager.getInstance().getInstance(npc.getInstanceId())
					if instance != None:
						instance.setDuration(300000)
						instance.setReturnTeleport(ReturnPort[dataIndex][0],ReturnPort[dataIndex][1],ReturnPort[dataIndex][2])
				else :
					return "32343-2.htm"
			else :
				return "32343-1.htm"
		return

	def onTalk(self, npc, player):
		npcId = npc.getNpcId()
		st = player.getQuestState(qn)
		if not st :
			st = self.newQuestState(player)
		hellboundLevel = HellboundManager.getInstance().getLevel()
		if hellboundLevel < 10: return "<html><body>�d�ǤҡG<br>�A�O�֡H...<br>�ֺu�}�A�ڤ��Q�M�A���ܡI</body></html>"
		if npcId == KANAF :
			party = player.getParty()
			if not party:
				return "32346-0.htm"
			if not checkCondition(player):
				return
			else :
				tele = PyObject()
				tele.x = 14205
				tele.y = 255451
				tele.z = -2025
				instanceId = getExistingInstanceId(player)
				if instanceId == 0:
					instanceId = InstanceManager.getInstance().createDynamicInstance("HBTown.xml")
					if not self.worlds.has_key(instanceId):
						world = PyObject()
						world.rewarded=[]
						world.instanceId = instanceId
						world.instanceFinished = False
						world.guardsSpawned = False
						self.worlds[instanceId] = world
						self.world_ids.append(instanceId)
						self.currentWorld = instanceId
						print "�a���¥��ϡG�ϥΧY�ɦa�ϡG" +str(instanceId) + " �гy���a�G" + str(player.getName())
						KLOC = KLOCS[Rnd.get(len(KLOCS))]
						newKeymaster = self.addSpawn(KEYMASTER,KLOC[0],KLOC[1],KLOC[2],KLOC[3],False,0,False,world.instanceId)
						self.keymaster = newKeymaster
						self.keymasterattacked = False
						spawnAmaskari(self,world)
						tele.instanceId = instanceId
						teleportPlayer(self,player,tele)
						party = player.getParty()
						if party != None:
							for partyMember in party.getPartyMembers().toArray():
								teleportPlayer(self,partyMember,tele)
				else:
					for worldid in self.world_ids:
						if worldid == instanceId:
							foundworld = True
						if not worldid == instanceId:
							foundworld = False
					if not foundworld:
						player.sendPacket(SystemMessage.sendString("�A�������w�i�J�䥦���Y�ɦa�ϡC"))
						return
					tele.instanceId = instanceId
					teleportPlayer(self,player,tele)
		return

	def onKill(self, npc, player, isPet):
		npcId = npc.getNpcId()
		objId = npc.getObjectId()
		if self.worlds.has_key(npc.getInstanceId()):
			world = self.worlds[npc.getInstanceId()]
			if npcId == KEYMASTER:
				HellboundManager.getInstance().increaseTrust(250)
				self.trustp += 250
				self.saveGlobalQuestVar("trust10p", str(self.trustp))
				chance = Rnd.get(100)
				if chance <= 75:
					npc.broadcastPacket(NpcSay(objId, 0, npc.getNpcId(), "�ڪ��ѧr�I��.��..�_...��......."))
					dropItem(player,npc,9714,1)
				else:
					npc.broadcastPacket(NpcSay(objId, 0, npc.getNpcId(), "�A�û�������o��ڪ�..�_�͡I"))
			if npcId == AMASKARI:
				if HellboundManager.getInstance().getLevel() <= 11:
					HellboundManager.getInstance().increaseTrust(500)
					self.trustp += 500
					self.saveGlobalQuestVar("trust10p", str(self.trustp))
					for slave in world.AmaskariSlaves.npclist:
						slave.setRunning()
						slave.getAI().setIntention(CtrlIntention.AI_INTENTION_MOVE_TO, L2CharPosition(17384, 251788, -2015, 0))
						self.startQuestTimer("decayNpc",8000,slave,None)
						slave.broadcastPacket(NpcSay(slave.getObjectId(),0,NATIVE,SLAVES_TEXT[Rnd.get(len(SLAVES_TEXT))]))
						self.ALock = 0
			if npcId == NATIVE:
				HellboundManager.getInstance().increaseTrust(-10)
				self.trustp -= 10
				self.saveGlobalQuestVar("trust10p", str(self.trustp))
				self.Lock = 0
			if npcId == PRISONER:
				HellboundManager.getInstance().increaseTrust(-10)
				self.trustp -= 10
				self.saveGlobalQuestVar("trust10p", str(self.trustp))
			if npcId in LIST:
				HellboundManager.getInstance().increaseTrust(20)
				self.trustp += 20
				self.saveGlobalQuestVar("trust10p", str(self.trustp))
		return

	def onAttack(self, npc, player, damage, isPet, skill):
		st = player.getQuestState(qn)
		npcId = npc.getNpcId()
		objId = npc.getObjectId()
		maxHp = npc.getMaxHp()
		nowHp = npc.getStatus().getCurrentHp()
		if self.worlds.has_key(npc.getInstanceId()):
			world = self.worlds[npc.getInstanceId()]
			if npcId == AMASKARI:
				if not world.amaskariAttacked:
					world.amaskariAttacked = True
					sendSlaves(self,player,world)
					npc.broadcastPacket(NpcSay(npc.getObjectId(),0,AMASKARI,AMASKARI_TEXT[Rnd.get(len(AMASKARI_TEXT))]))
#					self.startQuestTimer("NATIVESay", 5000, npc, None)
				if (nowHp < maxHp * 0.1):
					if self.Lock == 0:
						npc.broadcastPacket(CreatureSay(objId, 0, npc.getName(), "�ڱN���j�a�M�ڤ@�˪��h�W�I"))
						self.Lock = 1
			if npcId == KEYMASTER :
				if not self.keymasterattacked:
					self.keymasterattacked = True
				if (nowHp < maxHp * 0.1):
					if self.ALock == 0:
						self.Amaskari.teleToLocation(player.getX(),player.getY(),player.getZ())
						self.Amaskari.setTarget(player)
						for slave in world.AmaskariSlaves.npclist:
							slave.teleToLocation(player.getX() +100,player.getY() -100,player.getZ())
							slave.broadcastPacket(NpcSay(slave.getObjectId(),0,NATIVE,"�ڷ|...�N...����...����...�I"))
							self.ALock = 1
			if npcId == NATIVE :
				if self.NATIVELock == 0:
					npc.broadcastPacket(CreatureSay(objId, 0, npc.getName(), "�K...�n�h...�n�h...�ڡI"))
					self.NATIVELock = 1
		return

QUEST = Quest(-1, qn, "hellbound")

for id in [32343,32346,32358] :
	QUEST.addStartNpc(id)

for id in [32343,32346,32358] :
	QUEST.addTalkId(id)

for i in LIST:
    QUEST.addKillId(i)

for mob in [22361,22449,22450] :
	QUEST.addAttackId(mob)

for mob in [22361,22449,22450] :
	QUEST.addKillId(mob)