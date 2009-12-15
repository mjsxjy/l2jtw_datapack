# L2J_JP CREATE SANDMAN
import sys
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest
from net.sf.l2j.gameserver.instancemanager import ValakasManager

# Main Quest Code
class valakas(JQuest):

  def __init__(self,id,name,descr): JQuest.__init__(self,id,name,descr)

  def onTalk (self,npc,player):
    st = player.getQuestState("valakas")
    if not st : return "<html><head><body>�A��ڦ�����Ʊ��H</body></html>"
    npcId = npc.getNpcId()
    if npcId == 31385 :    # Heart of Volcano
      if player.isFlying() :
        return "<html><body>����ť�쮨���ӻy���D���n�G<br>�M�����s�����A�U�L�k���A�i�J�C</body></html>"
      if st.getInt("ok"):
        if ValakasManager.getInstance().isEnableEnterToLair():
          ValakasManager.getInstance().setValakasSpawnTask()
          ValakasManager.getInstance().addPlayerToLair(st.player)
          st.player.teleToLocation(203940,-111840,66)
          return
        else:
          st.exitQuest(1)
          return "<html><body>����ť�쮨���ӻy���D���n�G<br><font color=\"LEVEL\">�کԥd���w�g���F�C�ثe�S��k�i�h�C</font></body></html>"
      else:
        st.exitQuest(1)
        return "���A���šA�L�k�i�J�C"
    elif npcId == 31540 :
      if st.getQuestItemsCount(7267) > 0 :
        st.takeItems(7267,1)
        player.teleToLocation(183831,-115457,-3296)
        st.set("ok","1")
      else :
        st.exitQuest(1)
        return "<html><body>�کԥd�����ʵ��̧J�p�]�G<br>���F�i�J���K�j�Y�ݭn�B��ۡC�Y�Q�o��B��۪��ܡA�h�����ڵ��A���p�p���ȴN��F�C</body></html>"
    return

  def onKill (self,npc,player,isPet):
    st = player.getQuestState("valakas")
    if not st: return
    ValakasManager.getInstance().setCubeSpawn()
    st.exitQuest(1)

# Quest class and state definition
QUEST = valakas(-1,"valakas","ai")
# Quest NPC starter initialization
QUEST.addStartNpc(31540)
QUEST.addStartNpc(31385)
QUEST.addTalkId(31540)
QUEST.addTalkId(31385)
QUEST.addKillId(29028)
