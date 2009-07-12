# Made by Surion 
import sys
from net.sf.l2j.gameserver.instancemanager       import InstanceManager
from net.sf.l2j.gameserver.model.entity          import Instance
from net.sf.l2j.gameserver.model.quest           import State
from net.sf.l2j.gameserver.model.quest           import QuestState
from net.sf.l2j.gameserver.model.quest.jython    import QuestJython as JQuest
from net.sf.l2j.gameserver.network               import SystemMessageId
from net.sf.l2j.gameserver.network.serverpackets import SystemMessage

qn = "Kamaloka_39"

KamalokaLevel    = 39
InstanceTemplate = "Kamaloka_39.xml"
KamaLevels       = [39                      ]
KamaPartySize    = [9                       ]
KamaNPC          = [30071                   ]
KamaTemplate     = ["Kamaloka_39.xml"       ]
KamaMob          = [22488,22489,22490       ]
KamaMinion       = [29133,29134             ]
KamaBoss         = [29132                   ]
KamaBoss1        = [25617                   ]
KamaPorts        = [[-10700,-174882,-10936] ]
ReturnPort       = [[18149,146024,-3100]    ]
dataIndex = 0

def getKamaIndex(level):
	if level == 39:
		return 0

def isPartySizeOk(player):
	members = player.getParty().getMemberCount()
	if members > KamaPartySize[dataIndex]:
		return False
	return True

def isWithinLevel(player):
	if player.getLevel() > KamaLevels[dataIndex]+5:
		return False
	if player.getLevel() < KamaLevels[dataIndex]-5:
		return False
	return True

def checkPrimaryConditions(player):
	if not player.getParty():
		player.sendPacket(SystemMessage(SystemMessageId.NOT_IN_PARTY_CANT_ENTER))
		return False
	if not player.getParty().isLeader(player):
		player.sendPacket(SystemMessage(SystemMessageId.ONLY_PARTY_LEADER_CAN_ENTER))
		return False
	if not isPartySizeOk(player):
		player.sendPacket(SystemMessage(SystemMessageId.PARTY_EXCEEDED_THE_LIMIT_CANT_ENTER))
	if not isWithinLevel(player):
		sm = SystemMessage(SystemMessageId.C1_LEVEL_REQUIREMENT_NOT_SUFFICIENT)
		sm.addCharName(player)
		player.sendPacket(sm)
		return False
	for partyMember in player.getParty().getPartyMembers().toArray():
		if not partyMember.isInsideRadius(player, 500, False, False):
			sm = SystemMessage(SystemMessageId.C1_IS_IN_LOCATION_THAT_CANNOT_BE_ENTERED)
			sm.addCharName(partyMember)
			player.sendPacket(sm)
			return False
	return True

def checkNewInstanceConditions(player):
	if not player.checkKamaDate(2):
		sm = SystemMessage(SystemMessageId.C1_MAY_NOT_REENTER_YET)
		sm.addCharName(player)
		player.sendPacket(sm)
		return False
	if not player.getParty().isLeader(player):
		player.sendPacket(SystemMessage(SystemMessageId.ONLY_PARTY_LEADER_CAN_ENTER))
		return False
	party = player.getParty()
	if party == None:
		return True
	for partyMember in party.getPartyMembers().toArray():
		if not isWithinLevel(partyMember):
			sm = SystemMessage(SystemMessageId.C1_LEVEL_REQUIREMENT_NOT_SUFFICIENT)
			sm.addCharName(partyMember)
			player.sendPacket(sm)
			return False
	for partyMember in player.getParty().getPartyMembers().toArray():
		if not partyMember.isInsideRadius(player, 500, False, False):
			sm = SystemMessage(SystemMessageId.C1_IS_IN_LOCATION_THAT_CANNOT_BE_ENTERED)
			sm.addCharName(partyMember)
			player.sendPacket(sm)
			return False
		if not partyMember.checkKamaDate(2):
			sm = SystemMessage(SystemMessageId.C1_MAY_NOT_REENTER_YET)
			sm.addCharName(partyMember)
			player.sendPacket(sm)
			return False
	return True

def getExistingInstanceId(player):
	instanceId = 0
	party = player.getParty()
	if party == None:
		return 0
	for partyMember in party.getPartyMembers().toArray():
		if partyMember.getInstanceId()!=0:
			instanceId = partyMember.getInstanceId()
	return instanceId

