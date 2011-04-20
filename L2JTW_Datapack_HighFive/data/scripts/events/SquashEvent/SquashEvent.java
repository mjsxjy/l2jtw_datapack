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
package events.SquashEvent;

import java.util.Arrays;
import java.util.Comparator;

import javolution.util.FastMap;

import com.l2jserver.gameserver.datatables.SkillTable;
import com.l2jserver.gameserver.instancemanager.QuestManager;
import com.l2jserver.gameserver.model.L2Object;
import com.l2jserver.gameserver.model.L2Skill;
import com.l2jserver.gameserver.model.actor.L2Npc;
import com.l2jserver.gameserver.model.actor.instance.L2ChronoMonsterInstance;
import com.l2jserver.gameserver.model.actor.instance.L2PcInstance;
import com.l2jserver.gameserver.model.quest.Quest;
import com.l2jserver.gameserver.model.quest.QuestState;
import com.l2jserver.gameserver.network.clientpackets.Say2;
import com.l2jserver.gameserver.network.serverpackets.CreatureSay;
import com.l2jserver.gameserver.network.serverpackets.PlaySound;
import com.l2jserver.gameserver.templates.item.L2Weapon;
import com.l2jserver.util.Rnd;

/**
 * @author Gnacik
 * @version 1.0
 * @see Warning! Mostly that event is custom!
 * Update By pmq 04-09-2010
 */
public class SquashEvent extends Quest
{
	private static final String qn = "SquashEvent";
/**
 * ���ʰ���� ������ Npc ID (31255)
 */
	private static final int MANAGER = 31255;
/**
 * ���s Skill ID (2005)
 */
	private static final int NECTAR_SKILL = 2005;

	private static final long DESPAWN_FIRST = 180000;
	private static final long DESPAWN_NEXT = 90000;

	private static final int DAMAGE_MAX = 12;
	private static final int DAMAGE_DEFAULT = 5;
/**
 * �쳹�����־� �J�|�ջ����   Item ID (4202) * �L�������־� �J�|�չa��   Item ID (5133)
 * �ѳ������־� �J�|�է���     Item ID (5817) * �v�������־� �J�|�չF���d Item ID (7058)
 * ������־� �J�|�պ��ԥd�� Item ID (8350)
 */
	private static final int[] CHRONO_LIST =
	{
		4202,5133,5817,7058,8350
	};
/**
 * ����������Ī   Mob ID (12774) * �u�}����Ī     Mob ID (12775) * ���}����Ī   Mob ID (12776)
 * ���������j��Ī Mob ID (12777) * �u�}���j��Ī   Mob ID (12778) * ���}���j��Ī Mob ID (12779)
 * �u�}����Ī��   Mob ID (13016) * �u�}���j��Ī�� Mob ID (13017)
 */
	private static final int[] SQUASH_LIST =
	{
		12774,12775,12776,
		12777,12778,12779,
		13016,13017
	};

