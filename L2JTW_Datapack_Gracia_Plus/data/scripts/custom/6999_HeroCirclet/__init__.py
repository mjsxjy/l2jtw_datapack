# Made by L2Emu Team
import sys
from net.sf.l2j.gameserver.model.quest        import State
from net.sf.l2j.gameserver.model.quest        import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest

qn = "6999_HeroCirclet"

MONUMENTS = [31690]+range(31769,31773)

class Quest (JQuest) :

 def __init__(self,id,name,descr): JQuest.__init__(self,id,name,descr)

 def onTalk (Self,npc,player) :
   st = player.getQuestState(qn)
   htmltext = "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>"
   if player.isHero() :
     if st.getQuestItemsCount(6842) :
       htmltext = "�A�w�g�֦��u�R�B���l�v�F�C"
     else:
       st.giveItems(6842,1)
       htmltext = "�Цn�n�ɨ��u�R�B���l�v���y�O�a�C"
     st.exitQuest(1)
   else :
     html = "<html><body>������G<br>�]���z���O�^���A�ҥH�L�k��o�R�B���l�C�U���аȥ����F�^�����W�ӾľԡC<br><a action=\"bypass -h npc_%objectId%_Chat 0\">��^</a></body></html>"
     htmltext = html.replace("%objectId%",str(npc.getObjectId()))
     st.exitQuest(1)
   return htmltext

QUEST = Quest(-1,qn,"Hero Items")

for i in MONUMENTS:
    QUEST.addStartNpc(i)
    QUEST.addTalkId(i)