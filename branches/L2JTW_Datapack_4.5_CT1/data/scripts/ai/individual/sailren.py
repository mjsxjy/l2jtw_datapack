# By L2J_JP SANDMAN

import sys
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest
from net.sf.l2j.gameserver.serverpackets import SocialAction
from net.sf.l2j.gameserver.instancemanager import SailrenManager
from net.sf.l2j.gameserver.instancemanager import GrandBossManager

#NPC
STATUE          =   32109
VELOCIRAPTOR    =   22218
PTEROSAUR       =   22199
TYRANNOSAURUS   =   22217
SAILREN         =   29065

#ITEM
GAZKH   =   8784    #�d���J

# Boss: sailren
class sailren (JQuest):

  def __init__(self,id,name,descr): JQuest.__init__(self,id,name,descr)

  def onTalk (self,npc,player):
    st = player.getQuestState("sailren")
    if not st : return "<html><head><body>�S������ƥ�i�H�i��C</body></html>"
    npcId = npc.getNpcId()
    if npcId == STATUE :
      if player.isFlying() :
        return "<html><body>�u�Y�t���G<br><font color=\"LEVEL\">�M�����s�����A�U�L�k���A�i�J�C</font></body></html>"
      if st.getQuestItemsCount(GAZKH) :
        ENTRY_SATAT = SailrenManager.getInstance().canIntoSailrenLair(player)
        if ENTRY_SATAT == 1 or ENTRY_SATAT == 2 :
          st.exitQuest(1)
          return "<html><body>�u�Y�t���G<br><font color=\"LEVEL\">�w�g���H�i�J�ɺ����_�ޡC�b�L�̻P�ɺ�������Ե������e�������A�̶i�J�C</font></body></html>"
        elif ENTRY_SATAT == 3 :
          st.exitQuest(1)
          return "<html><body>�u�Y�t���G<br>�����C�A���G���O���w�n�b�o�԰������W���H�ڡC�ڥu�|��@�Ӷ����������}�q���ɺ����s�뤧���A�p�G�A�Q�ǰe�N�N���������a�ӡA�Ϊ̧A�]�i�H�o�춤������A�^�ӡC</body></html>"
        elif ENTRY_SATAT == 4 :
          st.exitQuest(1)
          return "<html><head><body>�u�Y�t���G<br>�Q�@�ӤH�ʦL�ɺ����H�A�O�Q�F�I�Чⶤ��a�L�ӧa�C</body></html>"
        elif ENTRY_SATAT == 0 :
          st.takeItems(GAZKH,1)
          SailrenManager.getInstance().setSailrenSpawnTask(VELOCIRAPTOR)
          SailrenManager.getInstance().entryToSailrenLair(player)
          return "<html><head><body>�u�Y�t���G<br>�ХΧA���ޥ����ɺ������ʦL�C</body></html>"
      else :
        st.exitQuest(1)
        return "<html><head><body>�u�Y�t���G<br><font color=LEVEL>�d���J</font>�O�ʦL�ɺ������ƪ����~�C</body></html>"

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