	private static final String[] SPAWN_TEXT =
	{
		"����A�o�O�h�[�S�������H�ڡH",
		"���ߵo�]�I",
		"�Q�ݧڬ��R�����A��~�H",
		"�x~�I�o�O���̰�~�O����s�ڪ��r~�H",
		"�K��~�I��Ī�n����~�I"
	};
	private static final String[] GROWUP_TEXT =
	{
		"�n�ܤj~�٬O�n�ܱj~�H�I���X�z���@��a~~�I",
		"�����긬Ī�I...���L�A�w�g�����F�C�H",
		"���I���j�o~�I�����񰨹L�ӡI",
		"�K��~��~��~�F~�I",
		"�ܦn~�ܦn~���o~�ܦn�C���U�Ӫ��D�n������F�a�H",
		"�w�g�����F~�I�ڭn�k���o~^^"
	};
	// ���z��Ī�����
	private static final String[] KILL_TEXT =
	{
		"�z�X�ǧ��ǧa�I�I�I",
		"���ߡI���ߡI",
		"��Ī�z�}�աI�I�I",
		"�u��I�z�}�աI�̭����F��M�ռM��~",
		"�ڡA�z�l�y�X�ӤF�I",
		"���ߵo�]�I",
		"���۳o�ӵ��ںu�J~",
		"�O��ڪ����T�y�ǩ�~�I",
		"�A�h�����ܤ^���a�I",
		"�ذڰڡI�n���j�I���ӯ�k����...",
		"�U��A�o�̪���Ī�z�}�աI���_�����U�Ӯ@�I�z������"
	};
	// �S�Ϋ��w�Z�����Ǫ����
	private static final String[] NOCHRONO_TEXT =
	{
		"�A���r�I�A���r�I",
		"���r�H���ڡH���ڬO�ܡH",
		"�޳ޡA���F�a�H�o�˷|�\�@�H",
		"�o�˷|�\��~�ڤ����o~",
		"�D�H�ϱϧڧa~�s�@�w���s���S�|�L�N�n����~",
		"�A�N�n�n~���նO�u�ҧa�I",
		"����I���M�{�b���ڶå��H���O�n�A�寫�s�ܡH",
		"�ޡA�ڳo�˦��F�A�����_�����S���F�@�H���s������öQ�ܡH",
		"�n�O�������s���ܡA2������N�|�]���o~",
		"�o�˦��F�N�ܦ��^����~",
		"�n�O�������s���ܡA1������N�������o~",
		"���i�ڤϦӷQ�Y���ڬO�ܡH�n�A�H�A�K~�������s�N�����A�ݡI"
	};
	// �Ϋ��w�Z�����Ǫ����
	private static final String[] CHRONO_TEXT =
	{
		"�@�A�o�X���I�u�O���b�F�I�A�u�u�ݡI",
		"�N�O�o�ӡI�o�N�O�ڭn���۫ߡI�A�I�Q���Q���q�P�ڡH",
		"�@�A�n��������H",
		"�־������A���S���q���C�C�n�ڨӰۤ@���ܡH",
		"�ڧ��J�F...",
		"�D�z..�D�D�z..���n����..",
		"�z����...�A��|���������֪Z��.."
	};
	// �ί��s������Ī�����
	private static final String[] NECTAR_TEXT =
	{
		"��h��...�ڻݭn�o��h...���s",
		"�z�������A�i�n���n�F��~���i���n�O�H�ڤ]�����D~",
		"�ޡA�ڳo�˦��F�A�����_�����S���F�@�H���s������öQ�ܡH",
		"�A���r�I�A���r�I",
		"�����j�F�I���N�Ө��H�o~",
		"��éA�A�I�A�o�O����I�O���s�ܡH",
		"�ڻݭn���s�r�I",
		"���ڦh�@�I��..���s�I",
		"�ڧ֪��j��...",
		"��~�ܦn�ܦn�C�A�~��A�C�C���n�_�ӤF�C"
	};
	// ���~ �i ID �Ǫ� , NO ���v , ID ���~, NO �ƶq �j
	private static final int[][] DROPLIST =
	{
		/**
		 * must be sorted by npcId !
		 * npcId, chance, itemId,qty [,itemId,qty...]
		 *
		 * Young Squash
		 * ����������Ī
		 */
		{ 12774,100,  6391,2 },		// Nectar
		/**
		 * Low Quality Squash
		 * ���}����Ī
		 */
		{ 12776,100,  6391,10 },	// Nectar
		/**
		 * High Quality Squash
		 * �u�}����Ī
		 */
		{ 12775,100,  6391,30 },	// Nectar
		/**
		 * King Squash
		 * �u�}����Ī��
		 */
		{ 13016,100,  6391,50 },	// Nectar
		/**
		 * Large Young Squash
		 * ���������j��Ī
		 */
		{ 12777,100, 14701,2,		// �W�j�O������O�v¡�Ĥ�
		             14700,2 },		// �W�j�O��O�v¡�Ĥ�
		/**
		 * Low Quality Large
		 * ���}���j��Ī
		 */
		{ 12779, 50,   729,4,		// �Z���j�ƨ��b-A��
		               730,4,		// ����j�ƨ��b-A��
		              6569,2,		// ���֪��Z���j�ƨ��b-A��
		              6570,2 },		// ���֪�����j�ƨ��b-A��
		{ 12779, 30,  6622,1 },		// ���H���g��
		{ 12779, 10,  8750,1 },		// ���ťͩR��-67��
		{ 12779, 10,  8751,1 },		// ���ťͩR��-70��
		{ 12779, 99, 14701,4,		// �W�j�O������O�v¡�Ĥ�
		             14700,4 },		// �W�j�O��O�v¡�Ĥ�
		{ 12779, 50,  1461,4 },		// ����-A��
		{ 12779, 30,  1462,3 },		// ����-S��
		{ 12779, 50,  2133,4 },		// �_��-A��
		{ 12779, 30,  2134,3 },		// �_��-S��
		/**
		 * High Quality Large
		 * �u�}���j��Ī
		 */
		{ 12778,  7,  9570,1,		// ����j���-���q14
		              9571,1,		// �Ŧ�j���-���q14
		              9572,1,		// ���j���-���q14
		             10480,1,		// ����j���-���q15
		             10481,1,		// �Ŧ�j���-���q15
		             10482,1,		// ���j���-���q15
		             13071,1,		// ����j���-���q16
		             13072,1,		// �Ŧ�j���-���q16
		             13073,1 },		// ���j���-���q16
		{ 12778, 35,   729,4,		// �Z���j�ƨ��b-A��
		               730,4,		// ����j�ƨ��b-A��
		               959,3,		// �Z���j�ƨ��b-S��
		               960,3,		// ����j�ƨ��b-S��
		              6569,2,		// ���֪��Z���j�ƨ��b-A��
		              6570,2,		// ���֪�����j�ƨ��b-A��
		              6577,1,		// ���֪��Z���j�ƨ��b-S��
		              6578,1 },		// ���֪�����j�ƨ��b-S��
		{ 12778, 28,  6622,3,		// ���H���g��
		              9625,2,		// ���H���g��-��ѽg
		              9626,2,		// ���H���g��-�V�m�g
		              9627,2 },		// ���H���g��-���m�g
		{ 12778, 14,  8750,10 },	// ���ťͩR��-67��
		{ 12778, 14,  8751,8 },		// ���ťͩR��-70��
		{ 12778, 14,  8752,6 },		// ���ťͩR��-76��
		{ 12778, 14,  9575,4 },		// ���ťͩR��-80��
		{ 12778, 14, 10485,2 },		// ���ťͩR��-82��
		{ 12778, 14, 14168,1 },		// ���ťͩR��-84��
		{ 12778, 21,  8760,1,		// �S�ťͩR��-67��
		              8761,1,		// �S�ťͩR��-70��
		              8762,1,		// �S�ťͩR��-76��
		              9576,1,		// �S�ťͩR��-80��
		             10486,1,		// �S�ťͩR��-82��
		             14169,1 },		// �S�ťͩR��-84��
		{ 12778, 21, 14683,1,		// �W�j�O�ͩR�F��-D��
		             14684,1,		// �W�j�O�ͩR�F��-C��
		             14685,1,		// �W�j�O�ͩR�F��-B��
		             14686,1,		// �W�j�O�ͩR�F��-A��
		             14687,1,		// �W�j�O�ͩR�F��-S��
		             14689,1,		// �W�j�O�믫�F��-D��
		             14690,1,		// �W�j�O�믫�F��-C��
		             14691,1,		// �W�j�O�믫�F��-B��
		             14692,1,		// �W�j�O�믫�F��-A��
		             14693,1,		// �W�j�O�믫�F��-S��
		             14695,1,		// �W�j�O�����F��-D��
		             14696,1,		// �W�j�O�����F��-C��
		             14697,1,		// �W�j�O�����F��-B��
		             14698,1,		// �W�j�O�����F��-A��
		             14699,1 },		// �W�j�O�����F��-S��
		{ 12778, 99, 14701,9,		// �W�j�O������O�v¡�Ĥ�
		             14700,9 },		// �W�j�O��O�v¡�Ĥ�
		{ 12778, 63,  1461,8 },		// ����-A��
		{ 12778, 49,  1462,5 },		// ����-S��
		{ 12778, 63,  2133,6 },		// �_��-A��
		{ 12778, 49,  2134,4 },		// �_��-S��
		/**
		 * Emperor Squash
		 * �u�}���j��Ī��
		 */
		{ 13017, 10,  9570,1,		// ����j���-���q14
		              9571,1,		// �Ŧ�j���-���q14
		              9572,1,		// ���j���-���q14
		             10480,1,		// ����j���-���q15
		             10481,1,		// �Ŧ�j���-���q15
		             10482,1,		// ���j���-���q15
		             13071,1,		// ����j���-���q16
		             13072,1,		// �Ŧ�j���-���q16
		             13073,1 },		// ���j���-���q16
		{ 13017, 50,   729,4,		// �Z���j�ƨ��b-A��
		               730,4,		// ����j�ƨ��b-A��
		               959,3,		// �Z���j�ƨ��b-S��
		               960,3,		// ����j�ƨ��b-S��
		              6569,2,		// ���֪��Z���j�ƨ��b-A��
		              6570,2,		// ���֪�����j�ƨ��b-A��
		              6577,1,		// ���֪��Z���j�ƨ��b-S��
		              6578,1 },		// ���֪�����j�ƨ��b-S��
		{ 13017, 40,  6622,3,		// ���H���g��
		              9625,2,		// ���H���g��-��ѽg
		              9626,2,		// ���H���g��-�V�m�g
		              9627,2 },		// ���H���g��-���m�g
		{ 13017, 20,  8750,10 },	// ���ťͩR��-67��
		{ 13017, 20,  8751,8 },		// ���ťͩR��-70��
		{ 13017, 20,  8752,6 },		// ���ťͩR��-76��
		{ 13017, 20,  9575,4 },		// ���ťͩR��-80��
		{ 13017, 20, 10485,2 },		// ���ťͩR��-82��
		{ 13017, 20, 14168,1 },		// ���ťͩR��-84��
		{ 13017, 30,  8760,1,		// �S�ťͩR��-67��
		              8761,1,		// �S�ťͩR��-70��
		              8762,1,		// �S�ťͩR��-76��
		              9576,1,		// �S�ťͩR��-80��80
		             10486,1,		// �S�ťͩR��-82��
		             14169,1 },		// �S�ťͩR��-84��
		{ 13017, 30, 14683,1,		// �W�j�O�ͩR�F��-D��
		             14684,1,		// �W�j�O�ͩR�F��-C��
		             14685,1,		// �W�j�O�ͩR�F��-B��
		             14686,1,		// �W�j�O�ͩR�F��-A��
		             14687,1,		// �W�j�O�ͩR�F��-S��
		             14689,1,		// �W�j�O�믫�F��-D��
		             14690,1,		// �W�j�O�믫�F��-C��
		             14691,1,		// �W�j�O�믫�F��-B��
		             14692,1,		// �W�j�O�믫�F��-A��
		             14693,1,		// �W�j�O�믫�F��-S��
		             14695,1,		// �W�j�O�����F��-D��
		             14696,1,		// �W�j�O�����F��-C��
		             14697,1,		// �W�j�O�����F��-B��
		             14698,1,		// �W�j�O�����F��-A��
		             14699,1 },		// �W�j�O�����F��-S��
		{ 13017, 99, 14701,12,		// �W�j�O������O�v¡�Ĥ�
		             14700,12 },	// �W�j�O��O�v¡�Ĥ�
		{ 13017, 90,  1461,8 },		// ����-A��
		{ 13017, 70,  1462,5 },		// ����-S��
		{ 13017, 90,  2133,6 },		// �_��-A��
		{ 13017, 70,  2134,4 },		// �_��-S��
	};