def teleportPlayer(self,player,teleto):
	player.setInstanceId(teleto.instanceId)
	player.teleToLocation(teleto.x,teleto.y,teleto.z)
	pet = player.getPet()
	if pet != None :
		pet.setInstanceId(teleto.instanceId)
		pet.teleToLocation(teleto.x,teleto.y,teleto.z)
	return

def exitInstance(player,tele):
	tele.x = ReturnPort[dataIndex][0]
	tele.y = ReturnPort[dataIndex][1]
	tele.z = ReturnPort[dataIndex][2]
	player.setInstanceId(0)
	player.teleToLocation(tele.x,tele.y,tele.z)
	pet = player.getPet()
	if pet != None :
		pet.setInstanceId(0)
		pet.teleToLocation(tele.x,tele.y,tele.z)

def checkKillProgress(npc,room):
	cont = True
	if room.npclist.has_key(npc):
		room.npclist[npc] = True
	for npc in room.npclist.keys():
		if room.npclist[npc] == False:
			cont = False
	return cont

def runStartRoom(self, world):
	world.status = 0
	world.startRoom = PyObject()
	world.startRoom.npclist = {}
	newNpc = self.addSpawn(KamaMob[1], -12413,-174905,-10955, 0, False, 0, False, world.instanceId)
	world.startRoom.npclist[newNpc] = False
	newNpc = self.addSpawn(KamaMob[1], -12377,-174838,-10953, 0, False, 0, False, world.instanceId)
	world.startRoom.npclist[newNpc] = False
	newNpc = self.addSpawn(KamaMob[0], -12381,-174973,-10955, 0, False, 0, False, world.instanceId)
	world.startRoom.npclist[newNpc] = False
	newNpc = self.addSpawn(KamaMob[1], -12316,-174903,-10953, 0, False, 0, False, world.instanceId)
	world.startRoom.npclist[newNpc] = False
	newNpc = self.addSpawn(KamaMob[1], -12326,-174786,-10953, 0, False, 0, False, world.instanceId)
	world.startRoom.npclist[newNpc] = False
	newNpc = self.addSpawn(KamaMob[1], -12330,-175024,-10953, 0, False, 0, False, world.instanceId)
	world.startRoom.npclist[newNpc] = False
	newNpc = self.addSpawn(KamaMob[1], -12211,-174900,-10955, 0, False, 0, False, world.instanceId)
	world.startRoom.npclist[newNpc] = False
	newNpc = self.addSpawn(KamaMob[1], -12238,-174849,-10953, 0, False, 0, False, world.instanceId)
	world.startRoom.npclist[newNpc] = False
	newNpc = self.addSpawn(KamaMob[1], -12233,-174954,-10953, 0, False, 0, False, world.instanceId)
	world.startRoom.npclist[newNpc] = False
	newNpc = self.addSpawn(KamaMob[2], -14547,-174901,-10690, 0, False, 0, False, world.instanceId)
	world.startRoom.npclist[newNpc] = False
	newNpc = self.addSpawn(KamaMob[2], -14543,-175030,-10690, 0, False, 0, False, world.instanceId)
	world.startRoom.npclist[newNpc] = False
	newNpc = self.addSpawn(KamaMob[2], -14668,-174900,-10690, 0, False, 0, False, world.instanceId)
	world.startRoom.npclist[newNpc] = False
	newNpc = self.addSpawn(KamaMob[2], -14538,-174774,-10690, 0, False, 0, False, world.instanceId)
	world.startRoom.npclist[newNpc] = False
	newNpc = self.addSpawn(KamaMob[2], -14410,-174904,-10690, 0, False, 0, False, world.instanceId)
	world.startRoom.npclist[newNpc] = False
	print "����-�`�W�g�c�G�l��Y�ɦa�Ϫ��Ǫ�"

class PyObject:
	pass

