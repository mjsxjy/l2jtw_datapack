# By L2J_JP SANDMAN

import sys
from net.sf.l2j.gameserver.model.quest import State
from net.sf.l2j.gameserver.model.quest import QuestState
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest
from net.sf.l2j.gameserver.serverpackets import SocialAction
from net.sf.l2j.gameserver.instancemanager import SailrenManager
from net.sf.l2j.gameserver.instancemanager import GrandBossManager

#NPC
STATUE          =   32109   #シーレンの石像/Shilen's Stone Statue
VELOCIRAPTOR    =   22218   #ヴェロキラプトル/Velociraptor
PTEROSAUR       =   22199   #ランフォリンクス/Pterosaur
TYRANNOSAURUS   =   22217   #ティラノザウルス/Tyrannosaurus
SAILREN         =   29065   #サイレン/Sailren

#ITEM
GAZKH   =   8784    #カジク/Gazkh

# Boss: sailren
class sailren (JQuest):

  def __init__(self,id,name,descr): JQuest.__init__(self,id,name,descr)

  def onTalk (self,npc,player):
    st = player.getQuestState("sailren")
    if not st : return "<html><head><body>ｽﾐｰﾝｧAｧ荅ﾚｦｳｬﾆｻ�ｨﾆｱ｡?</body></html>"
    npcId = npc.getNpcId()
    if npcId == STATUE :
      if player.isFlying() :
        return "<html><body>ｮuｵYｸtｹｳ｡G<br><font color=\"LEVEL\">ﾃMｭｼｭｸﾀsｪｬｺAｵLｪkｶi､J｡C</font></body></html>"
        #return "<html><body>Shilen's Stone Statue:<br>You may not enter while flying a wyvern</body></html>"
      if st.getQuestItemsCount(GAZKH) :
        ENTRY_SATAT = SailrenManager.getInstance().canIntoSailrenLair(player)
        if ENTRY_SATAT == 1 or ENTRY_SATAT == 2 :
          st.exitQuest(1)
          return "<html><body>ｮuｵYｸtｹｳ｡G<br><font color=\"LEVEL\">､wｸgｦｳ､Hｶi､Jﾁﾉｺｸﾄ�ｱ_･ﾞ｡Cｦb･LｭﾌｻPﾁﾉｺｸﾄ�ｪｺｹ�ｾﾔｵｲｧ�､ｧｫe､｣ｯ倏�ｧAｭﾌｶi､J｡C</font></body></html>"
          #return "<html><head><body>Shilen's Stone Statue:<br>Another adventurers have already fought against the sailren. Do not obstruct them.</body></html>"
        elif ENTRY_SATAT == 3 :
          st.exitQuest(1)
          return "<html><body>ｮuｵYｸtｹｳ｡G<br>ｵ･ｵ･｡CｧAｦ�･G､｣ｬOｬ�ｩwｭnｦbｳoｾﾔｰｫｰｵ･�ｾWｪｺ､Hｰﾚ｡Cｧﾚ･uｷ|ｹ�､@ｭﾓｶ､･�ｪｺｶ､･�ｶ､ｪ�･ｴｶ}ｳqｩｹﾁﾉｺｸﾄ�､sｹ�､ｧｪ�｡AｦpｪGｧAｷQｶﾇｰeｴNｱNｶ､･�ｪｺｶ､･�ｶ､ｪ�ｱaｨﾓ｡AｩﾎｪﾌｧA､]･i･Hｱoｨ�ｶ､･�ｶ､ｪ�ｸ�ｮ讎Aｦ^ｨﾓ｡C</body></html>"
          #return "<html><head><body>Shilen's Stone Statue:<br>The sailren is very powerful now. It is not possible to enter the inside.</body></html>"
        elif ENTRY_SATAT == 4 :
          st.exitQuest(1)
          return "<html><head><body>ｮuｵYｸtｹｳ｡G<br>ｷQ､@ｭﾓ､HｫﾊｦLﾁﾉｺｸﾄ�? ｧAｧOｷQ､F! ｽﾐｧ筝､･�ｱaｹLｨﾓｧa｡C</body></html>"
          #return "<html><head><body>Shilen's Stone Statue:<br>You seal the sailren alone? You should not do so! Bring the companion.</body></html>"
        elif ENTRY_SATAT == 0 :
          st.takeItems(GAZKH,1)
          SailrenManager.getInstance().setSailrenSpawnTask(VELOCIRAPTOR)
          SailrenManager.getInstance().entryToSailrenLair(player)
          return "<html><head><body>ｮuｵYｸtｹｳ｡G<br>ｽﾐ･ﾎｧAｪｺｧﾞ･ｩｧ簔ﾉｺｸﾄ�ｵｹｫﾊｦL｡C</body></html>"
          #return "<html><head><body>Shilen's Stone Statue:<br>Please seal the sailren by your ability.</body></html>"
      else :
        st.exitQuest(1)
        return "<html><head><body>ｮuｵYｸtｹｳ｡G<br><font color=LEVEL>･dｯ�ｧJ</font>ｬOｫﾊｦLﾁﾉｺｸﾄ�･ｲｳﾆｪｺｪｫｫ~｡C</body></html>"
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
