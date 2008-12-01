#written by Rolarga
##################################FEEL FREE TO CHANGE IDs, REWARDS, PRICES, NPCs AND DROPDATAS THEY ARE JUST CUSTOM BY ME##################################

qn = "333_BlackLionHunt"

#Technical relatet Items
BLACK_LION_MARK = 1369
ADENA_ID = 57

#Drops & Rewards
CARGO_BOX1,CARGO_BOX2,CARGO_BOX3,CARGO_BOX4 = range(3440,3444)
UNDEAD_ASH,BLOODY_AXE_INSIGNIAS,DELU_FANG,STAKATO_TALONS = range(3848,3852)
SOPHIAS_LETTER1,SOPHIAS_LETTER2,SOPHIAS_LETTER3,SOPHIAS_LETTER4,LIONS_CLAW,LIONS_EYE,GUILD_COIN = range(3671,3678)
ALACRITY_POTION = 735
SCROLL_ESCAPE = 736
SOULSHOT_D = 1463
SPIRITSHOT_D = 2510
HEALING_POTION=1061
#Box rewards
GLUDIO_APPLE,CORN_MEAL,WOLF_PELTS,MONNSTONE,GLUDIO_WEETS_FLOWER,SPIDERSILK_ROPE,ALEXANDRIT,              \
SILVER_TEA,GOLEM_PART,FIRE_EMERALD,SILK_FROCK,PORCELAN_URN,IMPERIAL_DIAMOND,STATUE_SHILIEN_HEAD,         \
STATUE_SHILIEN_TORSO,STATUE_SHILIEN_ARM,STATUE_SHILIEN_LEG,COMPLETE_STATUE,FRAGMENT_ANCIENT_TABLE1,      \
FRAGMENT_ANCIENT_TABLE2,FRAGMENT_ANCIENT_TABLE3,FRAGMENT_ANCIENT_TABLE4,COMPLETE_TABLET = range(3444,3467)

#Price to Open a Box
OPEN_BOX_PRICE=650


#Lists
#List of all NPCs this Quest: Sophya,Redfoot,Rupio,Undinas(Shilien Temple),Lockirin(Dwarfen Village)
NPC=[30735,30736,30471,30130,30531,30737]
#List for some Item Groups
statue_list=[STATUE_SHILIEN_HEAD,STATUE_SHILIEN_TORSO,STATUE_SHILIEN_ARM,STATUE_SHILIEN_LEG]
tablet_list=[FRAGMENT_ANCIENT_TABLE1,FRAGMENT_ANCIENT_TABLE2,FRAGMENT_ANCIENT_TABLE3,FRAGMENT_ANCIENT_TABLE4]

#This Handels the Drop Datas npcId:[part,allowToDrop,ChanceForPartItem,ChanceForBox,PartItem]
#--Part, the Quest has 4 Parts 1=Execution Ground, 2=Partisan Hideaway 3=Near Giran Town, Delu Lizzards 4=Cruma Tower Area.
#--AllowToDrop --> if you will that the mob can drop, set allowToDrop==1. This is because not all mobs are really like official.
#--ChanceForPartItem --> set the dropchance for Ash in % for the mob with the npcId in same Line.
#--ChanceForBox --> set the dropchance for Boxes in % to the mob with the npcId in same Line. 
#--PartItem --> this defines wich Item should this Mob drop, because 4 Parts.. 4 Different Items.
DROPLIST={
#Execturion Ground - Part 1
20160:[1,1,67,29,UNDEAD_ASH],      #Neer Crawler
20171:[1,1,76,31,UNDEAD_ASH],      #Specter
20197:[1,1,89,25,UNDEAD_ASH],      #Sorrow Maiden
20200:[1,1,60,28,UNDEAD_ASH],      #Strain  
20201:[1,1,70,29,UNDEAD_ASH],      #Ghoul
20202:[1,0,60,24,UNDEAD_ASH],      #Dead Seeker (not official Monster for this Quest)
20198:[1,1,60,35,UNDEAD_ASH],      #Neer Ghoul Berserker
#Partisan Hideaway - Part 2
20207:[2,1,69,29,BLOODY_AXE_INSIGNIAS],  #Ol Mahum Guerilla
20208:[2,1,67,32,BLOODY_AXE_INSIGNIAS],  #Ol Mahum Raider
20209:[2,1,62,33,BLOODY_AXE_INSIGNIAS],  #Ol Mahum Marksman
20210:[2,1,78,23,BLOODY_AXE_INSIGNIAS],  #Ol Mahum Sergeant
20211:[2,1,71,22,BLOODY_AXE_INSIGNIAS],  #Ol Mahum Captain
#Delu Lizzardmans near Giran - Part 3
20251:[3,1,70,30,DELU_FANG],        #Delu Lizardman
20252:[3,1,67,28,DELU_FANG],        #Delu Lizardman Scout
20253:[3,1,65,26,DELU_FANG],        #Delu Lizardman Warrior
20781:[3,0,69,31,DELU_FANG],        #Delu Lizardman Shaman (not official Monster for this Quest)
#Cruma Area - Part 4
20157:[4,1,66,32,STAKATO_TALONS],    #Marsh Stakato
20230:[4,1,68,26,STAKATO_TALONS],    #Marsh Stakato Worker
20232:[4,1,67,28,STAKATO_TALONS],    #Marsh Stakato Soldier
20234:[4,1,69,32,STAKATO_TALONS]    #Marsh Stakato Drone
}

######################################## DO NOT MODIFY BELOW THIS LINE ####################################################################################