	private int _numAtk = 0;
	private int w_nectar = 0;
	
	class TheInstance
	{
		int nectar;
		//int numatk;
		//int tmpatk;
		long despawnTime;
	}
	FastMap<L2ChronoMonsterInstance, TheInstance> _monsterInstances = new FastMap<L2ChronoMonsterInstance, TheInstance>().shared();
	private TheInstance create(L2ChronoMonsterInstance mob)
	{
		TheInstance mons = new TheInstance();
		_monsterInstances.put(mob, mons);
		return mons;
	}
	private TheInstance get(L2ChronoMonsterInstance mob)
	{
		return _monsterInstances.get(mob);
	}
	private void remove(L2ChronoMonsterInstance mob)
	{
		cancelQuestTimer("countdown", mob, null);
		cancelQuestTimer("despawn", mob, null);
		_monsterInstances.remove(mob);
	}

	@Override
	public String onAdvEvent(String event, L2Npc npc, L2PcInstance player)
	{
		if (event == "countdown")
		{
			final L2ChronoMonsterInstance mob = (L2ChronoMonsterInstance)npc;
			final TheInstance self = get(mob);
			int timeLeft = (int)((self.despawnTime - System.currentTimeMillis()) / 1000);
			if (timeLeft == 30)
				autoChat(mob, "�}�l���믫�F~�H�I�A��30���A�N�i�H�}�ȤF~�I�I�I");
			else if (timeLeft == 20)
				autoChat(mob, "�}�l���믫�F~�H�I�A��20���A�N�i�H�}�ȤF~�I�I�I");
			else if (timeLeft == 10)
				autoChat(mob, "�@�A10���ɶ��I 9 ... 8 ... 7 ...");
			else if (timeLeft == 0)
			{
				if (self.nectar == 0)
					autoChat(mob, "�ޡA�ڳo�˦��F�A�����_�����S���F�@�H���s������öQ�ܡH");
				else
					autoChat(mob, "�D�H�ϱϧڧa~�s�@�w���s���S�|�L�N�n����~");
			}
			else if ((timeLeft % 60) == 0)
			{
				if (self.nectar == 0)
					autoChat(mob, "�n�O�������s����" + timeLeft/60 + "������N�|�]���o~");
			}
		}
		else if (event == "despawn")
		{
			remove((L2ChronoMonsterInstance)npc);
			npc.deleteMe();
		}
		else if (event == "sound")
		{
			final L2ChronoMonsterInstance mob = (L2ChronoMonsterInstance)npc;
			mob.broadcastPacket(new PlaySound(0, "ItemSound3.sys_sow_success", 0, 0, 0, 0, 0));
		}
		else
			return super.onAdvEvent(event, npc, player);
		return null;
	}

