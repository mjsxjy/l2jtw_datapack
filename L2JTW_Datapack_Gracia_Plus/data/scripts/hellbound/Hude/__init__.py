import sys
from com.l2jserver.gameserver.model.quest           import State
from com.l2jserver.gameserver.model.quest           import QuestState
from com.l2jserver.gameserver.model.quest.jython    import QuestJython as JQuest
from com.l2jserver.util                             import Rnd
from com.l2jserver.gameserver.model.itemcontainer   import PcInventory
from com.l2jserver.gameserver.model                 import L2ItemInstance
from com.l2jserver.gameserver.network.serverpackets import InventoryUpdate
from com.l2jserver.gameserver.network.serverpackets import SystemMessage
from com.l2jserver.gameserver.network               import SystemMessageId

qn = "Hude"

# 32298	��w				�Ӷ��ӤH
# 9628	�p���S				�G�H�s�@�D��ɨϥΪ����ơC�i�H�浹�@��ө��C
# 9629	�ȼw�ҦX��			�G�H�s�@�D��ɨϥΪ����ơC�i�H�浹�@��ө��C
# 9630	�������|�ڦX��		�G�H�s�@�D��ɨϥΪ����ơC�i�H�浹�@��ө��C
# 9631	�̰��ť֭�			�G�H�s�@�D��ɨϥΪ����ơC�i�H�浹�@��ө��C
# 9674	�F�������\�i��
# 9676	�I�q�̪�����
# 9681	�]�k���			�q�_���ԧl�����]�k���C
# 9682	�O�s���]�k���		�q�_���Ԧ躸�w���l�����]�k���C
# 9683	�F���s���y��		�F���s�������A��Ӷ��ӻ��O�ӫܦn������D��
# 9850	�Ӷ���Ż{�Ү�		�P�Ӷ��}�l�إߤͱ��ɻ�������ҡC
# 9851	�Ӷ����Ż{�Ү�		�P�Ӷ������i�����ɩһݪ����ҡC
# 9852	�Ӷ����Ż{�Ү�		�ҩ��P�Ӷ��w���إ߲`�p�ͱ������ҡC
# 9853	�ͱ��P�H�઺����	�ҩ��P�Ӷ������Y�w�F��̰��Ҭɪ������ҡC
# 10012	�Ȥl���r�w

# items = [9628,9629,9630]
# badge = 9674

class Quest (JQuest) :

 def __init__(self,id,name,descr): JQuest.__init__(self,id,name,descr)

 def onAdvEvent (self,event,npc,player) :
    htmltext = event
    st = player.getQuestState(qn)
    if not st: return
    if event == "1" :
       if st.getQuestItemsCount(9850) == 1 :
          if st.getQuestItemsCount(10012) >= 60 and st.getQuestItemsCount(9676) >= 30 :
              st.takeItems(10012,60)
              st.takeItems(9676,30)
              st.takeItems(9850,-1)
              st.giveItems(9851,1)
              htmltext = ""
              st.set("talk","1")
          else :
              htmltext = "no1.htm"
    if event == "2" :
       if st.getQuestItemsCount(9851) == 1 :
          if st.getQuestItemsCount(9681) >= 80 and st.getQuestItemsCount(9682) >= 20 :
              st.takeItems(9681,80)
              st.takeItems(9682,20)
              st.takeItems(9851,-1)
              st.giveItems(9994,1)
              st.giveItems(9852,1)
              htmltext = ""
              st.set("talk","2")
          else :
              htmltext = "no2.htm"
#    if event == "3" :
#       if st.getQuestItemsCount(9852) == 1 :
#          if st.getQuestItemsCount(9681) >= 80 and st.getQuestItemsCount(9682) >= 20 :
#              st.takeItems(9852,-1)
#              st.giveItems(9853,1)
#              htmltext = "trade.htm"
#              st.set("talk","3")
#          else :
#              htmltext = "no3.htm"
#    if event == "4" :
#       if st.getQuestItemsCount(9853) == 1 :
#          if st.getQuestItemsCount(9681) >= 80 and st.getQuestItemsCount(9682) >= 20 :
#              htmltext = "trade.htm"
#              st.set("talk","4")
#          else :
#              htmltext = "no4.htm"
    return htmltext

 def onFirstTalk (self,npc,player):
    npcId = npc.getNpcId()
    st = player.getQuestState(qn)
    if not st :
       st = self.newQuestState(player)
    talk = st.getInt("talk")
    if talk == 0 :
        if st.getQuestItemsCount(9850) == 1 :
           htmltext = "32298-1.htm"
        else :
           htmltext = "32298.htm"
    if talk == 1 :
        if st.getQuestItemsCount(9851) == 1 :
           htmltext = "32298-2.htm"
        else :
           htmltext = "32298.htm"
    if talk == 2 :
       if st.getQuestItemsCount(9852) == 1 :
          htmltext = "32298-3.htm"
       else :
          htmltext = "32298.htm"
    if talk == 3 :
       if st.getQuestItemsCount(9853) == 1 :
          htmltext = "32298-4.htm"
       else :
          htmltext = "32298.htm"
    return htmltext

QUEST = Quest(-1, qn, "hellbound")

QUEST.addFirstTalkId(32298)
QUEST.addStartNpc(32298)
QUEST.addTalkId(32298)