#Messages
#technical relatet messages
html        = "<html><body>"
htmlend        = "</body></html>"
back        = "<a action=\"bypass -h Quest 333_BlackLionHunt f_more_help\">��^</a>"
#Sophya
sophia        = "�ħL���������:<br>"
#-Item information
p_redfoot      = html+sophia+"�p�w��...�ڭӤH��L�S������n�P�A���p�G�S���o�ӤH�Nı�o�D�`�i���C�L��¾�d�O�ǹF�x�Ϋ~���t�d�H�A���]�O�B�z����⪺�ԧQ�~���B�������C�ӥB�٬O�ڭ̶ħL�Ϊ��������C�L�����ܦh���Ϊ������A���ɧA�]�i�H�h�ݰݡC<br><a action=\"bypass -h Quest 333_BlackLionHunt p_trader_info\">�߰�����ӤH���|���Ʃy</a><br><a action=\"bypass -h Quest 333_BlackLionHunt continue\">�~��������</a><br><a action=\"bypass -h Quest 333_BlackLionHunt leave\">�������椤������</a>"+htmlend
p_no_items      = html+sophia+"�·�S�̰ڡA�A�����ӬO�b�o�ӧ����ӬO�n�b�]���̾���Q���Գ��a�I<br><a action=\"bypass -h Quest 333_BlackLionHunt continue\">�~��������</a><br><a action=\"bypass -h Quest 333_BlackLionHunt leave\">�������椤������</a>"+htmlend
p_trader_info    = html+sophia+"�o�c�l���T�O�ȤB�ӷ~�P�����f���C�ݦL�b�c�l�W���L���N�i�H���D�C�p�G�Q��f�c�ٵ��L�̡A�N�h�����]�k���f�ө������|�|�����ڡC�L�O���ȤB�ӷ~�p�����ƪ��H�C <br><a action=\"bypass -h Quest 333_BlackLionHunt p_redfoot\">�߰�����p�w�����Ʃy</a><br><a action=\"bypass -h Quest 333_BlackLionHunt continue\">�~��������</a><br><a action=\"bypass -h Quest 333_BlackLionHunt leave\">�������椤����</a>"+htmlend
p_both_info      = html+sophia+"�S�̡A���F�������ȡA���W�A�F�C�ڷ|�ھڧA�a�^�Ӫ����Ҽƶq��I���S�C<br>���L�A�o�c�l�O...�H�ݨӬO��^�F�ӤH���|��<font color=\"LEVEL\">�f���c�l</font>�C�ڭ̪������W�S�������^�f���c�l�����e�A�ҥH�S���q�ȧ�c�l�ٵ��ӤH�̡C���O�p�G�ٵ��ӤH���|�A�]�\�|�����S�������a�H<br>���p���Q���ӤH�̡A���N�h�����p�w���a�C�L�O�M���B�z����⪺�ԧQ�~���M�a�C<br><a action=\"bypass -h Quest 333_BlackLionHunt p_redfoot\">�߰�����p�w�����Ʃy </a><br><a action=\"bypass -h Quest 333_BlackLionHunt p_trader_info\">�߰�����ӤH���|���Ʃy</a><br> <a action=\"bypass -h Quest 333_BlackLionHunt continue\">�~��������</a><br><a action=\"bypass -h Quest 333_BlackLionHunt leave\">�������椤������</a>"+htmlend
p_only_item_info  = html+sophia+"�S�̡A���F�������ȡA���W�A�F�C�ڷ|�ھڧA�a�^�Ӫ����Ҽƶq��I���S�C<br><a action=\"bypass -h Quest 333_BlackLionHunt continue\">�~��������</a><br><a action=\"bypass -h Quest 333_BlackLionHunt leave\">�������椤������</a>"+htmlend
p_leave_mission    = html+sophia+"�o�q�ɶ����W�A�F�C�N��O��l�]�ݭn�𮧡C�b�����𮧡A�ɥR��q�a�C�����ħL�A�ަn�ۤv����O�O�򥻭n�D�C<br><a action=\"bypass -h Quest 333_BlackLionHunt start_chose_parts\">���Q�n����s����</a><br><a action=\"bypass -h Quest 333_BlackLionHunt r_exit\">�h�X�ħL��</a>"+htmlend
p_only_box_info    = html+sophia+"�S�̡A���F�������ȡA���W�A�F�C�ڷ|�ھڧA�a�^�Ӫ����Ҽƶq��I���S�C<br><a action=\"bypass -h Quest 333_BlackLionHunt continue\">�~��������</a><br><a action=\"bypass -h Quest 333_BlackLionHunt leave\">�������椤������</a>"+htmlend
p_first_eye      = html+sophia+"Wait a moment.  I present to you the <font color=\"LEVEL\">mark of the lions eye</font>. This is an award to recognize your distinguished services that you have demonstrated on the battlefield.  And new supplies have been issued for you.   Since they are expendable goods that will be useful in combat, store and guard them well!  Now, I expect you to continue to make great achievements."+htmlend
p_eye        = html+sophia+"Wait a moment.  I present to you the <font color=\"LEVEL\">mark of the lions eye</font>. This is an award to recognize your distinguished services that you have demonstrated on the battlefield.  And new supplies have been issued for you.   Since they are expendable goods that will be useful in combat, store and guard them well!  Now, I expect you to continue to make great achievements."+htmlend
#-exit messages
r_exit        = html+sophia+"�A���Q�n�h�X�·�ħL�ΡH��M�C�ӤH�����ۤv���Q�k�A�ڤ]���|�h�ݲz��...���O���@�I�A�n����...���A�o�ˬy�ۦn�Ԥ��媺�H�A�ħL�άO�ߤ@����ܡC�N��A�h�F�䥦�a��A�̲פ]�@�w�|�^��Գ��C<br>�`���A�p�G�A�@�w�n���}�ħL�ΡA�N�n���D�o��ơC�u�n�A�@�h�X���ܡA�N���A�O�·઺�ħL�F�A�]�����ȭn�k�ٶ·઺�лx�A�ӥB�]����A�ϥΧA�b�o�q�����H�·઺�ħL�����ҧQ�Ϊ��Ҧ��u�f�C��p���������F�f���c�l�B�u�Y�J���B�j�N�H�g���H������ұo�쪺���S�������u�f�A�O����A�ϥΪ��C�Y�Q�A�ϥγo���u�f���ܡA�o���s����·઺�лx�A�ҥH�A�V���Ҽ{�ݬݧa�C<br>�ڡA�٦��ھڧA�o�q���������Z�A�h����٬O�|�ӥI���A���C<br><a action=\"bypass -h Quest 333_BlackLionHunt continue\">�~�򬰶ħL�ΰ���</a><br><a action=\"bypass -h Quest 333_BlackLionHunt exit\">�T�w�h�X�ħL��</a>"+htmlend
exit        = html+sophia+"�p�G�A���N�ӳo���M�A�ڤ]�N�����d�A�F�C�����·઺�лx��X�ӧa�C�i���ڭ̤������Ԥ����Y�]�즹����F�C�ڡA���}���e�Ч�o�Ӧ��U�C�o�O�A�b�ħL�ΥߤU�\�Z�����S�C�N��@�O����}�l�s�ͬ��������a�C����A�Ʊ�U���A�êӧ@�ԡA�A���C"+htmlend
#-Start
start_error1    = html+sophia+"���e�]���L�A�ڭ̥ثe�����ȬO��o�P�䪺�]���������C���O�ثe�ħL�Ϊ��D�O�Q������j�|�B�A�ҥH�L�O�譱�D�`�����C���h�]�u�ਾ���]����ŧ�������Ӥw�C�p�G�{�b���@���äj�n�Ԫ��å�̡A�u�Q���W���ΥL�̨ӸɥR�L�O...�I<br>(�u������25�H�W�ño��u�·઺�лx�v������~�i�H���檺���ȡC)"+htmlend
start_error2    = html+sophia+"���e�]���L�A�ڭ̥ثe�����ȬO��o�P�䪺�]���������C���O�ثe�ħL�Ϊ��D�O�Q������j�|�B�A�ҥH�L�O�譱�D�`�����C���h�]�u�ਾ���]����ŧ�������Ӥw�C�p�G�{�b���@���äj�n�Ԫ��å�̡A�u�Q���W���ΥL�̨ӸɥR�L�O...�I<br>�ݨӧA�n�����ܦh�P�]���̾԰����g��C�H�A�o��{�ת��ޭǡA���H�����ڭ̶ħL�Ϊ��@��...���W�h�W�A�p�G�Q�����ħL�Ϊ��@���A�N�����n�q�L�Y�ظզ͡C�p�G������A�N�h���@�U<font color=\"LEVEL\">�j�|�B�������p�ڪi���w</font>�����C�o��L���{�P�ña�^�·઺�лx�A�ڭ̴N�|���A���S�̨õ��A�M�ڭ̦@�P�԰������|�C<br>(�u������25�H�W�ño��u�·઺�лx�v������~�i�H���檺���ȡC)"+htmlend
start_start      = html+sophia+"�·�ħL�ΥS�̡̭A�ثe�ڭ̪����p�O�p���C�p���ҬҪ��A�ڭ̪����ȬO��o�P�䪺�]���������C���O�]���ħL�ΥD�O�����Q������j�|�B�A�ҥH�����]����ڤW���i��F�C���h�O�ਾ���]����ŧ�������Ӥw�C <br>���n�j�|�B���p�ڪi���w�������ӤF�R��ު��ħL�ΥS�̡A�ҥH���Ӱ��W�i�H�V�]���̪���a�o�ʧ����F�C�S�̰ڡA�Ʊ�A�]�ѥ[�o���Ԫ��C<br><a action=\"bypass -h Quest 333_BlackLionHunt start\">�����ѥ[�Ԫ�</a>"+htmlend
start_explain    = html+sophia+"�ܦn�I�I���F�@�q�ɶ����·�̡A�N�n�i���R�������s�}�l�M���y���F�I<br>�{�b�}�l�����@�U�Ԫp�C�ثe�ڭ̭n�𲤪��a�I��4�B�A�N�O�D���B�����ˮھڦa�B�n�������a�ϡB�٦��J�|���h�A�a�C�ثe�ڭ��٨S���M�]���̥�����W����O�A�ҥH�ڭ̭n���U�a�����H�ּƧL�O�c�����������A�δ����Ԫ��覡�����]���̡C<br><a action=\"bypass -h Quest 333_BlackLionHunt start_parts\">ť���U�a�Ϫ��԰�����</a>"+htmlend
start_parts      = html+sophia+"�Q�n���D�������ȡH<br><br><a action=\"bypass -h Quest 333_BlackLionHunt p1_explanation\">�����b�D���W�������ͪ�</a><br><a action=\"bypass -h Quest 333_BlackLionHunt p2_explanation\">�����b�����ˮھڦa�W���[�T</a><br><a action=\"bypass -h Quest 333_BlackLionHunt p3_explanation\">�����b�n������a�Ϫ��w�|�h簤H</a><br><a action=\"bypass -h Quest 333_BlackLionHunt p4_explanation\">�����b�J�|���h�A�a���h�A�q��d��</a>"+htmlend
start_ask_again    = html+sophia+"�·�S�̰ڡA�M�]���̪���Ԥw�g�}�l�F�I�b�o���԰����A�A�]���Ӫ�{�@�U�a�H<br><a action=\"bypass -h Quest 333_BlackLionHunt start_parts\">ť�����Ȼ���</a>"+htmlend
start_continue    = html+sophia+"�����Գ������ĤH�A�~���@�U�ӧQ���ַP�a�I"+htmlend
#-Part 1
p1_explanation    = html+sophia+"�����F�䪺�D���O�޻�d�s�n���������ˤ��a�C���ȴN�O�������̪������ͪ��̡C�ڻ��O�b�A���x�q�îɴ��A�ަ����H�̬��F���_�Ӵ_�ͪ������ͪ�...���M�A�ڭ̥u�ާ����ۤv�����ȴN�i�H�F�A���Pı�٬O���I��򪺡C <br><a action=\"bypass -h Quest 333_BlackLionHunt p1_t\">��������</a><br><a action=\"bypass -h Quest 333_BlackLionHunt start_chose_parts\">ť���䥦�����Ȼ���</a>"+htmlend
p1_take        = html+sophia+"�n�����������ͪ���<font color=\"LEVEL\">���F�I�M�B�ջ�B���ǿ����B���ǿ������p�J�B���F�B�٦����Ͱ�</font>�C�����A�夣��o�A�����ͪ��Q�����ɷ|�Ʀ��@��ǡA�⨺�ǦǷ�@�O�ӧQ�����ұa�^�ӡC�N�|�ھکұa�^�Ӫ�<font color=\"LEVEL\">�����ͪ�����</font>��I���S�C�A���b�p�ڪi���w������U���L�ơA�����ҩM���S���W�w���Ӥw�g�M���F�a�H  <br> ���򻰺򰵦n�԰��ǳơA�V�D���X�o�a�C�@�w�n�V�Ҧ��H�ҩ��A�Y�ϬO�Һ������_�ͪ��`�F�A�]���O�ڭ̶·�ħL�Ϊ����I"+htmlend
#-Part 2
p2_explanation    = html+sophia+"���ȴN�O�����n�Ϧb��_�䰨�ᨦ����Ǧ�ȭx���C����Q���O��´ݦs�̪��Q�X�����C���O�c�W�L������{�g�D�����d�a�⪺��{�����Ԫ��[�T�C�e�̵��藍�O����e����I���C<br><a action=\"bypass -h Quest 333_BlackLionHunt p2_t\">��������</a> <br> <a action=\"bypass -h Quest 333_BlackLionHunt start_chose_parts\">ť���䥦�����Ȼ���</a>"+htmlend
p2_take        = html+sophia+"�A�n�������ĤH��<font color=\"LEVEL\">�[�T�������B�[�T�����L�B�[�T�����L�B�[�T�ƶ����A�٦��[�T����</font>�C<br>�@�������ĤH�����ұa�^���������лx�A<font color=\"LEVEL\">��{��������</font>�C�N�|�ھڱa�^�Ӫ����Ҽƶq��I���S�C�A���b�p�ڪi���w������U���L�ơA�����ҩM���S���W�w���Ӥw�g�M���F�a�H<br>���򻰺�V�����ˮھڦa�X�o�a�C�����ǵL�k�L�Ѫ��[�T�A�@�@�ڭ̶·�ħL�Ϊ�����I"+htmlend
#-Part 3
p3_explanation    = html+sophia+"�w�|�h簤H����a��ӬO�b�_���n��������C���O�̪񦳫ܦh�I�J�f����a�C���M�٤����D�e�̥u�O���F�Q�������A�٬O���F�i��j�W�Ҫ��i��ǳơA���i�H�T�w���O�e�̽T��O�]���Y�ӥت��Ӧb��ʡC�ڭ̪����ȴN�O�A�����e�̪��C�ӳ����A���L�̨㦳���߷P�A�åB�����L�̦b�o����n�ϤU�ӡC<br><a action=\"bypass -h Quest 333_BlackLionHunt p3_t\">��������</a> <br> <a action=\"bypass -h Quest 333_BlackLionHunt start_chose_parts\">ť���䥦�����Ȼ���</a>"+htmlend
p3_take        = html+sophia+"�A�n�������å릳<font color=\"LEVEL\">�w�|�h簤H�B�w�|�h簤H���u�B�٦��w�|�h簤H�Ԥh</font>�C�@�������ĤH���Ҩ�a�^<font color=\"LEVEL\">�w�|�h簤H����</font>�C���O�n�p�ߡC�e�̤�j�|�B����L�کήԧJ�ڻh簤H��[���r�n�ԡC<br>�N�|�ھڱa�^�Ӫ����Ҽƶq��I���S�C�A���b�p�ڪi���w������U���L�ơA�����ҩM���S���W�w���Ӥw�g�M���F�a�H <br>����A�{�b�N�V�Գ��X�o�a�C�h�����������Ǥ����Ѱ��a�p���h簤H�I"+htmlend
#-Part 4
p4_explanation    = html+sophia+"���ȴN�O��I�b�J�|���h�A�a�s�@�u�q��d�ݡv���_�Ǫ��]���C�A�����L�q��d�ݶܡH�e�̬O���o�����Τ@�ˡA�O�ϤH�P�칽�c���رڡC�e�̪�����]�q�b��w���Ҵ߻q�A�Ӥ⪢�y���۾W�Q�����l�C�ӥB�ʧ@�D�`�a�֡C�O����p�ݪ��å�C <br>�A�[�W�h�A�a�����j����λj��A�٦��ܦh�r�ަb���H����P�䪺�]���̡A�O�ӫ���������Ȫ��M�I�a�a�C<br><a action=\"bypass -h Quest 333_BlackLionHunt p4_t\">��������</a><br><a action=\"bypass -h Quest 333_BlackLionHunt start_chose_parts\">ť���䥦�����Ȼ���</a>"+htmlend
p4_take        = html+sophia+"�A�n��I���ĤH��<font color=\"LEVEL\">�h�A�q��d�ݡB�h�A�q��d�ݤu�H�B�h�A�q��d�ݤh�L�B�٦����ʪh�A�q��d��</font>�C�@���ӧQ�����ұa�^�q��d�ݪ����C�N�p�H�����W�w�A�|�ھڧA�a�^�Ӫ����Ҽƶq��I���S�C <br>���򻰺򰵦n�԰��ǳơA�V�J�|���h�A�a�X�o�a�C�Ǧ����|���q��d�ݭ̪��D�ڭ̶·�ħL�Ϊ��F�`�I"+htmlend
#Redfoot
redfoot        = "�ħL�p�w��:<br>"
f_no_box      = html+redfoot+"�ޡI�S�̡I�A���{�b���b������ȬO�a�H���W�A�F�I������n���������Ʊ��ܡH<br><a action=\"bypass -h Quest 333_BlackLionHunt f_info\">�߰ݬO�_���i�Ϊ���T</a>"+htmlend
f_give_box      = html+redfoot+"�ޡI�S�̡I�A���{�b���b������ȬO�a�H���W�A�F�I������n���������Ʊ��ܡH<br>�c�l...�H�@�A��ӬO�ӤH�̪��f���c�l�ڡC����ڳo�̨ӬO���...�A�S���Q��c�l�ٵ��ӤH�̪��N��O�a�H�n�A���ڨ����A�}�o�c�l�C��M�c�l�̭����F������k�A�C���ڭn�����@�I��!�S�ҡC<font color=\"LEVEL\">650����</font>�N�t���h�F�C�N��@�O���}�c�l�����S�A�٦��[�W�u���K�����S�C<br><a action=\"bypass -h Quest 333_BlackLionHunt f_give\">�ШD���}�c�l</a><br>"+back+htmlend
f_rnd_list      = ["�e�X�ѰݹL�q�j�|�B�����^�Ӫ��T���ӤH�A�L�̻��̪����^�۷��I�Cť���[�T�ݦs�̪�����൥�۫I�����������|�A�ӥB�_��g��J�~�H�`�`�v�汰��...<br>ť���j�|�B����ĵ�æ㺸�˫��A���b�ߵJ�a��ۦ����ƪ��ħL...<br>",
             "�ݹL�s���^�n�������F��ܡH�O�i�s�񭵼֪����_���_�ۡCť���s�����֥��K���G�H�t�d�s�@���Ӧ^�n�����Cť���b�o�f������]���@��...<br>���L�n�s�@�^�n�������ܡA�N�ݭn�S�O�����СC�����гo�����F��A���쭵�֮a�N��o��a�H�N�O���ں��ڧ��ήR�R�L�o�˪��H��...<br>",
             "�o�ӧ������@�W�ڷQ��������̰��żp�v���~���H�C�L�s�������A�̪��W�ۭn�ѥ[�i���j�ɡA���b�ǳƷ��O�Cť���L���b�M�������L�����öQ�i�����ƪ��_�I�a...<br>",
             "ť�L�����ƺC���𪺶ǻ��ܡH�����Φb�𳻼Ӫ��ӫҤڷŪ��ƩO�H<br>�A�]���D�A�]���ѯ��ʦL�F�ڷšA�ҥH�֤]����i�h�𳻼ӡC���O�ھڳ̪�ť�쪺�ǻD�A���H���D�F�p��i�h���ж�����k�Cť���O�ȤB�����·t���F�Юv...<br>",
             "�A����h�]�Ǳo�ߦa�϶ܡH���ڴN�i�D�A�X�ӹ�ħL�����U�������a�I<br>�p�G�h���W�����������A�h���ӤH����۩�ĵ�íe����I�C���ӯ�o���ٺ⤣�������ȡC��F�A�٦�ť�����ӦW�s��ֵ�����K�h�Q�]���b��ħL�C<br>",
             "�p�G�A�O�Q�X�i����դO���g�D�A�ڷ|���A�@�ӧA�|�P���쪺��T�C�U�a����̪��I�᳣���䴩�L�̪��Q�ڡC�N�O�_�������J���������w���̭�B�٦��ڷ竰���j���F�ҨȤӪk�S��C��M�A���ǤH�]���O�O�����c���H�A���U������ӷ|���ҭn�D�a�H<br>",
             "�o�O���[�e�M�·t���F���|���H�̲�Ѫ��ɭ�ť�쪺����...ť���·t���F�ѩ^�u�Y�k���H����H�j�a�����D�ڡH�ڥi�O�Ĥ@��ť��...<br>���M�R���`�k��...�ڬO�u�������z�ѡC���O�q�h�L�·t���F�˪L���H�̨���ť���A�·t���F�̫سy���u�Y�����T��O�D�`�����Cť����b�����̪��`�W���q�̥������b�U�a�o�{���u�Y�k�����J���H<br>",
             "Have you heard about the rumor?  Antharas, the earthdragon who had been sleeping in Dragon Valley has awoken.  This is terrible news  If it comes out of the Lair of Antharas and runs amok, all of Giran region will fall into a state of pandemonium in no time <br>However, there is someone who is recruiting people to form a militia force to catch Antharas.  It is a woman named Gabrielle in Giran Castle Town.  However, does she really think that they will have any chance against the dragon  Unfortunately, I think it is way beyond their power!<br>",
             "In this village, there is a young man who is dreaming of becoming the best chef in the kingdom.  His name is Jonas.  Lately he has been working hard to prepare himself to compete in a culinary competition.   He is looking for an adventurer who can find ingredients to make exotic dishes<br>",
             "In Giran Castle Town, there is a young man whose only aim in life is to take revenge.  Everybody has been telling him that its useless but he is determined to kill the earthdragon Antharas with his own hands.  Every day, he makes special arrows.  Furthermore, if anybody brings him the raw materials he needs to make the arrows, he will pay the person with an ample reward.  If you are interested, why dont you go see him?  His name is  Belton and he works as a guard in Giran Castle Town.<br>",
             "I will give you some information that will be useful to someone who travels a lot like yourself.  According to the law of the land, the traders of this kingdom are not allowed to deal with criminals.  But there are some traders who ignore this rule and sell their items to outlaws.  These people include, Grocer Pano of Floran Village and Twyla who has set up her trade in the western section of the Dark Forest.  Although they are business people, I think its shameless of them to deal with criminals just to make money.<br>",
             "Would you like me to introduce you to a job opportunity?  If you go to the northwestern area of Gludio, there is a farmer whose name is Peter.  He is currently hiring mercenaries to chase out turek orcs that have settled down near his farm  With your ability, you could deal with turek orcs with no problem, right?  <br>By the way, did you know that relics of ancient kingdoms are often found in that area?  While dealing with turek orcs, I heard that some people have discovered precious ancient relics by accident.<br>",
             "Have you heard of the Aden Business Guild?  It is an association of human traders.  Since they saw that dwarven traders and warehouse keepers were generating a lot of profit while engaging in their organizational activities, humans decided to imitate them by forming a guild of their own.  However, it seems to me that the business savvy of a dwarf is inborn  No matter how hard humans try, I dont think they can keep up with dwarves.<br>On top of that, adding insult to injury, evil spirits frequently attack the guilds cargo wagons and steal their valuable goods making the humans suffer great losses.<br>",
             "Some time ago, while I was talking with the members of the Dark Elf Guild, I found out that Dark Elves worship the Goddess Shilen!!   Are you saying that everybody already knows about that?   Well, I heard about it for the first time <br>Why would you want to worship a goddess of death  It doesnt make any sense to me.  But according to those who have been to the Dark Forest, the Temple of Shilen built by the Dark Elves is truly magnificent.  They told me that the Abyssal Celebrants at the temple are gathering fragments of the statue of Goddess Shilen from everywhere!<br>",
             "Have you ever heard of a hatchling?  It is a cute baby dragon that has been hatched from the egg of a wyrm or a drake.  Among pet handlers, I heard that there is someone who knows how to raise a hatchling as ones own pet  I think his name is Cooper or something like that.  If you are interested in keeping a hatchling as a pet, why dont you go see him!<br>",
             "I will give you the information that a clan leader, who wants to grow the power of his clan would be interested in obtaining.  In each area, there are aristocrats who give support to small clans.  These aristocrats would include Sir Kristof Rodemai in Giran Castle Town and Sir Gustaf Athebaldt of Oren Castle Town.  Of course they are not just philanthropists.  I would say they would want something in return for their support of a clan, wouldnt you agree?<br>",
             "Some time ago, I heard a rumor that there is a society of ancient coin collectors.  At first, I thought that they must be collectors of some anniversary coins that are not very valuable.  But later, I found out that the value of the coins they collect is extremely high.  And members of this society are very enthusiastic about their collection activities that whoever brings some rare coins to them, they will trade them for some high priced items!  I heard that in order to join the coin collection society, you have to go see a dwarf called Sorint at the Hunters Village.<br>",
             "I heard that if you go near the Ivory Tower in Oren, you will find a fake alchemist.  It is said that he goes around telling people that he can make some magic potion that will make peoples wishes come true  Many people have fallen victim to his fake potion.  But what is surprising is that once in a blue moon, after using the potion peoples wishes actually did come true.  The problem is that this only happens very very rarely<br>",
             "�ħL�p�w��<br>",
             "Have you heard about the rumor?  Antharas, the earthdragon who had been sleeping in Dragon Valley has awoken.  This is terrible news  If it comes out of the Lair of Antharas and runs amok, all of Giran region will fall into a state of pandemonium in no time <br>However, there is someone who is recruiting people to form a militia force to catch Antharas.  It is a woman named Gabrielle in Giran Castle Town.  However, does she really think that they will have any chance against the dragon  Unfortunately, I think it is way beyond their power!<br>",
             ]