	@Override
	public String onAttack(L2Npc npc, L2PcInstance attacker, int damage, boolean isPet)
	{
		final L2ChronoMonsterInstance mob = (L2ChronoMonsterInstance)npc;
		L2Weapon weapon;
		final boolean isChronoAttack
			= !isPet
			&& (weapon = attacker.getActiveWeaponItem()) != null && contains(CHRONO_LIST, weapon.getItemId());
		switch (mob.getNpcId())
		{
			case 12774:
			case 12775:
			case 12776:
			case 13016:
				if (isChronoAttack)
				{
					chronoText(mob);
				}
				else
				{
					noChronoText(mob);
				}
				break;
			case 12777:
			case 12778:
			case 12779:
			case 13017:
				if (isChronoAttack)
				{
					mob.setIsInvul(false);
					if (damage == 0)
						mob.getStatus().reduceHp(DAMAGE_DEFAULT, attacker);
					else if (damage > DAMAGE_MAX)
						mob.getStatus().setCurrentHp(mob.getStatus().getCurrentHp() + damage - DAMAGE_MAX);
					chronoText(mob);
				}
				else
				{
					mob.setIsInvul(true);
					mob.setCurrentHp(mob.getMaxHp());
					noChronoText(mob);
				}
				break;
			default:
				throw new RuntimeException();
		}
		mob.getStatus().stopHpMpRegeneration();
		return super.onAttack(npc, attacker, damage, isPet);
	}

