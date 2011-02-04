# Created by otfnir
import sys
from com.l2jserver.gameserver.model.quest           import State
from com.l2jserver.gameserver.model.quest           import QuestState
from com.l2jserver.gameserver.model.quest.jython    import QuestJython as JQuest
from com.l2jserver.gameserver.model.base            import Experience     #�g��Ȫ�
from com.l2jserver.gameserver.datatables            import SkillTable     #�ޯ����
from com.l2jserver.gameserver.datatables            import SpawnTable
from com.l2jserver.gameserver.network.serverpackets import NpcHtmlMessage #��ܮ�

qID   = -1                   #���� ID
qn    = "Rebirth"            #���ȦW
qDesc = "custom"             #����²��/�q�`�Ω�j�M htm ����Ƨ���m /gameserver/data/script/*****/*.htm

NPCID = [65535]              #Ĳ�o�� NPC template ID, �i�h�� NPC [65535, 88888, 99999]
maxRebirthTimes = 5          #�̦h��ͦ���

requireLevel = 85            #��ͭn�D����
requireItem = [[57, 10000]]  #��ͭn�D�D��μƶq [[��ID, �ƶq], [��ID, �ƶq], [��ID, �ƶq]] �� [] �S��

rewardItem = []              #���ͼ��y�D��μƶq [[��ID, �ƶq], [��ID, �ƶq], [��ID, �ƶq]] �� [] �S��
levelAfterRebirth = 1        #���ͫᵥ��

baseClassID = [0, 10, 18, 25, 31, 38, 44, 49, 53, 123, 124] #�U�رڪ��� classID

#������y�Χޯ�
skillSTR = 7033     #�O�q
skillDEX = 7034     #�ӱ�
skillCON = 7035     #���
skillINT = 7036     #���O
skillWIT = 7037     #���z
skillMEN = 7038     #�믫
sixStatSkills = [skillSTR, skillDEX, skillCON, skillINT, skillWIT, skillMEN]
#�Χ@���ɯ���ɪ��U�Ԧ����
sixStatName = ['�O�q', '�ӱ�', '���', '���O', '���z', '�믫']