f_no_news      = html+redfoot+"�藍�_�A�{�b�٨S���s����T�C�U���A���{�a�C<br>"+back+htmlend
f_more_help      = html+redfoot+"�٦��Ʊ��n�������ܡH<br><a action=\"bypass -h Quest 333_BlackLionHunt f_give\">�ШD���}�c�l</a>"+htmlend
f_no_more_box    = html+redfoot+"�o���O�s�߬����ڶܡH�S���f�c�A�٭n�ڥ��}�H<br><br><a action=\"bypass -h Quest 333_BlackLionHunt f_info\">�߰ݬO�_���i�Ϊ���T</a>"+htmlend
f_more_help2    = html+redfoot+"�٦��Ʊ��n�������ܡH<br><a action=\"bypass -h Quest 333_BlackLionHunt f_give\">�ШD���}�c�l</a><br><a action=\"bypass -h Quest 333_BlackLionHunt f_info\">�߰ݬO�_���i�Ϊ���T</a>"+htmlend
f_not_adena      = html+redfoot+"�ޡI�ѥS�ݨӧA�����I�S�ҰڡG�ǳƦn650�����A�ӧa�C<br>"+back+htmlend
#Rupio
rupio        = "�K�K�|�ֶ�:<br>"
r_no_items      = html+rupio+"�A���O�·�ħL�ܡH�ӧڭ̪��K�E������O...�H�O�өe�U�s�y�Z�����ܡH"+htmlend
r_items        = html+rupio+"������Ʊ��n���������ܡH<br><a action=\"bypass -h Quest 333_BlackLionHunt r_give_statue\">�n�D�զX�J�����H��</a><br><a action=\"bypass -h Quest 333_BlackLionHunt r_give_tablet\">�n�D�զX�H�g�����H��"+htmlend
r_statue_pieces    = html+rupio+"�A��򪾹D�ڪ�����O�_��򪫰ڡH���O�p�G�Q��۹���_����Ӫ��ˤl�A�N����ʤ֨䤤����@���A�A���O���O�H��p���Q�����k�������N�O�n��<font color=\"LEVEL\">�Y ���� �u�٦��L</font>)�C�ӳ���ܡH"+htmlend
r_statue_brockes  = html+rupio+"OK, shall I demonstrate my talents now? First... Attach the legs to the base... Then the torso above that... And if we match the joints of the arms and head properly... Huh? The statue just crumbled... I knew that it was really old and the material weak but.. When I just applied some pressure to connect... Oh, I'm really sorry."+htmlend
r_statue_complete  = html+rupio+"OK, shall I demonstrate my talents now? First... Attach the legs to the base... Then the torso above that... And if we match the joints of the arms and head properly... OK! It's finished! The joints of the connecting parts are still visible but overall, it looks perfect, don't you think? Hmm... Is it the image of the goddess of Shilen? Looking at it carefully, it's really a beautiful statue."+htmlend
r_tablet_pieces    = html+rupio+"�A��򪾹D�ڪ�����O�_��򪫰ڡH���O���H�g���o�˨観��r���򪫡A�u�n�ʤ֤@�����N�L�k���D���e�A�ҥH�զX�F�]�S����ΡC�H�ڪ��g��A���H�g���o�إ|���Ϊ��򪫡A�q�`�|�H��<font color=\"LEVEL\">4��</font>..."+htmlend
r_tablet_brockes  = html+rupio+"OK, shall I demonstrate my talents now? Well, this fragment looks like it goes to the very bottom section of the stone tablet... And this piece is above that... Oh! The tablet just crumbled... I should have expected that the material would be really weak from having been exposed to the rain and wind for such a long time... Darn...! I'm really sorry for making such a big mistake."+htmlend
r_tablet_complete  = html+rupio+"OK, shall I demonstrate my talents now? Well, this fragment looks like it goes to the very bottom section of the stone tablet... And this piece is above that... It's like putting together a puzzle... OK... It's finished! It's an ancient stone tablet... I'm really curious whether some secrets of history are recorded on it! Hmm... But these letters look like writing of the titans... I've seen this somewhere before...! Where in the world could...?!"+htmlend
#Lockirin
lockirin      = "���Ѫ��ԧJ�Y:<br>"
l_no_tablet      = html+lockirin+"�ڹ泌�H����D�`�P����C�ר�O���ӥH���H��r�O�����H�g���A�Y�ϭn�ڥI�X�����]�b�Ҥ����C���A�o�˱`�h�Ȧ檺�H�A�i��|�ݹL���تF��C�ڻ��A�b�f���a��`�`�|�o�{�j�N�H�g��..."+htmlend
l_just_pieces    = html+lockirin+"�o���H�g���O...�H���D�o�ӬO...�H���M�u�O�@�����A���O�o�O...�l�ܪ�...�I<br> �ޡA�~���H�I�o�ǪF��쩳�O�q���̧�쪺�H�p�G���Ҧ����Ѿl�H���A�զX�������~�A�ڱN�|���A�j��!�S���I�ڥH���|�p�X���Ѫ����W�q�A�M�A���w�I"+htmlend
l_tablet      = html+lockirin+"This clay tablet... Where in the world could...?! It's just one part, but... Maphr...!  Where did such a precious thing...? Look at this, young fellow! I'll present to you a big gift of gratitude so please give this tablet to me!<br><a action=\"bypass -h Quest 333_BlackLionHunt l_give\">Hand over clay tablet.</a><br><a action=\"bypass -h Quest 333_BlackLionHunt l_info\">Don't hand over."+htmlend
l_give        = html+lockirin+"I'm really thankful! Finally the deep-rooted work of our guild federation...! Here, take this gift of gratitude! And if you find more of these clay tablets in the future, please bring those to me also! I'll express my thanks adequately!"+htmlend
l_info        = html+lockirin+"Huh...?! I said I'd express my thanks abundantly but you still refuse... Look here, young fellow. Do you really think you can sell that tablet somewhere else at a higher price? I guarantee that no matter how hard you look, you won't find anyone that will give you as much as I will. If your opinion changes, please come to me again. Turn over that tablet to me anytime and I'll give you a big gift of gratitude as I promised!"+htmlend
#Undiras
undiras        = "�`�W���q�w�w�z�ȴ�:<br>"
u_no_statue      = html+undiras+"��Ӥj�����ѩ^�u�Y�k�����x�|�Ȧ��@�a�C�]�H���n�����v�Чﭲ�A�ڭ̪��k���Q�@�H�{���O�a�Ӧ��`�M�}�a���������s�b�A���ڭ̶·t���F�̵M�{���u�Y�O�ڭ̪��гy�̤δx�ޥͦ����k���C<br>�i�����O�Q�H���M���F���X�x�I��ɡA�򥢤F�ܦh�˹��������t���C�S�O�O�s�@��o���u�Y�k�����j�����������F�C���ެO�֭Y���ڭ̧�^�����J���A�ڭ̲`�W���x�̤@�w�����j�j����§..."+htmlend
u_just_pieces    = html+undiras+"�o���J���O�H���M�u�O�@����...�o�O�򥢪��u�Y�J�����@����...�I�o�F��쩳�O�q���̧�쪺�H�p�G���Ҧ����Ѿl�H���A�զX�������~�A�ڱN�|���A�ܤj����§���I"+htmlend
u_statue      = html+undiras+"Oh this piece must be?  Although its only part of it still this piece came from one of the statues of Shilen that were lost!  Where in the world did you find it?  Where did you find this sacred object?  This statue is a sacred object for us dark elves.  I will pay you a great sum of money if you will hand it over to me.  After all, it is not of much use to you any way,  right?<br><a action=\"bypass -h Quest 333_BlackLionHunt u_give\">Give him the statue of Shilen.</a><br><a action=\"bypass -h Quest 333_BlackLionHunt u_info\">Refuse to give him the statue of Shilen.</a>"+htmlend
u_give        = html+undiras+"Due to the humans distorted religious reformation, our goddess that we worship has been misunderstood to be a sinister being that brings death and destruction.  But we dark elves still worship Shilen as our creator and as a goddess who is in charge of life and death.  Unfortunately, when this place was invaded by the allied forces of humans and elves, many sacred objects which were decorating the temple were lost.  Especially, many statues of the goddess Shilen which were exquisitely crafted were stolen.  The statue you brought here is one of the statues that were lost at that time.  Thank you so much.  Here is the reward money I promised you.  If you find any more statues like this, please bring them to me.  Well,  then may the divine protection of abyss be with you!"+htmlend
u_info        = html+undiras+"That statue is a sacred object for us dark elves.  Anyway, if you keep it for yourself, you wont have much use for it.  Furthermore, if you carry a statue of Shilen with you and walk around among humans, people will accuse you of being a pagan.  You would be lucky if you are not burnt to death at the stake.  Anyway, if you change your mind, please come back and see me.  If you hand over the statue to me, I am willing to pay you a generous sum of reward money.  Well,  then may the divine protection of abyss be with you."+htmlend
#Morgan
morgan        = "���|�|������:<br>"
m_no_box      = html+morgan+"�A�O�A�·�Ϊ��ħL�a�Hť���̪񬰤F�����o�@�a���]���A�]�ӫD�`���W�ڡC���]���U�A�̰աC"+htmlend
m_box        = html+morgan+"�A�O�A�·�Ϊ��ħL�a�Hť���̪񬰤F�����o�@�a���]���A�]�ӫD�`���W�ڡC���]���U�A�̰աC���L��ڦ�����ƶ�...�H<br><a action=\"bypass -h Quest 333_BlackLionHunt m_give\">��X�c�l</a>"+htmlend
m_rnd_1        = html+morgan+"It's a freight box of our commercial guild!? It is freight that was stolen from our carts having been attacked by evil creatures recently. But there is a lot of freight that was looted and so our losses are really big. Still, it is really fortunate that you could recover this part.<br>As a representative of the commercial guild, I thank you for your efforts. Here, take this gift of gratitude, even though it's not much. And I present you with these (<font color=\"LEVEL\">coins from our guild</font>). It's like a plaque of appreciation that we give to people that have contributed to the commercial guild.<br><a action=\"bypass -h Quest 333_BlackLionHunt m_reward\">Go back.</a>"+htmlend
m_rnd_2        = html+morgan+"�ڭ̰ӷ~�P�����f�c�I�H�o�O���[�e�Q�]��ŧ����A�q�����W�Q�m�����f���ڡI�̪�Q���ܪ��f���Ӧh�A����~�|�l���G���O�A�{�b���^�@�����]��O�y���աC<br>�ڥN��ӷ~�P���V�A�P�¡C�o�̡A���M���h�N��@�O�ڭ̪���§�a�C�٦��o�̡A�e�A�@�ӧڭ�<font color=\"LEVEL\">���|���f��</font>�o�O�ᤩ��ӷ~�P���^�m�̪��@�طP�¡C<br><a action=\"bypass -h Quest 333_BlackLionHunt m_reward\">��^</a>"+htmlend
m_rnd_3        = html+morgan+"I really thank you for recovering so many freight boxes like this for us. If the financial situation of our commercial guild were a bit better, we would hire competent mercenaries such as yourself as bodyguards... In that case, the evil creatures would never be able to loot our stuff, no?<br>OK! Here, take the gift of gratitude! The amount of the gratitude money increased greatly after I spoke to my superiors about the hard work you have been doing for our guild. As this is appropriate acknowledgment for your hard work, please take it without refusing. And, as always, I present you with these <font color=\"LEVEL\">coins from our guild.</font><br><a action=\"bypass -h Quest 333_BlackLionHunt m_reward\">��^</a>"+htmlend
m_no_more_box       = html+morgan+"�f�c...�H����c�l�ڡH�A�n���S���o�تF���...�H"+htmlend
m_reward      = html+morgan+"������Ʊ��n����������...�H<br><a action=\"bypass -h Quest 333_BlackLionHunt m_give\">��X�f�c</a>"+htmlend

