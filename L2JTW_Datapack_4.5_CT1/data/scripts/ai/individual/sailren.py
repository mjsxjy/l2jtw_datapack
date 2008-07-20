# By L2J_JP SANDMAN

import sys
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest
from net.sf.l2j.gameserver.serverpackets import SocialAction
from net.sf.l2j.gameserver.instancemanager import SailrenManager
from net.sf.l2j.gameserver.instancemanager import GrandBossManager

#NPC
STATUE          =   32109   #�V�[�����̐Α�/Shilen's Stone Statue
VELOCIRAPTOR    =   22218   #���F���L���v�g��/Velociraptor
PTEROSAUR       =   22199   #�����t�H�����N�X/Pterosaur
TYRANNOSAURUS   =   22217   #�e�B���m�U�E���X/Tyrannosaurus
SAILREN         =   29065   #�T�C����/Sailren

#ITEM
GAZKH   =   8784    #�J�W�N/Gazkh

# Boss: sailren
class sailren (JQuest):

  def __init__(self,id,name,descr): JQuest.__init__(self,id,name,descr)

  def onTalk (self,npc,player):
    st = player.getQuestState("sailren")
    if not st : return "<html><head><body>�аݧA��ڦ��ƻ�Ʊ�?</body></html>"
    npcId = npc.getNpcId()
    if npcId == STATUE :
      if player.isFlying() :
        return "<html><body>�u�Y�t���G<br><font color=\"LEVEL\">�M�����s���A�L�k�i�J�C</font></body></html>"
        #return "<html><body>Shilen's Stone Statue:<br>You may not enter while flying a wyvern</body></html>"
      if st.getQuestItemsCount(GAZKH) :
        ENTRY_SATAT = SailrenManager.getInstance().canIntoSailrenLair(player)
        if ENTRY_SATAT == 1 or ENTRY_SATAT == 2 :
          st.exitQuest(1)
          return "<html><body>�u�Y�t���G<br><font color=\"LEVEL\">�w�g���H�i�J�ɺ����_�ޡC�b�L�̻P�ɺ�������Ե������e�������A�̶i�J�C</font></body></html>"
          #return "<html><head><body>Shilen's Stone Statue:<br>Another adventurers have already fought against the sailren. Do not obstruct them.</body></html>"
        elif ENTRY_SATAT == 3 :
          st.exitQuest(1)
          return "<html><body>�u�Y�t���G<br>�����C�A���G���O���w�n�b�o�԰������W���H�ڡC�ڥu�|��@�Ӷ����������}�q���ɺ����s�뤧���A�p�G�A�Q�ǰe�N�N���������a�ӡA�Ϊ̧A�]�i�H�o�춤������A�^�ӡC</body></html>"
          #return "<html><head><body>Shilen's Stone Statue:<br>The sailren is very powerful now. It is not possible to enter the inside.</body></html>"
        elif ENTRY_SATAT == 4 :
          st.exitQuest(1)
          return "<html><head><body>�u�Y�t���G<br>�Q�@�ӤH�ʦL�ɺ���? �A�O�Q�F! �Чⶤ��a�L�ӧa�C</body></html>"
          #return "<html><head><body>Shilen's Stone Statue:<br>You seal the sailren alone? You should not do so! Bring the companion.</body></html>"
        elif ENTRY_SATAT == 0 :
          st.takeItems(GAZKH,1)
          SailrenManager.getInstance().setSailrenSpawnTask(VELOCIRAPTOR)
          SailrenManager.getInstance().entryToSailrenLair(player)
          return "<html><head><body>�u�Y�t���G<br>�ХΧA���ޥ����ɺ������ʦL�C</body></html>"
          #return "<html><head><body>Shilen's Stone Statue:<br>Please seal the sailren by your ability.</body></html>"
      else :
        st.exitQuest(1)
        return "<html><head><body>�u�Y�t���G<br><font color=LEVEL>�d���J</font>�O�ʦL�ɺ������ƪ����~�C</body></html>"
        #return "<html><head><body>Shilen's Stone Statue:<br><font color=LEVEL>Gazkh</font> is necessary for seal the sailren.</body></html>"

  def onKill (self,npc,player,isPet):
    st = player.getQuestState("sailren")
    if not st: return
    if GrandBossManager.getInstance().checkIfInZone("LairofSailren", player) :
      npcId = npc.getNpcId()
      if npcId == VELOCIRAPTOR :
        SailrenManager.getInstance().setSailrenSpawnTask(PTEROSAUR)
      elif npcId == PTEROSAUR :
        SailrenManager.getInstance().setSailrenSpawnTask(TYRANNOSAURUS)
      elif npcId == TYRANNOSAURUS :
        SailrenManager.getInstance().setSailrenSpawnTask(SAILREN)
      elif npcId == SAILREN :
        SailrenManager.getInstance().setCubeSpawn()
        st.exitQuest(1)
    return

# Quest class and state definition
QUEST = sailren(-1, "sailren", "ai")
# Quest NPC starter initialization
QUEST.addStartNpc(STATUE)
QUEST.addTalkId(STATUE)
QUEST.addKillId(VELOCIRAPTOR)
QUEST.addKillId(PTEROSAUR)
QUEST.addKillId(TYRANNOSAURUS)
QUEST.addKillId(SAILREN)
