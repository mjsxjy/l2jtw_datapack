# Made by DrLecter
import sys
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest
from net.sf.l2j.gameserver.datatables import ItemTable
qn = "7000_HeroItems"
MONUMENTS=[31690]+range(31769,31773)

HERO_ITEMS={
6611:["weapon_the_sword_of_hero_i00","�L���t�C","�P�R�����ɨϥؼШ��m�O�U���C�ᤩ�˳ƪ������B����HP/MP/CP�̤j�ȡB���ɬ޵P���m�O���\��C����PvP�ˮ`�C","379/169","���C"],
6612:["weapon_the_two_handed_sword_of_hero_i00","�L������","�P�R�����ɰl�[�B�~�ˮ`�C�ᤩ�˳ƪ̾��v�ʤϮg�ޯ�B����HP/CP�̤j�ȡB���ɭP�R�����v�P�P�R�����¤O���\��C����PvP�ˮ`�C","461/169","����C"],
6613:["weapon_the_axe_of_hero_i00","�L���Q��","�P�R�����ɨϥؼг��J�V�áC�ᤩ�˳ƪ������B����HP/MP/CP�̤j�ȡB���ɬ޵P���m���v���\��C����PvP�ˮ`�C","379/169","���w��"],
6614:["weapon_the_mace_of_hero_i00","�L������","�I�i�]�k�ޯ�ɱN������_�ؼЪ�HP�C�ᤩ�˳ƪ̴���MP/CP�̤j�ȡB�I�k�t�סBMP��_�t�ת��\��CPvP�ɴ��ɩҳy�����ˮ`�C","303/226","���k��"],
6615:["weapon_the_hammer_of_hero_i00","�L������","�P�R�����ɨϥؼг��J��J�C�ᤩ�˳ƪ̾��v�ʤϮg�ޯ�B����HP/CP�̤j�ȡB�����t�ת��\��C����PvP�ˮ`�C","461/169","����w��"],
6616:["weapon_the_staff_of_hero_i00","�L���]��","�I�i�]�k�ޯ�ɥH�@�w�����v������_�ؼЪ�HP�C�ᤩ�˳ƪ̴���MP/CP�̤j�ȡB�]�k�����O�B���CMP���Ӷq�B�����]�k�P�R�����v�B���C�I�k�Q���_���v���\��CPvP�ɴ��ɩҳy�����ˮ`�C","369/226","����k��"],
6617:["weapon_the_dagger_of_hero_i00","�L������","�P�R�����ɨϥؼг��J�I�q�C�ᤩ�˳ƪ̧l������B�I���ɴ��ɭP�R�t�C�ޯন�\�v�B����MP/CP�̤j�ȡB���ɧ����t�סB����MP�۵M��_��O���\��C����PvP�ˮ`�C","332/169","�P��"],
6618:["weapon_the_fist_of_hero_i00","�L������","�P�R�����ɨϥؼг��J��J�C�ᤩ�˳ƪ̾��v�ʤϮg�ޯ�B����HP/MP/CP�̤j�ȡB�j�ׯ�O���\��C����PvP�ˮ`�C","461/169","���M"],
6619:["weapon_the_bow_of_hero_i00","�L���_��","�P�R�����ɨϥؼг��J���ʳt�פU�������A�C�ᤩ�˳ƪ̸`�g�B�ֳt��_�B����MP�̤j�Ȫ��\��C����PvP�ˮ`�C","707/169","�}"],
6620:["weapon_the_dualsword_of_hero_i00","�L�����l","�P�R�����ɫʦL�ؼЪ����z�ޯ�C�ᤩ�˳ƪ̾��v�ʤϮg�ޯ�B����HP/MP/CP�̤j�ȡB�P�R�����v���\��C����PvP�ˮ`�C","461/169","���M"],
6621:["weapon_the_pole_of_hero_i00","�L���P�j","�P�R�����ɮ����ؼл��U���A�C�ᤩ�˳ƪ̾��v�ʤϮg�ޯ�B����HP�̤j�ȡB�����t�סB�R����O���\��C����PvP�ˮ`�C","379/169","�j"],
9388:["weapon_infinity_rapier_i00","�L�����{","�P�R�����ɥi�V���I�i���z���m�O���C���A�G�]�k�A�ô��������@�ޡB���� HP/CP�̤j�ȡCPvP�ɴ��ɩҳy�����ˮ`�C\n�P�R�����ɱN�|�H�@�w�����v���ɦۤv�M������̪����z�����O�B�]�k�����O�M�Ҩ����v¡�q�A�õo���ϥΧޯ�ɭ��CMP���Ӷq���ĪG�C","344/169","�ӼC"],
9389:["weapon_infinity_sword_i00","�L������","�P�R�����ɰl�[�B�~�ˮ`�C�ᤩ�˳ƪ̾��v�ʤϮg�ޯ�B����HP/CP�̤j�ȡB���ɭP�R�����v�P�P�R�����¤O���\��CPvP�ɴ��ɩҳy�����ˮ`�C","410/169","�j�N�C"],
9390:["weapon_infinity_shooter_i00","�L���l��","�P�R�����ɥi�V���I�i�w�t�]�k�A�ϥΧޯ�ɭ��CMP���Ӷq�B���� MP/CP �̤j�ȡCPvP�ɴ��ɩҳy�����ˮ`�C","405/169","��"]
}