class Rebirth(JQuest):
	def __init__(self, id, name, descr):
		JQuest.__init__(self, id, name, descr)
		#�l��NPC��m        (NPCID,    XX,     YY,    ZZ,  ���V, False, 0)
		npc1 = self.addSpawn(65535, 83277, 147906, -3409, 16383, False, 0)
	#���o�i�Ϊ�����I
	def getFreeRebirthPoint(self, player):
		usedPoint = 0
		for s in sixStatSkills:
			usedPoint += max(player.getSkillLevel(s), 1) -1
		st = player.getQuestState(qn)
		return st.getInt('times') - usedPoint
	def onAdvEvent(self, event, npc, player):
		#�˴���ͱ���
		def check_rebirth_requirement(player):
			#�˴���ͭn�D����
			if player.getLevel() < requireLevel: return False
			st = player.getQuestState(qn)
			#�˴���ͭn�D�D��μƶq
			for id, count in requireItem:
				if st.getQuestItemsCount(id) < count: return False
			#�˴���ͦ���
			if st.getInt('times') >= maxRebirthTimes: return False
			#�����¾�~�������
			if player.isSubClassActive(): return False
			#�˴����赥�Ť���h��51
			sixStatId = st.getInt('newSixStat')
			if player.getSkillLevel(sixStatId) >= 51: return False
			#�����˴��q�L
			return True
		#�������
		def doRebirth(player):
			#����
			player.removeExpAndSp(player.getExp() - Experience.LEVEL[levelAfterRebirth], player.getSp())
			st = player.getQuestState(qn)
			#�O����ͦ���
			st.set('times', str(st.getInt('times')+1))
			#�����ޯ�
			for i in player.getAllSkills():
				if i.getId() not in sixStatSkills:
					player.removeSkill(i)
			#��ر�
			newClass = st.getInt('newClass')
			st.getPlayer().setClassId(newClass)
			if player.isSubClassActive():
				player.getSubClasses().get(player.getClassIndex()).setClassId(player.getActiveClass())
			else:
				player.setBaseClass(player.getActiveClass())
			#st.getPlayer().setBaseClass(newClass)
			#st.getPlayer().setActiveClass(newClass)
			player.broadcastUserInfo()
			player.rewardSkills()
			player.sendSkillList()
			#player.stopAllToggles()
			#player.broadcastUserInfo()
			#�ܨ�..�Χ@�ȮɸѨM��رګ�H���ǩǪ����D
			#�ܨ� �����~ ID 617
			skillId = 617
			skillLevel = 1
			skill = SkillTable.getInstance().getInfo(skillId, skillLevel)
			if skill:
				skill.getEffects(player, player)
				#5���Ѱ��ܨ�
				st.startQuestTimer('removeAllEffects', 5000)
				#player.untransform()
			#�o�D����y
			for id, count in rewardItem:
				st.giveItems(id, count)
			#�o������y
			skillId = st.getInt('newSixStat')
			skillLevel = max(player.getSkillLevel(skillId), 1)
			player.addSkill(SkillTable.getInstance().getInfo(skillId, skillLevel + 1), True)
			return
		try:
			nEvent = int(event)
		except:
			nEvent = -1
		#��� �J�ͪ��A�e��
		if event == 'request_info':
			return 'info.htm'
		#���歫�]��ͯ���
		elif event == 'request_reset_sixstat':
			#�������j����ޯ�
			for i in player.getAllSkills():
				if i.getId() in sixStatSkills:
					player.removeSkill(i)
			return 'info.htm'
		#��ܳ]�w��ͯ�����y���
		elif event == 'request_set_sixstat':
			return 'setSixStat.htm'
		#��� ��ܷs�رڵe��
		elif event == 'request_choice_class':
			return 'choiceClass.htm'
		#�O�� �s�ر� �� �U�@�B
		elif nEvent in baseClassID:
			st = player.getQuestState(qn)
			#�O���s�ر�
			st.set('newClass', event)
			return "choiceSixStat.htm"
		#�O�� ��ͯ�����y �� �U�@�B
		elif nEvent in sixStatSkills:
			st = player.getQuestState(qn)
			#�O���s����n�D
			st.set('newSixStat', event)
			return "confirm.htm"
		#�T�w�n�D���
		elif event == "request_rebirth":
			if check_rebirth_requirement(player):
				doRebirth(player)
				return "rebirth_ok.htm"
			else:
				return "rebirth_fail.htm"
		#�����Ҧ����A
		elif event == 'removeAllEffects':
			for e in player.getAllEffects():
				e.exit()
		#�]�w���j����
		elif event.split()[0] == 'require_sixstat_add':
			try:
				c, n, v = event.split()
				v = max(int(v), 0)
				i = sixStatName.index(n)
			except:
				print qn + ":���~ event:" + event
				return ""
			newV = max(player.getSkillLevel(sixStatSkills[i]), 1) + v
			needPoint = v
			if needPoint == 0 or newV >= 51 or self.getFreeRebirthPoint(player) < needPoint or player.isSubClassActive():
				return "setSixStatFail.htm"
			else:
				skillId = sixStatSkills[i]
				skillLevel = newV
				player.addSkill(SkillTable.getInstance().getInfo(skillId, skillLevel), True)
			return "info.htm"
		else:
			print qn + ":�������n�D:" + event
			return ""
		return

	def onFirstTalk(self, npc, player):
		st = player.getQuestState(qn)
		if not st:
			st = self.newQuestState(player)
			st.setState(State.STARTED)
		return "onFirstTalk.htm"

	#�ۭq�B�z HTM �W�[�ܼ��ഫ
	def showResult(self, player, htmString):
		if not player or not htmString or len(htmString) == 0: return True
		if htmString.endswith(".htm") or htmString.endswith(".html"):
			htmString = JQuest.getHtm(self, player.getHtmlPrefix(), htmString)
		if len(htmString) != 0:
			st = player.getQuestState(qn)
			if player.getTarget():
				htmString.replace("%objectId%", str(player.getTarget().getObjectId()))
			htmString = htmString.replace("%playername%", player.getName())
			htmString = htmString.replace("%times%", str(max(st.getInt('times'), 0)))
			htmString = htmString.replace("%skillSTR%", str(max(player.getSkillLevel(skillSTR), 1)-1))
			htmString = htmString.replace("%skillDEX%", str(max(player.getSkillLevel(skillDEX), 1)-1))
			htmString = htmString.replace("%skillCON%", str(max(player.getSkillLevel(skillCON), 1)-1))
			htmString = htmString.replace("%skillINT%", str(max(player.getSkillLevel(skillINT), 1)-1))
			htmString = htmString.replace("%skillWIT%", str(max(player.getSkillLevel(skillWIT), 1)-1))
			htmString = htmString.replace("%skillMEN%", str(max(player.getSkillLevel(skillMEN), 1)-1))

			htmString = htmString.replace("%freeRebirthPoint%", str(self.getFreeRebirthPoint(player)))
			htmString = htmString.replace("%levelAfterRebirth%", str(levelAfterRebirth))
			htmString = htmString.replace("%require_level%", str(requireLevel))
			htmString = htmString.replace("%require_item_count_1%", str(requireItem[0][1]))
			html = NpcHtmlMessage(player.getTarget().getObjectId())
			html.setHtml(htmString)
			player.sendPacket(html)
		return htmString

QUEST = Rebirth(qID, qn, qDesc)

for id in NPCID:
	QUEST.addStartNpc(id)
	QUEST.addFirstTalkId(id)
	QUEST.addTalkId(id)

print "��������������������������������"
print "���@�@���J   Rebirth_v0.10�@�@��"
print "��������������������������������"
