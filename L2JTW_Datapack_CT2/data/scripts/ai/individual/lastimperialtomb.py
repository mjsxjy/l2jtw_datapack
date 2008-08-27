# L2J_JP CREATE SANDMAN
import sys
from net.sf.l2j import Config
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest
from net.sf.l2j.gameserver.instancemanager.lastimperialtomb import LastImperialTombManager
from net.sf.l2j.gameserver.instancemanager.lastimperialtomb import FrintezzaManager

# Main Quest Code
class lastimperialtomb(JQuest):

  def __init__(self,id,name,descr): JQuest.__init__(self,id,name,descr)

  def onTalk (self,npc,player):
    st = player.getQuestState("lastimperialtomb")
    if not st : return "<html><head><body>�S������ƥ�i�H�i��C</body></html>"
    npcId = npc.getNpcId()
    if npcId == 32011 :    # Freintezza Teleporter
      if player.isFlying() :
        return "<html><body>�ӳ��޾ɪ̡G<br>�M�����s�����A�U�L�k���A�i�J�C</body></html>"
      if Config.LIT_REGISTRATION_MODE == 0 :
        if LastImperialTombManager.getInstance().tryRegistrationCc(player) :
          LastImperialTombManager.getInstance().registration(player,npc)
        else :
          return "<html><body>�ӳ��޾ɪ̡G<br>�u���`�����~��ӽжi�J�C�p�G�����u�ܵY���F�����ɯ}�G�ѡv�N�i�H�i�J���ɤ����C</body></html>"
      elif Config.LIT_REGISTRATION_MODE == 1 :
        if LastImperialTombManager.getInstance().tryRegistrationPt(player) :
          LastImperialTombManager.getInstance().registration(player,npc)
        else :
          return "<html><body>�ӳ��޾ɪ̡G<br>�u�������~��ӽжi�J�C�p�G�����u�ܵY���F�����ɯ}�G�ѡv�N�i�H�i�J���ɤ����C</body></html>"
      elif Config.LIT_REGISTRATION_MODE == 2 :
        if LastImperialTombManager.getInstance().tryRegistrationPc(player) :
          LastImperialTombManager.getInstance().registration(player,npc)
        else :
          return "<html><body>�ӳ��޾ɪ̡G<br>�p�G�����u�ܵY���F�����ɯ}�G�ѡv�N�i�H�i�J���ɤ����C</body></html>"
    return

  def onKill (self,npc,player,isPet):
    st = player.getQuestState("lastimperialtomb")
    if not st: return
    npcId = npc.getNpcId()
    if npcId == 18328 :
      LastImperialTombManager.getInstance().onKillHallAlarmDevice()
    elif npcId == 18339 :
      LastImperialTombManager.getInstance().onKillDarkChoirPlayer()
    elif npcId == 18334 :
      LastImperialTombManager.getInstance().onKillDarkChoirCaptain()
    elif npcId == 29047 :
      FrintezzaManager.getInstance().doSvhDead(1)

  def onAttack(self,npc,player,damage,isPet):
    st = player.getQuestState("lastimperialtomb")
    if not st: return
    FrintezzaManager.getInstance().svhMorphCheck()

# Quest class and state definition
QUEST = lastimperialtomb(-1,"lastimperialtomb","ai")
# Quest NPC starter initialization
QUEST.addStartNpc(32011)
QUEST.addTalkId(32011)
QUEST.addKillId(18328)
QUEST.addKillId(18339)
QUEST.addKillId(18334)
QUEST.addKillId(29047)
QUEST.addAttackId(29046)
