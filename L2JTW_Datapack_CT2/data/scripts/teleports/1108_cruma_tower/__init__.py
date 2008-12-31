# Made by Michiru
import sys
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest

qn = "1108_cruma_tower"

MOZELLA = 30483

class Quest (JQuest) :

 def __init__(self,id,name,descr): JQuest.__init__(self,id,name,descr)

 def onTalk (Self,npc,player):
   st = player.getQuestState(qn)
   npcId = npc.getNpcId()
   if npcId == MOZELLA :
     if st.getPlayer().getLevel() < 56 :
       player.teleToLocation(17724,114004,-11672)
       st.exitQuest(1)
     else :
       htmltext = "<html><body>�u���H���d�p�ԡG<br>��...�I�]���z���O�q�ӱj�A�ҥH�L�k�}�ҮɪŤ����C�ݨӦn���O�W�V�F�𪺺ϳ��ү౵�����ɭ��C<br>�]����56�H�W������L�k�i�J�J�|������C�^</body></html>"
       return htmltext
       st.exitQuest(1)

QUEST       = Quest(1108,qn,"Teleports")

QUEST.addStartNpc(MOZELLA)

QUEST.addTalkId(MOZELLA)