	@Override
	public String onSkillSee(L2Npc npc, L2PcInstance caster, L2Skill skill, L2Object[] targets, boolean isPet)
	{
		if (skill.getId() == NECTAR_SKILL && targets[0] == npc)
		{
			final L2ChronoMonsterInstance mob = (L2ChronoMonsterInstance)npc;
			switch(mob.getNpcId())
			{
				case 12774:
					if (w_nectar == 0 || w_nectar == 1 || w_nectar == 2 || w_nectar == 3 || w_nectar == 4)
					{
						if(Rnd.get(100) < 50)
						{
							nectarText(mob);
							npc.doCast(SkillTable.getInstance().getInfo(4514, 1));
							w_nectar++;
						}
						else
						{
							nectarText(mob);
							npc.doCast(SkillTable.getInstance().getInfo(4513, 1));
							w_nectar++;
							_numAtk++;
						}
					}
					else if (w_nectar >= 4)
					{
						if (_numAtk >= 4)
						{
							randomSpawn(12775, 12775, 13016, mob);
							w_nectar++;
							_numAtk = 0;
						}
						else 
						{
							randomSpawn(12776, 12776, 12776, mob);
							_numAtk = 0;
						}
					}
					//randomSpawn(12776, 12775, 13016, mob);
					break;
				case 12777:
					if (w_nectar == 0 || w_nectar == 1 || w_nectar == 2 || w_nectar == 3 || w_nectar == 4)
					{
						if(Rnd.get(100) < 50)
						{
							nectarText(mob);
							npc.doCast(SkillTable.getInstance().getInfo(4514, 1));
							w_nectar++;
						}
						else
						{
							nectarText(mob);
							npc.doCast(SkillTable.getInstance().getInfo(4513, 1));
							w_nectar++;
							_numAtk++;
						}
					}
					else if (w_nectar >= 4)
					{
						if (_numAtk >= 4)
						{
							randomSpawn(12778, 12778, 13017, mob);
							w_nectar++;
							_numAtk = 0;
						}
						else 
						{
							randomSpawn(12779, 12779, 12779, mob);
							_numAtk = 0;
						}
					}
					//randomSpawn(12779, 12778, 13017, mob);
					break;
				case 12775:
					npc.doCast(SkillTable.getInstance().getInfo(4513, 1));
					randomSpawn(13016, mob);
					break;
				case 12778:
					npc.doCast(SkillTable.getInstance().getInfo(4513, 1));
					randomSpawn(13017, mob);
					break;
				case 12776:
				case 12779:
					autoChat(mob, "�����j�F�I���N�Ө��H�o~");
					break;
			}
		}
		return null;
		//return super.onSkillSee(npc,caster,skill,targets,isPet);
	}