class Quest (JQuest) :

	def __init__(self,id,name,desc):
		JQuest.__init__(self,id,name,desc)
		self.worlds = {}
		self.world_ids = []
		self.currentWorld = 0

	def onAdvEvent (self,event,npc,player):
		return str(event)

	def onTalk (self,npc,player):
		if not checkPrimaryConditions(player):
			return
		tele = PyObject()
		dataIndex = getKamaIndex(KamalokaLevel)
		tele.x = KamaPorts[dataIndex][0]
		tele.y = KamaPorts[dataIndex][1]
		tele.z = KamaPorts[dataIndex][2]
		instanceId = getExistingInstanceId(player)
		if instanceId == 0:
			#brand new instance
			if not checkNewInstanceConditions(player):
				return
			instanceId = InstanceManager.getInstance().createDynamicInstance(KamaTemplate[dataIndex])
			if not self.worlds.has_key(instanceId):
				world = PyObject()
				world.rewarded = []
				world.instanceId = instanceId
				self.worlds[instanceId] = world
				self.world_ids.append(instanceId)
				self.currentWorld = instanceId
				instanceObj = InstanceManager.getInstance().getInstance(instanceId)
				instanceObj.setAllowSummon(False)
				instanceObj.setReturnTeleport(ReturnPort[dataIndex][0],ReturnPort[dataIndex][1],ReturnPort[dataIndex][2])
				print "����-�`�W�g�c�G�ϥ� " + InstanceTemplate + " �Y�ɦa�ϡG" + str(instanceId) + " �гy���a�G" + str(player.getName()) 
				runStartRoom(self, world)
				tele.instanceId = instanceId
				player.removeActiveBuffForKama()
				teleportPlayer(self,player,tele)
				party = player.getParty()
				if party != None:
					for partyMember in party.getPartyMembers().toArray():
						partyMember.removeActiveBuffForKama()
						teleportPlayer(self,partyMember,tele)
		else:
			#party already in Kamaloka - Labyrinth of Abyss
			foundworld = False
			for worldid in self.world_ids:
				if worldid == instanceId:
					foundworld = True
			if not foundworld:
				player.sendPacket(SystemMessage.sendString("�A�������w�i�J�䥦���Y�ɦa�ϡC"))
				return
			instanceObj = InstanceManager.getInstance().getInstance(instanceId)
			if instanceObj.getCountPlayers()>=KamaPartySize[dataIndex]:
				player.sendPacket(SystemMessage(SystemMessageId.PARTY_EXCEEDED_THE_LIMIT_CANT_ENTER))
				return
			tele.instanceId = instanceId
			player.removeActiveBuffForKama()
			teleportPlayer(self,player,tele)
		return

	def onAttack(self,npc,player,damage,isPet,skill):
		npcId = npc.getNpcId()
		if self.worlds.has_key(npc.getInstanceId()):
			world = self.worlds[npc.getInstanceId()]
			if world.status == 0:
				if npc.getNpcId() in [22488,22489,22490,25617,29132,29133,29134]:
					player.setKamaDate(2)
					party = player.getParty()
					if party != None:
						for partyMember in party.getPartyMembers().toArray():
							partyMember.setKamaDate(2)

	def onKill(self,npc,player,isPet):
		npcId = npc.getNpcId()
		if self.worlds.has_key(npc.getInstanceId()):
			world = self.worlds[npc.getInstanceId()]
			if world.status == 0 :
				if npcId == 22488 :
					newNpc = self.addSpawn(KamaBoss1[0], -16874,-174900,-10427, 0, False, 0, False, world.instanceId)  # Boss
					world.startRoom.npclist[newNpc] = False
				if npcId == 25617 :
					newNpc = self.addSpawn(KamaBoss[0], -20659,-174903,-9983, 0, False, 0, False, world.instanceId)  # Boss
					world.startRoom.npclist[newNpc] = False
				if npcId == 29132 :
					instanceObj = InstanceManager.getInstance().getInstance(self.currentWorld)
					instanceObj.setDuration(300000)
					instanceObj.removeNpcs()
					party = player.getParty()
					if party != None:
						for partyMember in party.getPartyMembers().toArray():
							partyMember.sendPacket(SystemMessage.sendString("�q�{�b�_�N�|����i�J�Y�ɦa�ϡG�u���� (�`�W�g�c)�v�C�U�@�����i���ɶ��i�z�L�u/�Y�ɦa�ϡv���O�Ӭd�ߡC"))
		return

QUEST = Quest(-1, qn, "Kamaloka")

QUEST.addStartNpc(30071)

QUEST.addTalkId(30071)

for mob in [22488,22489,22490,25617,29132,29133,29134]:
	QUEST.addAttackId(mob)

for mob in [22488,22489,22490,25617,29132,29133,29134]:
	QUEST.addKillId(mob)