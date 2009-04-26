# pmq
import sys
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest

qn = "2616_Fortune"

#NPC
TELL = 32616

#ITEM
ADENA = 57

#Messages
TELL_MSG = ["�M���w�w���ͬ����A���ߪ��Ʊ��N�|�꺡�p�N�C",\
            "���רƱ��B����B¾�~�B�a�H�M�ʤH�譱�A�ҷ|�R�����B�C",\
            "�����f���������N�|�a�ө��B�C",\
            "�Ʊ��v���n��A�����o�]���۱i�A�_�h�n�B�N���A�ӥh�C",\
            "�b�N�Q���쪺�a��A�N�|�o������ηs�����|�C",\
            "�ݤH���p�A���׹�P�ơA�Ҥj�w�ߤ��ơC",\
            "���������A�ƨƶ��ߡC",\
            "�W�۳B�z�Ʊ��ɡA�ܮe�����J���b�A���ԷV�C",\
            "�Y�O���F�����M�I�ӨϥX���{�����ܡA���򶷪�O��j���߫�ӳB�z����C",\
            "�O���꺡���H�����Y�A�K�|�J�W�����A�����������H�C",\
            "�J��x�ҮɡA�o���p��Ӫ����U�A�N���M�Ʊ�C",\
            "�]�߳n�i��|���J�x�ҡA�ݭn�T���w�����ɭԡA�y�Ĩ�����A�סC",\
            "���~���A�K�|�ɭP���H�����B�z����A������쩳�C",\
            "�N��i�檺�Ʊ��o�Ͱ��D�A��űĥ��v�y���p�A���q���D���ڥ��C�C�z�M�C",\
            "�p�G�d�ʲ��e���p�p�Q�q�A�K�|�e���y�����ۦb�����Y�C",\
            "�n�������b���ԡC",\
            "�γ\�|�J��x���A�y�V���Ҽ{�ð�w�N�ӡC",\
            "���ޭ��{�h��x�����Ʊ��A�U�ƬҪ�b�ӸѡC",\
            "�ۤv���\�ұN�|�������O�H�C",\
            "�N��@�L�Ҧ��A�]�i�צ稬���a�L���C",\
            "���e�ۨӺ֮�C",\
            "�q�۳¤p�Ƥ]�i�M��ּ֡C",\
            "�Ʊ��i�i�����Q�A�|�y����ļ�M���w�C",\
            "�𮧡A�N�|�ӿէ�j�������C",\
            "�~�x���ͬ����A�Ʒ|�a�Ӻu�u�]���C",\
            "�զ۳B�z�Ʊ��A�N�|�ۨӪȯɡC",\
            "�Y���{�ݭn�w�U���n�M�����ɭԡA�O�b�N�L�H���ݪk�A�y���T�x���ۤv���N�@�Ӱ��M�w�C"]


class Quest (JQuest) :

 def __init__(self, id, name, descr) :
   JQuest.__init__(self, id, name, descr)

 def onEvent(self, event, st) :
   htmltext = event
   if event == "1" :
     if st.getQuestItemsCount(ADENA) >= 1000 :
        st.setState(State.STARTED) 
        htmltext = st.showHtmlFile("32616-2.htm").replace("%msg%", str(TELL_MSG[st.getRandom(26)]))
        st.takeItems(ADENA,1000)
        st.exitQuest(1)
     else :
        htmltext = "32616-0.htm"
        st.exitQuest(1)
   if event == "2" :
        htmltext = "32616-3.htm"
   return htmltext

 def onTalk(self, npc, player) :
   st = player.getQuestState(qn)
   htmltext = "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>"
   if not st: return htmltext

   npcId = npc.getNpcId()
   id = st.getState()
   if npcId == TELL :
     if id == State.CREATED :
        htmltext = "32616-1.htm"
   return htmltext

QUEST = Quest(2616,qn,"custom")

QUEST.addStartNpc(TELL)

QUEST.addTalkId(TELL)