# Made by d0S
import sys
from com.l2jserver.gameserver.ai                 import CtrlIntention
from com.l2jserver.gameserver.network.serverpackets import CreatureSay
from com.l2jserver.gameserver.model.quest			import State
from com.l2jserver.gameserver.model.quest			import QuestState
from com.l2jserver.gameserver.model.quest.jython	import QuestJython as JQuest
from com.l2jserver.gameserver.network.serverpackets	import ExStartScenePlayer

qn = "10271_TheEnvelopingDarkness"

# ���ȸ��
#	10271	1	Ţ�n���·t	�լd�x���@�çL	�_��Ǵ��P���p�X��a���h�L���ǥ��n�D�լd�}�����ءA�����O���Ӧa�褣�Ӧn���I�A��O��ĳ���h��䴿�H�լd�x���@�è����e�����Ӧa���A�Ʀs���k���h�L�J�����o�����C\n	0															0															-186252	242594	1679	75	0	3	�h�L �J��	0	1	1	32560	-186072	241295	2613	�S�����󭭨�	�_��Ǵ��P���p�X��a���h�L���ǥ��n�D���L�լd�}�����ءA�ӥB�٫�ĳ�h��t�˪��h�L�J�����o���̪������C�M��A�J���}�l�D���b�}�����ةҸg�����G��...	0																																																																						0						0	0	0	285	0	3	57	-1000	-1001									3	62516	377403	37867	
#	10271	2	Ţ�n���·t	�լd�x�����	�h�L�J���^�Q�L�h���Ѫ����ȡA�n�D�h½����Ҫk������A�î��^�լd�x���Ҫk�����C�u�n���o�Ӥ�󪺸ܡA�N��o��ܦh�����}�����ت������C��}�����ؤ�����^���C\n	1	13852														1	1														0	0	0	75	0	3	���Ҫk������	0	1	1	32560	-186072	241295	2613	�S�����󭭨�	�_��Ǵ��P���p�X��a���h�L���ǥ��n�D���L�լd�}�����ءA�ӥB�٫�ĳ�h��t�˪��h�L�J�����o���̪������C�M��A�J���}�l�D���b�}�����ةҸg�����G��...	0																																																																						0						0	0	0	285	0	3	57	-1000	-1001									3	62516	377403	37867	
#	10271	3	Ţ�n���·t	�^��J������a	�q���Ҫk������o��F�լd�x���Ҫk�����C���۳o�Ӥ��^��_��Ǵ��P���p�X��a���h�L�J�����B�C\n	0															0															-186252	242594	1679	75	0	3	�h�L �J��	0	1	1	32560	-186072	241295	2613	�S�����󭭨�	�_��Ǵ��P���p�X��a���h�L���ǥ��n�D���L�լd�}�����ءA�ӥB�٫�ĳ�h��t�˪��h�L�J�����o���̪������C�M��A�J���}�l�D���b�}�����ةҸg�����G��...	0																																																																						0						0	0	0	285	0	3	57	-1000	-1001									3	62516	377403	37867	
#	10271	4	Ţ�n���·t	�^����ǥ�����a	�J���ݨ�F�q���Ҫk��������^�Ӫ��լd�x���Ҫk������A��ܤF�·N�C�M�ỡ�D�A�Y�N�����h�浹���ǥ��N��o����S�C��o�Ӥ�󮳥h�浹�h�L���ǥ��A�M�������S�C\n	0															0															-186072	241295	2613	75	0	3	�h�L ���ǥ�	0	1	1	32560	-186072	241295	2613	�S�����󭭨�	�_��Ǵ��P���p�X��a���h�L���ǥ��n�D���L�լd�}�����ءA�ӥB�٫�ĳ�h��t�˪��h�L�J�����o���̪������C�M��A�J���}�l�D���b�}�����ةҸg�����G��...	0																																																																						0						0	0	0	285	0	3	57	-1000	-1001									3	62516	377403	37867	

#NPCs 
Orby = 32560
El = 32556
Medibal = 32528
#ITEMS
documentmedibal = 13852

class Quest (JQuest):

 def __init__(self,id,name,descr):
     JQuest.__init__(self,id,name,descr)
     self.questItemIds = [documentmedibal]

 def onAdvEvent (self,event,npc, player):
   htmltext = event
   st = player.getQuestState(qn)
   if not st: return
   if event == "32560-02.htm":
     st.set("cond","1")
     st.setState(State.STARTED)
     st.playSound("ItemSound.quest_accept")
   elif event == "32556-02.htm":
     st.set("cond","2")
   elif event == "32556-05.htm":
     st.set("cond","4")
   return htmltext

 def onTalk (self,npc,player):
   st = player.getQuestState(qn)
   htmltext = "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>" 
   if not st: return htmltext
   npcId = npc.getNpcId()
   id = st.getState()
   cond = st.getInt("cond")
   if id == State.COMPLETED:
     htmltext = "<html><body>�o�O�w�g���������ȡC</body></html>"
   elif npcId == Orby:
     if cond == 0:
        if player.getLevel() >= 75: htmltext = "32560-01.htm"
        else:
           htmltext = "32560-00.htm"  
     elif cond >= 1and cond < 4: htmltext = "32560-03.htm" 
     elif cond == 4: 
        htmltext = "32560-04.htm" 
        st.addExpAndSp(377403,37867)
        st.giveItems(57,62516)
        st.unset("cond") 
        st.exitQuest(False)
        st.playSound("ItemSound.quest_finish")
   elif npcId == El:
     if cond == 1:
       htmltext = "32556-01.htm"
     elif cond == 2:
       htmltext = "32556-03.htm"
     elif cond == 3:
       htmltext = "32556-04.htm"
     elif cond == 4:
       htmltext = "32556-06.htm"
   elif npcId == Medibal:
     if cond == 2:
       htmltext = "32528-01.htm"
       st.giveItems(documentmedibal,1)
       st.set("cond","3")
     if cond == 3:
       htmltext = "32528-02.htm"
   return htmltext

QUEST     = Quest(10271,qn,"Ţ�n���·t") 

QUEST.addStartNpc(Orby)
QUEST.addTalkId(Orby)
QUEST.addTalkId(El)
QUEST.addTalkId(Medibal)