import sys
from net.sf.l2j import Config 
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest
#This Put all Mob Ids from dictionari in a list. So its possible to add new mobs, to one of this 4 Areas, without modification on the addKill Part.
MOBS=DROPLIST.keys()

def giveRewards(st,item,count):
  st.giveItems(ADENA_ID,35*count)
  st.takeItems(item,count)
  if count < 20:
    return
  if count<50:
    st.giveItems(LIONS_CLAW,1)
  elif count<100:
    st.giveItems(LIONS_CLAW,2)
  else:
    st.giveItems(LIONS_CLAW,3)
  return


class Quest (JQuest) :

  def __init__(self,id,name,descr): JQuest.__init__(self,id,name,descr)

  def onEvent (self,event,st) :
    part = st.getInt("part")
    if event == "start" :
      st.set("cond","1")
      st.setState(State.STARTED)
      st.playSound("ItemSound.quest_accept")
      #just to go with the official, until we have the option to make the take part invisible, like on officials.
      st.takeItems(BLACK_LION_MARK,1)
      st.giveItems(BLACK_LION_MARK,1)
      return start_explain
    elif event == "p1_t":
      st.set("part","1")
      st.giveItems(SOPHIAS_LETTER1,1)
      return p1_take
    elif event == "p2_t":
      st.set("part","2")
      st.giveItems(SOPHIAS_LETTER2,1)
      return p2_take
    elif event == "p3_t":
      st.set("part","3")
      st.giveItems(SOPHIAS_LETTER3,1)
      return p3_take
    elif event == "p4_t":
      st.set("part","4")
      st.giveItems(SOPHIAS_LETTER4,1)
      return p4_take
    elif event == "exit":
      st.takeItems(BLACK_LION_MARK,1)
      st.exitQuest(1)
      return exit
    elif event == "continue":
      claw=int(st.getQuestItemsCount(LIONS_CLAW)/10)
      check_eye=st.getQuestItemsCount(LIONS_EYE)
      if claw :
        st.giveItems(LIONS_EYE,claw)
        eye=st.getQuestItemsCount(LIONS_EYE)
        st.takeItems(LIONS_CLAW,claw*10)
        ala_count=3
        soul_count=100
        soe_count=20
        heal_count=20
        spir_count=50
        if eye > 9:
          ala_count=4
          soul_count=400
          soe_count=30
          heal_count=50
          spir_count=200
        elif eye > 4:
          spir_count=100
          soul_count=200
          heal_count=25
        while claw > 0:
          n = st.getRandom(5)
          if n < 1 :
            st.giveItems(ALACRITY_POTION, int(ala_count*Config.RATE_QUESTS_REWARD))
          elif n < 2 :
            st.giveItems(SOULSHOT_D, int(soul_count*Config.RATE_QUESTS_REWARD))
          elif n < 3:
            st.giveItems(SCROLL_ESCAPE, int(soe_count*Config.RATE_QUESTS_REWARD))
          elif n < 4:
            st.giveItems(SPIRITSHOT_D,int(spir_count*Config.RATE_QUESTS_REWARD))
          elif n == 4:
            st.giveItems(HEALING_POTION,int(heal_count*Config.RATE_QUESTS_REWARD))
          claw-=1
        if check_eye:
          return p_eye
        else:
          return p_first_eye
      else:
        return start_continue
    elif event == "leave":
      if part == 1:
        order = SOPHIAS_LETTER1
      elif part == 2:
        order = SOPHIAS_LETTER2
      elif part == 3:
        order = SOPHIAS_LETTER3
      elif part == 4:
        order = SOPHIAS_LETTER4
      else:
        order = 0
      st.set("part","0")
      if order:
        st.takeItems(order,1)
      return p_leave_mission
    elif event == "f_info":
      text = st.getInt("text")
      if text<4:
        rnd=int(st.getRandom(20))
        st.set("text",str(text+1))
        text_rnd = html+redfoot+f_rnd_list[rnd]+back+htmlend
        return text_rnd
      else:
        return f_no_news
    elif event == "f_give":
      if st.getQuestItemsCount(CARGO_BOX1) :
        if st.getQuestItemsCount(ADENA_ID)>=OPEN_BOX_PRICE:
          st.takeItems(CARGO_BOX1,1)
          st.takeItems(ADENA_ID,650)
          random = st.getRandom(162)
          standart = "�n�A���N�ӥ��}�o�c�l�ݤ@��...�}�o����A�p�N��...�n�I�o��e���N���}�F�C����A�ݬݸ̭�������F��H<br>"
          statue = "�o�O...�H�۹����}���H�@��...�O�u�Y�k�����Ҽ�...���|�O���`�k���Aı�o���I���N�Q�H���O�p�G���O�}���ӬO�����~�A�N�����o�줣��������...�ˬO���@��M�a�O�M���׸ɳo�ؿ򪫪�...�L�O�s<font color=\"LEVEL\">�|�ֶ�</font>���K�K�C�p�G��۹����}�������᮳�L�h�A�L�|���A�׸ɦ������~�C<br>" 
          tablet = "�o�O...�H�۪����}���H�@��...�S�ݹL����r�C���D�O���H�ɥN���򪫡H�p�G���O�}���A�ӬO���n�����~�N�i�H�����öQ����ƤF�C�p�G���Ҧ����}��������N�i�H������ˤF...���p������A�N�h��s<font color=\"LEVEL\">�|�ֶ�</font>���K�K�a�C�L�O�_��򪫪��M�a�C<br>"
          if random < 21 :
            st.giveItems(GLUDIO_APPLE,int(Config.RATE_QUESTS_REWARD))
            return html+redfoot+standart+"<br>Fruit?  Oh, they must be apples grown in Gludio!  Mmm they look delicious.  If you take them to the market before they go bad, I guess you will be able to make some money.<br>"+back+htmlend
          elif random < 41:
            st.giveItems(CORN_MEAL,int(Config.RATE_QUESTS_REWARD))
            return html+redfoot+standart+"Isnt this corn meal?  Isnt this used to feed pigs?  Well, anyhow, since its not anything you can use for yourself, you should take it to the market to sell it.<br>"+back+htmlend
          elif random < 61:
            st.giveItems(WOLF_PELTS,int(Config.RATE_QUESTS_REWARD))
            return html+redfoot+standart+"<br>�o�i�֭��O...�H�c�T���֡H�֭��[�u�v�w�g�[�u�L�C�����O�i�ܰ��Ū��֭��C�i��s�y�ִU�ɯ�αo�ۧa�H�ϥ��A���쥫���W���ӽ�o�F�@�I���C<br>"+back+htmlend
          elif random < 74:
            st.giveItems(MONNSTONE,int(Config.RATE_QUESTS_REWARD))
            return html+redfoot+standart+"<br>�_�ۡH�o�O��ۡI�]�O�s�@����۪��_�ۡC���ӯ��줣���������C<br>"+back+htmlend
          elif random < 86:
            st.giveItems(GLUDIO_WEETS_FLOWER,int(Config.RATE_QUESTS_REWARD))
            return html+redfoot+standart+"<br>Hmm?  Whats this powder?  Should I taste it?   Yes, this must be Gludio Wheat Flour!  It can be used for baking bread I guess.   Well, anyhow, you should be able to sell it for a decent price at the market.<br>"+back+htmlend
          elif random < 98:
            st.giveItems(SPIDERSILK_ROPE,int(Config.RATE_QUESTS_REWARD))
            return html+redfoot+standart+"�o�O...�H�O�j�����÷���I�o�O�Τh�B�u�s�ߪ��T��_���������j����s�y���A��껴�K��÷���C����ө����ӷ|��줣���������a�C<br>"+back+htmlend
          elif random < 99:
            st.giveItems(ALEXANDRIT,int(Config.RATE_QUESTS_REWARD))
            return html+redfoot+standart+back+htmlend
          elif random < 109:
            st.giveItems(SILVER_TEA,int(Config.RATE_QUESTS_REWARD))
            return html+redfoot+standart+"Hmm?  A silver bowl?  And a teacup?  They seem to be of pretty high quality!  It seems like they were made by elven artisans.  I am not interested in such exquisite items but, anyway, if you take them to a store, you should be able to sell them for a fairly good price.<br>"+back+htmlend
          elif random < 119:
            st.giveItems(GOLEM_PART,int(Config.RATE_QUESTS_REWARD))
            return html+redfoot+standart+"Hmm?  Machine parts?  This Guild Mark seems to be that of the Black Anvil Guild what do you think?  Although I dont know for sure, these seem to be parts that are used by dwarves to do repair work on golems.  If you take them to a store, I think you will be able to sell them at a pretty reasonable price.<br>"+back+htmlend
          elif random < 123:
            st.giveItems(FIRE_EMERALD,int(Config.RATE_QUESTS_REWARD))
            return html+redfoot+standart+"�_��...�H�O���_�۶ܡH�ڡA���O�C�o�O���A�ɡI�A���D�����D�H�o�O�b�����U�e�{����A����U�e���⪺�þf����ۡC���ӬO�Φb�s�y�Q���H�˹��~�W���F��a�H����ө����ӥi�H��Ӧn�����C<br>"+back+htmlend
          elif random < 127:
            st.giveItems(SILK_FROCK,int(Config.RATE_QUESTS_REWARD))
            return html+redfoot+standart+"Isnt this a dress?!  This is a silk dress for a woman.  It looks pretty expensive, dont you think?  Take a look at this design.  This is an item that has been imported from Avella of the East.  At a time like this, who would use such a luxurious item?  This must be ordered by a noblewoman who has a liking for foreign products dont you think?  You should take this to a store and sell it off!  Im sure you will get a very high price for it.<br>"+back+htmlend
          elif random < 131:
            st.giveItems(PORCELAN_URN,int(Config.RATE_QUESTS_REWARD))
            return html+redfoot+standart+back+htmlend
          elif random < 132:
            st.giveItems(IMPERIAL_DIAMOND,int(Config.RATE_QUESTS_REWARD))
            return html+redfoot+standart+"Hmm?  Dont tell me!  I dont believe it!!!  Wow, an Imperial Diamond?  Isnt this the one that was used to decorate the crown of the king of Elmo-Aden?  Its truly beautiful!   You are extremely lucky!  You got yourself a priceless item.  If you take it to the market, Im sure you will be able to get a huge amount of money for it.<br>"+back+htmlend
          elif random < 147:
            random_stat=st.getRandom(4)
            if random_stat == 3 :
              st.giveItems(STATUE_SHILIEN_HEAD,1)
              return html+redfoot+standart+statue+back+htmlend
            elif random_stat == 0 :
              st.giveItems(STATUE_SHILIEN_TORSO,1)
              return html+redfoot+standart+statue+back+htmlend
            elif random_stat == 1 :
              st.giveItems(STATUE_SHILIEN_ARM,1)
              return html+redfoot+standart+statue+back+htmlend
            elif random_stat == 2 :
              st.giveItems(STATUE_SHILIEN_LEG,1)
              return html+redfoot+standart+statue+back+htmlend
          elif random < 162:
            random_tab=st.getRandom(4)
            if random_tab == 0 :
              st.giveItems(FRAGMENT_ANCIENT_TABLE1,1)
              return html+redfoot+standart+tablet+back+htmlend
            elif random_tab == 1:
              st.giveItems(FRAGMENT_ANCIENT_TABLE2,1)
              return html+redfoot+standart+tablet+back+htmlend
            elif random_tab == 2 :
              st.giveItems(FRAGMENT_ANCIENT_TABLE3,1)
              return html+redfoot+standart+tablet+back+htmlend
            elif random_tab == 3 :
              st.giveItems(FRAGMENT_ANCIENT_TABLE4,1)
              return html+redfoot+standart+tablet+back+htmlend
        else:
          return f_not_adena
      else:
        return f_no_more_box
    elif event in  ["r_give_statue","r_give_tablet"]:
      if event == "r_give_statue":
        items = statue_list
        item = COMPLETE_STATUE
        pieces = r_statue_pieces
        brockes = r_statue_brockes
        complete = r_statue_complete
      elif event == "r_give_tablet":
        items = tablet_list
        item = COMPLETE_TABLET
        pieces = r_tablet_pieces
        brockes = r_tablet_brockes
        complete = r_tablet_complete
      count=0
      for id in items:
        if st.getQuestItemsCount(id):
          count+=1
      if count>3:
        for id in items:
          st.takeItems(id,1)
        if st.getRandom(2)==1 :
          st.giveItems(item,1)
          return complete
        else:
          return brockes 
      elif count<4 and count!=0:
        return pieces
      else:
        return r_no_items
    elif event == "l_give" :
      if st.getQuestItemsCount(COMPLETE_TABLET):
        st.takeItems(COMPLETE_TABLET,1)
        st.giveItems(ADENA_ID,30000)
        return l_give
      else:
        return no_tablet
    elif event == "u_give" :
      if st.getQuestItemsCount(COMPLETE_STATUE) :
        st.takeItems(COMPLETE_STATUE,1)
        st.giveItems(ADENA_ID,30000)
        return u_give
      else:
        return no_statue
    elif event == "m_give":
      if st.getQuestItemsCount(CARGO_BOX1):
        coins = st.getQuestItemsCount(GUILD_COIN)
        count = int(coins/40)
        if count > 2 : count = 2
        st.giveItems(GUILD_COIN,1)
        st.giveItems(ADENA_ID,(1+count)*100)
        st.takeItems(CARGO_BOX1,1)
        random = st.getRandom(3)
        if random == 0:
          return m_rnd_1
        elif random == 1:
          return m_rnd_2
        else:
          return m_rnd_3
      else:
        return m_no_box
    elif event == "start_parts":
      return start_parts
    elif event == "m_reward":
      return m_reward
    elif event == "u_info":
      return u_info
    elif event == "l_info":
      return l_info
    elif event == "p_redfoot":
      return p_redfoot
    elif event == "p_trader_info":
      return p_trader_info
    elif event == "start_chose_parts":
      return start_parts
    elif event == "p1_explanation":
      return p1_explanation
    elif event == "p2_explanation":
      return p2_explanation
    elif event == "p3_explanation":
      return p3_explanation
    elif event == "p4_explanation":
      return p4_explanation
    elif event == "f_more_help":
      return f_more_help
    elif event == "r_exit":
      return r_exit
    
  def onTalk (self,npc,player):
    htmltext = "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>"
    st = player.getQuestState(qn)
    if not st : return htmltext

    npcId = npc.getNpcId()
    id = st.getState()
    if npcId != NPC[0] and id != State.STARTED : return htmltext

    if id == State.CREATED :
      if npcId == NPC[0]:
        if st.getQuestItemsCount(BLACK_LION_MARK) :
          if player.getLevel() >24 :
            return  start_start
          else:
            st.exitQuest(1)
            return start_error1
        else:
          st.exitQuest(1)
          return start_error2
    else: 
      part=st.getInt("part")
      if npcId==NPC[0]:
          if part == 1:
            item = UNDEAD_ASH
          elif part == 2:
            item = BLOODY_AXE_INSIGNIAS
          elif part == 3:
            item = DELU_FANG
          elif part == 4:
            item = STAKATO_TALONS
          else:
            return start_ask_again
          count=st.getQuestItemsCount(item)
          box=st.getQuestItemsCount(CARGO_BOX1)
          if box and count:
            giveRewards(st,item,count)
            return p_both_info
          elif box:
            return p_only_box_info
          elif count:
            giveRewards(st,item,count)
            return p_only_item_info
          else:
            return p_no_items
      elif npcId==NPC[1]:
          if st.getQuestItemsCount(CARGO_BOX1):
            return f_give_box
          else:
            return f_no_box
      elif npcId==NPC[2]:
          count=0
          for items in statue_list:
            if st.getQuestItemsCount(items):
              count+=1
          for items in tablet_list:
            if st.getQuestItemsCount(items):
              count+=1
          if count:
            return r_items
          else:
            return r_no_items
      elif npcId==NPC[3]:
        if st.getQuestItemsCount(COMPLETE_STATUE):
          return u_statue
        else:
          count=0
          for items in statue_list:
            if st.getQuestItemsCount(items):
              count+=1
          if count:
            return u_just_pieces
          else:
            return u_no_statue
      elif npcId==NPC[4]:
        if st.getQuestItemsCount(COMPLETE_TABLET):
          return l_tablet
        else:
          count=0
          for items in tablet_list:
            if st.getQuestItemsCount(items):
              count+=1
          if count:
            return l_just_pieces
          else:
            return l_no_tablet
      elif npcId==NPC[5]:
        if st.getQuestItemsCount(CARGO_BOX1):
          return m_box
        else:
          return m_no_box
          
  def onKill(self,npc,player,isPet):
    st = player.getQuestState(qn)
    if not st : return 
    if st.getState() != State.STARTED : return 

    npcId = npc.getNpcId()
    part,allowDrop,chancePartItem,chanceBox,partItem=DROPLIST[npcId]
    random1 = st.getRandom(101)
    random2 = st.getRandom(101)
    mobLevel = npc.getLevel()
    playerLevel = player.getLevel()
    if playerLevel - mobLevel > 8:
      chancePartItem/=3
      chanceBox/=3
    if allowDrop and st.getInt("part")==part :
      if random1<chancePartItem :
        st.giveItems(partItem,1)
        st.playSound("ItemSound.quest_itemget")
      if random2<chanceBox :
        st.giveItems(CARGO_BOX1,1)
        if not random1<chancePartItem:
          st.playSound("ItemSound.quest_itemget") 
    return


QUEST       = Quest(333,qn,"�·઺���y")


QUEST.addStartNpc(NPC[0])

for npcId in NPC:
  QUEST.addTalkId(npcId)

for mobId in MOBS:
  QUEST.addKillId(mobId)
