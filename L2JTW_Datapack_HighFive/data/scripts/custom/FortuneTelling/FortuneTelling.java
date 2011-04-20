/*
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU General Public License along with
 * this program. If not, see <http://www.gnu.org/licenses/>.
 */
package custom.FortuneTelling;

import com.l2jserver.gameserver.model.actor.L2Npc;
import com.l2jserver.gameserver.model.actor.instance.L2PcInstance;
import com.l2jserver.gameserver.model.quest.Quest;
import com.l2jserver.gameserver.model.quest.QuestState;
import com.l2jserver.gameserver.network.serverpackets.NpcHtmlMessage;

/**
 * @authors Kerberos (python), Nyaran (java)
 */
public class FortuneTelling extends Quest
{
	private static final String qn = "FortuneTelling";

	private static final int ADENA = 57;
	private static final int COST = 1000;

	private static final int NPC = 32616;

	private static final String[] FORTUNE =
	{
			"���o���P�C",
			"���e�ۨӺ֮�C",
			"�n�������b���ԡC",
			"���������A�ƨƶ��ߡC",
			"�N�|��P��a�ө��B�C",
			"�q�۳¤p�Ƥ]�i�M��ּ֡C",
			"�ۤv���\�ұN�|�������O�H�C",
			"�𮧡A�N�|�ӿէ�j�������C",
			"�۷R�B����~�|�a�Ӧn���G�C",
			"�����f���������N�|�a�ө��B�C",
			"�զ۳B�z�Ʊ��A�N�|�ۨӪȯɡC",
			"�i�H���ݩ��ԥB���Ʊ檺���ӡC",
			"�b���M�����|�U�i�H��o�n�B�C",
			"�Ʊ��N�|���ӭp�e����V�i��C",
			"�H�s�H�����B�A�N�|�����B���{�C",
			"���h����A�o�o��믫�譱���F��C",
			"�~�x���ͬ����A�Ʒ|�a�Ӻu�u�]���C",
			"���ﲧ�ʶ��O�����סA�ý�W���D�C",
			"�N��@�L�Ҧ��A�]�i�צ稬���a�L���C",
			"�Ʊ��i�i�����Q�A�|�y����ļ�M���w�C",
			"�����޲z�ɶ��A�K��o����ߪ����G�C",
			"�g�]��Ӫ��P�i�u�@�A�K��F��ؼСC",
			"�ݤH���p�A���׹�P�ơA�Ҥj�w�ߤ��ơC",
			"������커�b�A�ݭn�`�N�P���W������C",
			"���M�۹J�Q�H�A�N�|�o��ͬ��W�����O�C",
			"�γ\�|�J��x���A�y�V���Ҽ{�ð�w�N�ӡC",
			"�L�ת��g���A�B�N�ܤ��Ҳֿn���@���ӪšC",
			"���`���Q���ơA�g�`�]�|�����p�N���ɭԡC",
			"�W�۳B�z�Ʊ��ɡA�ܮe�����J���b�A���ԷV�C",
			"���ޭ��{�h��x�����Ʊ��A�U�ƬҪ�b�ӸѡC",
			"���O�o�b�A�u�|�ަV�ۤv���@�N���諸���p�C",
			"�o��믫�W�M����W�����U�A���즨�\���B�C",
			"�M���w�w���ͬ����A���ߪ��Ʊ��N�|�꺡�p�N�C",
			"�b�N�Q���쪺�a��A�N�|�o������ηs�����|�C",
			"�e���o�ͤp�p���N�~�M�f���A����H�e�e���ߡC",
			"�J��x�ҮɡA�o���p��Ӫ����U�A�N���M�Ʊ�C",
			"����������έA��q�ӥ����ơA�K�|�o�����U�C",
			"���U�@���g�ߦa�iù�Ʊ��A�N�|�o��N�~�����G�C",
			"�L�k���T��F�ۤv���N��A�]���ܮe�����ͻ~�|�C",
			"�y�@�����ιL��w�߫K�|����A���O���N�R���A�סC",
			"�O���꺡���H�����Y�A�K�|�J�W�����A�����������H�C",
			"���U�h�֪��ءA�K�|��ì�h�֡A�����ӭp�e�{�u��ơC",
			"���~���A�K�|�ɭP���H�����B�z����A������쩳�C",
			"�¥ؼ��ڶi���L�{���A�γ\�|�o�ͷN�Q���쪺���D�C",
			"�p�G�d�ʲ��e���p�p�Q�q�A�K�|�e���y�����ۦb�����Y�C",
			"�Ʊ��v���n��A�����o�]���۱i�A�_�h�n�B�N���A�ӥh�C",
			"�{�u�����ۤv�������ơA�K��ý�o�H��A�B���W�@�h�ӡC",
			"�P�亡���ۤv���g���A���p�����h�L�H�A�K�|�o��n���G�C",
			"���רƱ��B����B¾�~�B�a�H�M�ʤH�譱�A�ҷ|�R�����B�C",
			"�Y�N�ۤv���L���X�z�ơA�K�|�ǤU�L�i���^����j�����~�C",
			"�]�߳n�i��|���J�x�ҡA�ݭn�T���w�����ɭԡA�y�Ĩ�����A�סC",
			"�H���M�w���Ʊ��A�u�|�y���믫�W�M�����W���l���A�ݭn���������ǳơC",
			"�Y�O���F�����M�I�ӨϥX���{�����ܡA���򶷪�O��j���߫�ӳB�z����C",
			"�N��i�檺�Ʊ��o�Ͱ��D�A��űĥ��v�y���p�A���q���D���ڥ��C�C�z�M�C",
			"�Y�ݤH�L�׭p���Q�`���Y�B�S���סA�K�|�D�f�ޤ��a�A�ë�C�ۤv�����ȡC",
			"����y�����߱��A�̦n���n�z�A�����n���L�H���D�C�n�֦��h�A�۳¤p�Ƥ]�o�ñ��C",
			"�Y���{�ݭn�w�U���n�M�����ɭԡA�O�b�N�L�H���ݪk�A�y���T�x���ۤv���N�@�Ӱ��M�w�C",
			"�P���H������A�������A���n�}�f�A�ٷ|�y���Y�h�]���A�G���a����A�ñ�����L�����|�C"
	};

	public FortuneTelling(int questId, String name, String descr)
	{
		super(questId, name, descr);
		addStartNpc(NPC);
		addTalkId(NPC);
	}

	@Override
	public String onTalk(L2Npc npc, L2PcInstance player)
	{
		QuestState st = player.getQuestState(qn);
		NpcHtmlMessage html = new NpcHtmlMessage(1);
		String PARENT_DIR = "data/scripts/custom/FortuneTelling/";
		
		if (st == null)
			return null;

		if (st.getQuestItemsCount(ADENA) < COST)
			html.setFile(player.getHtmlPrefix(), PARENT_DIR + "lowadena.htm");
		else
		{
			st.takeItems(ADENA, COST);
			html.setFile(player.getHtmlPrefix(), PARENT_DIR + "fortune.htm");
			html.replace("%fortune%", FORTUNE[st.getRandom(FORTUNE.length)]);
		}
		st.exitQuest(true);
		player.sendPacket(html);
		return null;
	}

	public static void main(String args[])
	{
		new FortuneTelling(-1, qn, "custom");
	}
}