	@Override
	public String onKill(L2Npc npc, L2PcInstance killer, boolean isPet)
	{
		final L2ChronoMonsterInstance mob = (L2ChronoMonsterInstance)npc;
		remove(mob);
		autoChat(mob, KILL_TEXT[Rnd.get(KILL_TEXT.length)]);
		dropItem(mob, killer);
		w_nectar = 0;
		return super.onKill(npc, killer, isPet);
	}

	@Override
	public String onSpawn(L2Npc npc)
	{
		assert npc instanceof L2ChronoMonsterInstance;
		
		final L2ChronoMonsterInstance mob = (L2ChronoMonsterInstance)npc;
		mob.setOnKillDelay(1500);	//Default 5000ms.
		final TheInstance self = create(mob);
		switch(mob.getNpcId())
		{
			case 12774:
			case 12777:
				startQuestTimer("countdown", 10000, mob, null, true);
				startQuestTimer("despawn", DESPAWN_FIRST, mob, null);
				self.nectar = 0;
				self.despawnTime = System.currentTimeMillis() + DESPAWN_FIRST;
				autoChat(mob, SPAWN_TEXT[Rnd.get(SPAWN_TEXT.length)]);
				break;
			case 12775:
			case 12776:
			case 12778:
			case 12779:
			case 13016:
			case 13017:
				startQuestTimer("countdown", 10000, mob, null, true);
				startQuestTimer("despawn", DESPAWN_NEXT, mob, null);
				startQuestTimer("sound",100, mob, null);
				self.nectar = 5;
				self.despawnTime = System.currentTimeMillis() + DESPAWN_NEXT;
				autoChat(mob, GROWUP_TEXT[Rnd.get(GROWUP_TEXT.length)]);
				break;
			default:
				throw new RuntimeException();
		}
		return null;
		//return super.onSpawn(npc);
	}

	static {
		Arrays.sort(DROPLIST, new Comparator<int[]>() {
			public int compare(int[] a, int[] b) { return a[0] - b[0]; }
		});
	}
	private static final void dropItem(L2ChronoMonsterInstance mob, L2PcInstance player)
	{
		final int npcId = mob.getNpcId();
		for (int[] drop : DROPLIST)
		{
			/**
			 * npcId   = drop[0]
			 * chance  = drop[1]
			 * itemId  = drop[2,4,6,8...]
			 * itemQty = drop[3,5,7,9...]
			 */
			if (npcId == drop[0])
			{
				final int chance = Rnd.get(100);
				if (chance < drop[1])
				{
					int i = 2 + 2 * Rnd.get((drop.length - 2) / 2);
					int itemId = drop[i + 0];
					int itemQty = drop[i + 1];
					if (itemQty > 1) itemQty = Rnd.get(1, itemQty);
					mob.dropItem(mob.getOwner(), itemId, itemQty);
					continue;
				}
			}
			if (npcId < drop[0])
				return; // not found
		}
	}