def render_list(mode,item) :
    html = "<html><body><font color=\"LEVEL\">�^�����~�C��G</font><table border=0 width=120>"
    if mode == "list" :
       for i in HERO_ITEMS.keys() :
          html += "<tr><td width=35 height=45><img src=icon."+HERO_ITEMS[i][0]+" width=32 height=32 align=left></td><td valign=top><a action=\"bypass -h Quest 7000_HeroItems "+str(i)+"\"><font color=\"FFFFFF\">"+HERO_ITEMS[i][1]+"</font></a></td></tr>"
    else :
       html += "<tr><td align=left><font color=\"LEVEL\">���~�W�١G</font></td><td align=right>\
<button value=��^ action=\"bypass -h Quest 7000_HeroItems buy\" width=40 height=15 back=L2UI_ct1.button_df fore=L2UI_ct1.button_df>\
</td><td width=5><br></td></tr></table><table border=0 bgcolor=\"000000\" width=500 height=160><tr><td valign=top>\
<table border=0><tr><td valign=top width=35><img src=icon."+HERO_ITEMS[item][0]+" width=32 height=32 align=left></td>\
<td valign=top width=400><table border=0 width=100%><tr><td><font color=\"FFFFFF\">"+HERO_ITEMS[item][1]+"</font></td>\
</tr></table></td></tr></table><br><font color=\"LEVEL\">���~��T�G</font>\
<table border=0 bgcolor=\"000000\" width=290 height=150><tr><td valign=top><font color=\"B09878\">"+HERO_ITEMS[item][2]+"</font>\
</td></tr><tr><td><br>�����G"+HERO_ITEMS[item][4]+"<br>����/�]��G"+HERO_ITEMS[item][3]+"<br><br>\
<table border=0 width=300><tr><td align=center><button value=��o action=\"bypass -h Quest 7000_HeroItems _"+str(item)+"\" width=60 height=15 back=L2UI_ct1.button_df fore=L2UI_ct1.button_df></td></tr></table></td></tr></table></td></tr>"
    html += "</table></body></html>"
    return html

class Quest (JQuest) :

 def __init__(self,id,name,descr): JQuest.__init__(self,id,name,descr)

 def onAdvEvent (self,event,npc, player) :
     st = player.getQuestState(qn)
     if not st : return
     if player.isHero():
       if event == "buy" :
          htmltext=render_list("list",0)
       elif event.isdigit() and int(event) in HERO_ITEMS.keys():
          htmltext=render_list("item",int(event))
       elif event.startswith("_") :
          item = int(event.split("_")[1])
          if item == 6842:
            if st.getQuestItemsCount(6842):
               htmltext = "�A�w�g�֦��u�R�B���l�v�F�C"
            else :
               st.giveItems(item,1)
               htmltext = "�Цn�n�ɨ��u�R�B���l�v���y�O�a�C"
          else :
             for i in range(6611,6622)+range(9388,9391):
                if st.getQuestItemsCount(i):
                   st.exitQuest(1)
                   return "�A�w�g�֦��u"+HERO_ITEMS[i][1]+"�v�F�C"
             st.giveItems(item,1)
             htmltext = "�Цn�n�ɨ��u"+HERO_ITEMS[item][1]+"�v���y�O�a�C"
             st.playSound("ItemSound.quest_fanfare_2")
          st.exitQuest(1)
     return htmltext

 def onTalk (Self,npc,player):
     st = player.getQuestState(qn)
     htmltext = "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>"
     if player.isHero():
        htmltext=render_list("list",0)
     elif player.isNoble():
        html = "<html><body>������G<br>�]���A���O�^���A�ҥH�L�k��o�����C�U���аȥ����F�^�����W�ӾľԡC<br><a action=\"bypass -h npc_%objectId%_Chat 0\">��^</a></body></html>"
        htmltext = html.replace("%objectId%",str(npc.getObjectId()))
        st.exitQuest(1)
     else :
        st.exitQuest(1)
     return htmltext

QUEST       = Quest(-1,qn,"Hero Items")



for i in MONUMENTS:
    QUEST.addStartNpc(i)
    QUEST.addTalkId(i)