	private void randomSpawn(int bad, int good, int king, L2ChronoMonsterInstance mob)
	{
		//final TheInstance self = get(mob);
		if (w_nectar >= 5)
		{
			w_nectar = 0;
			int _random = Rnd.get(100);
			if ((_random -= 10) < 0)		// 10% 
				spawnNext(king, mob);
			else if ((_random -= 40) < 0)	// 40% 
				spawnNext(good, mob);
			else							// 50% 
				spawnNext(bad, mob);
		}
		else
		{
			nectarText(mob);
		}
	}

	private void randomSpawn(int king, L2ChronoMonsterInstance mob)
	{
		final TheInstance self = get(mob);
		if (++self.nectar > 5 && self.nectar <= 15 && Rnd.get(100) < 10)	// 10% 
			spawnNext(king, mob);
		else
			nectarText(mob);
	}

	private void autoChat(L2ChronoMonsterInstance mob, String text)
	{
		mob.broadcastPacket(new CreatureSay(mob.getObjectId(), Say2.ALL, mob.getName(), text));
	}
	private void chronoText(L2ChronoMonsterInstance mob)
	{
		if (Rnd.get(100) < 20)
			autoChat(mob, CHRONO_TEXT[Rnd.get(CHRONO_TEXT.length)]);
	}
	private void noChronoText(L2ChronoMonsterInstance mob)
	{
		if (Rnd.get(100) < 20)
			autoChat(mob, NOCHRONO_TEXT[Rnd.get(NOCHRONO_TEXT.length)]);
	}
	private void nectarText(L2ChronoMonsterInstance mob)
	{
	/*	if (Rnd.get(100) < 30)	*/
		autoChat(mob, NECTAR_TEXT[Rnd.get(NECTAR_TEXT.length)]);
	}

	private void spawnNext(int npcId, L2ChronoMonsterInstance oldMob)
	{
		remove(oldMob);
		L2ChronoMonsterInstance newMob = (L2ChronoMonsterInstance)addSpawn(npcId, oldMob.getX(), oldMob.getY(), oldMob.getZ(), oldMob.getHeading(), false, 0);
		newMob.setOwner(oldMob.getOwner());
		newMob.setTitle(oldMob.getTitle());
		oldMob.deleteMe();
	}

	public static <T> boolean contains(T[] array, T obj)
	{
		for (int i = 0; i < array.length; i++)
		{
			if (array[i] == obj)
			{
				return true;
			}
		}
		return false;
	}

	public static boolean contains(int[] array, int obj)
	{
		for (int i = 0; i < array.length; i++)
		{
			if (array[i] == obj)
			{
				return true;
			}
		}
		return false;
	}

	public SquashEvent(int questId, String name, String descr)
	{
		super(questId, name, descr);

		for (int mob : SQUASH_LIST)
		{
			addAttackId(mob);
			addKillId(mob);
			addSpawnId(mob);
			addSkillSeeId(mob);
		}

		addStartNpc(MANAGER);
		addFirstTalkId(MANAGER);
		addTalkId(MANAGER);
		
		//addSpawn(MANAGER, 83063, 148843, -3477, 32219, false, 0);
	}

	@Override
	public String onFirstTalk(L2Npc npc, L2PcInstance player)
	{
		//String htmltext = "";
		QuestState st = player.getQuestState(getName());
		if (st == null)
		{
			Quest q = QuestManager.getInstance().getQuest(getName());
			st = q.newQuestState(player);
		}
		switch (npc.getNpcId())
		{
			case MANAGER: return "31255.htm";
		}
		throw new RuntimeException();
	}

	@Override
	public String onEvent(String event, QuestState qs)
	{
		// 31255-1.htm
		return event;
	}

	public static void main(String[] args)
	{
		new SquashEvent(-1, qn, "events");
	}
}