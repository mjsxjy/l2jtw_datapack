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
package quests.Q196_SevenSignSealOfTheEmperor;

import javolution.util.FastList;
import javolution.util.FastMap;

import com.l2jserver.gameserver.ai.CtrlIntention;
import com.l2jserver.gameserver.datatables.SkillTable;
import com.l2jserver.gameserver.instancemanager.InstanceManager;
import com.l2jserver.gameserver.instancemanager.InstanceManager.InstanceWorld;
import com.l2jserver.gameserver.model.L2Effect;
import com.l2jserver.gameserver.model.actor.L2Attackable;
import com.l2jserver.gameserver.model.actor.L2Character;
import com.l2jserver.gameserver.model.actor.L2Npc;
import com.l2jserver.gameserver.model.actor.instance.L2DoorInstance;
import com.l2jserver.gameserver.model.actor.instance.L2PcInstance;
import com.l2jserver.gameserver.model.entity.Instance;
import com.l2jserver.gameserver.model.L2Object;
import com.l2jserver.gameserver.model.L2Skill;
import com.l2jserver.gameserver.model.L2World;
import com.l2jserver.gameserver.model.quest.Quest;
import com.l2jserver.gameserver.model.quest.QuestState;
import com.l2jserver.gameserver.model.quest.State;
import com.l2jserver.gameserver.network.SystemMessageId;
import com.l2jserver.gameserver.network.serverpackets.*;
//import com.l2jserver.util.Rnd;

/**
 * update by pmq 16-05-2011
 *
 */
public class Q196_SevenSignSealOfTheEmperor extends Quest
{
	private static class SIGNSNpc
	{
		public L2Npc npc;
	
		public boolean isDead = false;
	}
	
	private static class SIGNSRoom
	{
		public FastList<SIGNSNpc> npcList = new FastList<SIGNSNpc>();
	}
	
	private class SIGNSWorld extends InstanceWorld
	{
		public FastMap<String,SIGNSRoom> rooms = new FastMap<String,SIGNSRoom>();
		public long[] storeTime = { 0, 0 };
		public SIGNSWorld() {}
	}
	
	private static boolean debug = false;
	private static boolean noRndWalk = true;
	
	public static final String qn = "196_SevenSignSealOfTheEmperor";
	private static final int INSTANCE_ID       = 112;
	
	// NPCs
	private static final int HEINE             = 30969;  // ��ˮ���
	private static final int MAMMON            = 32584;  // �]�I���ӤH
	private static final int SHUNAIMAN         = 32586;  // �㺸���ȤB�ӫ� �v�`��
	private static final int MAGICAN           = 32598;  // �㺸���ȤB �c���]�k�v
	private static final int WOOD              = 32593;  // ���x �żw
	private static final int LEON              = 32587;  // �ӫ�ĵ�� �ܷ�
	private static final int PROMICE_OF_MAMMON = 32585;  // �ǰe�v �]�I�����w
	private static final int DISCIPLES_GK      = 32657;  // �Ϯ{���u���H
	
	//FIGHTING NPCS
	private static final int LILITH        = 32715;  // �`�W���t�� ������
	private static final int LILITH_GUARD0 = 32716;  // ���������N����
	private static final int LILITH_GUARD1 = 32717;  // ���������˽ö�
	private static final int ANAKIM        = 32718;  // �t�������� �ȯ�
	private static final int ANAKIM_GUARD0 = 32719;  // �ȯǪ��u�@��
	private static final int ANAKIM_GUARD1 = 32720;  // �ȯǪ��T�ö�
	private static final int ANAKIM_GUARD2 = 32721;  // �ȯǪ������
	
	//DOOR
	//private static final int DOOR1  = 17240101; /** �Ĥ@�ж����n�θt���}�� */
	private static final int DOOR2  = 17240102; /** �Ĥ@�ж��ǥ����۰ʶ}�� */
	//private static final int DOOR3  = 17240103; /** �ĤG�ж����n���]�k�ζ}�� */
	private static final int DOOR4  = 17240104; /** �ĤG�ж��ǥ����۰ʶ}�� */
	//private static final int DOOR5  = 17240105; /** �ĤT�ж����n�θt���}�� */
	private static final int DOOR6  = 17240106; /** �ĤT�ж��ǥ����۰ʶ}�� */
	//private static final int DOOR7  = 17240107; /** �ĥ|�ж����n���]�k�ζ}�� */
	private static final int DOOR8  = 17240108; /** �ĥ|�ж��ǥ����۰ʶ}�� */
	//private static final int DOOR9  = 17240109; /** �Ĥ��ж����n�θt���}�� */
	private static final int DOOR10 = 17240110; /** �Ĥ��ж��ǥ����۰ʶ}�� */
	private static final int DOOR = 17240111;
	// INSTANCE TP
	private static final int[] TELEPORT = { -89559, 216030, -7488 };
	
	private static final int[] NPCS = { HEINE, WOOD, MAMMON, MAGICAN, SHUNAIMAN, LEON, PROMICE_OF_MAMMON, DISCIPLES_GK };
	
	// MOBs
	private static final int SEALDEVICE = 27384;  // �v�`�ҬӫҪ� �ʦL�˸m
	private static final int[] TOKILL = {27371,27372,27373,27374,27375,27377,27378,27379,27384};
	private static final int[] TOCHAT = {27371,27372,27373,27377,27378,27379};
	
	// QUEST ITEMS
	private static final int WATER = 13808;  // �㺸���ȤB���t��
	private static final int SWORD = 15310;  // ����ĸt�C
	private static final int SEAL  = 13846;  // �ʦL���L��
	private static final int STAFF = 13809;  // �c���]�k�v���]�k��
	
	//Skills
	private static final int EINHASAD_STRIKE = 8357;
	
	private int mammonst = 0;
	
	/**
	�i�Ƶ��j�G�i1~3�j �O�}���եu�|�X�@���A�i4~12�j �O�üƥX��ܡA�iEND�j �O�̫�~�|�X����ܡC
	�i�r�C��j	�i��ܦ��ǡj	�i�H���j	�i��ܽs���j	�i��ܤ��e�j
	�iOrange�j	�i1�j			�iANAKIM�j	�i19606�j		�i���F����Ī��ë��I�I�I�j
	�iPink�j	�i2�j			�iANAKIM�j	�i19611�j		�i�ڪ��O�q�b�ܮz�A�л��ֱҰʫʦL�˸m�a�I�I�I�j
	�iOrange�j	�i3�j			�iLILITH�j	�i19615�j		�i�M�����F��I�o���Ԫ����ӧQ�O�k�u�Y���I�I�I�j
	�iOrange�j	�i4�j			�iANAKIM�j	�i19609�j		�i�����x�հڡI���Ѯu�Y���Ĥl�̧a�I�I�I�j
	�iPink�j	�i5�j			�iANAKIM�j	�i19614�j		�i�u$s1�v�ڡA�бz�A..�[�I�O�C�j
	�iOrange�j	�i7�j			�iANAKIM�j	�i19608�j		�i�����A���@�@����įu�����O�q�I�j
	�iPink�j	�i8�j			�iANAKIM�j	�i19613�j		�i�������������ܱo��[���r�F�I�л��ֱҰʡI�j
	�iOrange�j	�i11�j			�iANAKIM�j	�i19607�j		�i�u�Y���Ĥl�̰ڡI�A�̵L�k�����ڭ̪����I�j
	�iPink�j	�i12�j			�iANAKIM�j	�i19612�j		�i4�ӫʦL�˸m�����n�����ҰʡI�I�I�j
	�iOrange�j	�iEND�j			�iANAKIM�j	�i19610�j		�i�o�����O�U�u$s1�v���֡A���¡I�j
	�iOrange�j	�i6�j			�iLILITH�j	�i19617�j		�i�ȯǡI�H���j���u�Y���W�A�ڱN�F�_�A���ͩR�I�j
	�iOrange�j	�i9�j			�iLILITH�j	�i19616�j		�i�����Q�n�M�ڤ�Z�H�u�O�i���C�j
	�iOrange�j	�i10�j			�iLILITH�j	�i19618�j		�i�A�L�k������--�����������A���A�@�@�ڪ��F�`�I�j
	�iOrange�j	�iEND�j			�iLILITH�j	�i19619�j		�i���M�N�o�˦^��u�Y���h��..�u�O��..�j
	*/
	
	private static final void removeBuffs(L2Character ch)
	{
		for (L2Effect e : ch.getAllEffects())
		{
			if (e == null)
				continue;
			L2Skill skill = e.getSkill();
			if (skill.isDebuff() || skill.isStayAfterDeath())
				continue;
			e.exit();
		}
	}
	
	@Override
	public String onAggroRangeEnter(L2Npc npc, L2PcInstance player, boolean isPet)
	{
		InstanceWorld tmpworld = InstanceManager.getInstance().getWorld(player.getInstanceId());
		if (tmpworld instanceof SIGNSWorld)
		{
			if (npc.getNpcId() == 27371)
			{
				((L2Attackable) npc).abortAttack();
				npc.setTarget(player);
				npc.setIsRunning(true);
				npc.getAI().setIntention(CtrlIntention.AI_INTENTION_ATTACK, player);
				npc.broadcastPacket(new NpcSay(npc.getObjectId(), 0, npc.getNpcId(), "�o�̥��ӬO�ݩ�u�Y�k�����C"));
			}
			if (npc.getNpcId() == 27372)
			{
				((L2Attackable) npc).abortAttack();
				npc.setTarget(player);
				npc.setIsRunning(true);
				npc.getAI().setIntention(CtrlIntention.AI_INTENTION_ATTACK, player);
				npc.broadcastPacket(new NpcSay(npc.getObjectId(), 0, npc.getNpcId(), "�O�ִ��i�ӳo�̡H�I"));
			}
			if (npc.getNpcId() == 27373 || npc.getNpcId() == 27379)
			{
				((L2Attackable) npc).abortAttack();
				npc.setTarget(player);
				npc.setIsRunning(true);
				npc.getAI().setIntention(CtrlIntention.AI_INTENTION_ATTACK, player);
				npc.broadcastPacket(new NpcSay(npc.getObjectId(), 0, npc.getNpcId(), "�x�Ī��å�u�X�h�A�i�����å�ĹL�ӧa�I"));
			}
			if (npc.getNpcId() == 27377)
			{
				((L2Attackable) npc).abortAttack();
				npc.setTarget(player);
				npc.setIsRunning(true);
				npc.getAI().setIntention(CtrlIntention.AI_INTENTION_ATTACK, player);
				npc.broadcastPacket(new NpcSay(npc.getObjectId(), 0, npc.getNpcId(), "�������}�o�̡I"));
			}
			if (npc.getNpcId() == 27378)
			{
				((L2Attackable) npc).abortAttack();
				npc.setTarget(player);
				npc.setIsRunning(true);
				npc.getAI().setIntention(CtrlIntention.AI_INTENTION_ATTACK, player);
				npc.broadcastPacket(new NpcSay(npc.getObjectId(), 0, npc.getNpcId(), "�O�ִ��i�ӳo�̡H�I"));
			}
		}
		return null;
	}
	
	protected void runStartRoom(SIGNSWorld world)
	{
		world.status = 0;
		SIGNSRoom StartRoom = new SIGNSRoom();
		SIGNSNpc thisnpc;
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(SHUNAIMAN, -89456, 216184, -7504, 40960, false, 0, false, world.instanceId);
		StartRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(LEON, -89400, 216125, -7504, 40960, false, 0, false, world.instanceId);
		StartRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(DISCIPLES_GK, -84385, 216117, -7497, 0, false, 0, false, world.instanceId);
		StartRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(MAGICAN, -84945, 220643, -7495, 0, false, 0, false, world.instanceId);
		StartRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(MAGICAN, -89563, 220647, -7491, 0, false, 0, false, world.instanceId);
		StartRoom.npcList.add(thisnpc);
		
		world.rooms.put("StartRoom", StartRoom);
		if (debug)
			_log.info("SevenSignSealOfTheEmperor: first room spawned in instance " + world.instanceId);
	}
	
/**
 * Room1 Mobs 27371 27372 27373 27374
 */
	protected void runFirstRoom(SIGNSWorld world)
	{
		SIGNSRoom FirstRoom = new SIGNSRoom();
		SIGNSNpc thisnpc;
		thisnpc = new SIGNSNpc();
		thisnpc.isDead = false;
		thisnpc.npc = addSpawn(27371,-89049, 217979, -7495, 0, false, 0, false, world.instanceId);
		FirstRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27372,-89049, 217979, -7495, 0, false, 0, false, world.instanceId);
		FirstRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27373,-89049, 217979, -7495, 0, false, 0, false, world.instanceId);
		FirstRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27374,-89049, 217979, -7495, 0, false, 0, false, world.instanceId);
		FirstRoom.npcList.add(thisnpc);
		
		world.rooms.put("FirstRoom", FirstRoom);
		world.status = 1;

		if (debug)
			_log.info("SevenSignSealOfTheEmperor: spawned First room");
	}
	
/**
 * Room2 Mobs 27371 27371 27372 27373 27373 27374
 */
	protected void runSecondRoom(SIGNSWorld world)
	{
		SIGNSRoom SecondRoom = new SIGNSRoom();
		SIGNSNpc thisnpc;
		thisnpc = new SIGNSNpc();
		thisnpc.isDead = false;
		thisnpc.npc = addSpawn(27371, -88599, 220071, -7495, 0, false, 0, false, world.instanceId);
		SecondRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27371, -88599, 220071, -7495, 0, false, 0, false, world.instanceId);
		SecondRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27372, -88599, 220071, -7495, 0, false, 0, false, world.instanceId);
		SecondRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27373, -88599, 220071, -7495, 0, false, 0, false, world.instanceId);
		SecondRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27373, -88599, 220071, -7495, 0, false, 0, false, world.instanceId);
		SecondRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27374, -88599, 220071, -7495, 0, false, 0, false, world.instanceId);
		SecondRoom.npcList.add(thisnpc);
		
		world.rooms.put("SecondRoom", SecondRoom);
		world.status = 2;
		
		if (debug)
			_log.info("SevenSignSealOfTheEmperor: spawned second room");
	}
	
/**
 * Room3 Mobs 27371 27371 27372 27372 27373 27373 27374 27374
 */
	protected void runThirdRoom(SIGNSWorld world)
	{
		SIGNSRoom ThirdRoom = new SIGNSRoom();
		SIGNSNpc thisnpc;
		thisnpc = new SIGNSNpc();
		thisnpc.isDead = false;
		thisnpc.npc = addSpawn(27371, -86846, 220639, -7495, 0, false, 0, false, world.instanceId);
		ThirdRoom .npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27371, -86846, 220639, -7495, 0, false, 0, false, world.instanceId);
		ThirdRoom .npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27372, -86846, 220639, -7495, 0, false, 0, false, world.instanceId);
		ThirdRoom .npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27372, -86846, 220639, -7495, 0, false, 0, false, world.instanceId);
		ThirdRoom .npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27373, -86846, 220639, -7495, 0, false, 0, false, world.instanceId);
		ThirdRoom .npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27373, -86846, 220639, -7495, 0, false, 0, false, world.instanceId);
		ThirdRoom .npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27374, -86846, 220639, -7495, 0, false, 0, false, world.instanceId);
		ThirdRoom .npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27374, -86846, 220639, -7495, 0, false, 0, false, world.instanceId);
		ThirdRoom .npcList.add(thisnpc);
		
		world.rooms.put("ThirdRoom", ThirdRoom);
		world.status = 3;
		
		if (debug)
			_log.info("SevenSignSealOfTheEmperor: spawned Third room");
	}
	
/**
 * Room4 Mobs 27371 27372 27373 27374 27375 27377 27378 27379
 */
	protected void runForthRoom(SIGNSWorld world)
	{
		SIGNSRoom ForthRoom = new SIGNSRoom();
		SIGNSNpc thisnpc;
		thisnpc = new SIGNSNpc();
		thisnpc.isDead = false;
		thisnpc.npc = addSpawn(27371, -85463, 219227, -7495, 0, false, 0, false, world.instanceId);
		ForthRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27372, -85463, 219227, -7495, 0, false, 0, false, world.instanceId);
		ForthRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27373, -85463, 219227, -7495, 0, false, 0, false, world.instanceId);
		ForthRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27374, -85463, 219227, -7495, 0, false, 0, false, world.instanceId);
		ForthRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27375, -85463, 219227, -7495, 0, false, 0, false, world.instanceId);
		ForthRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27377, -85463, 219227, -7495, 0, false, 0, false, world.instanceId);
		ForthRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27378, -85463, 219227, -7495, 0, false, 0, false, world.instanceId);
		ForthRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27379, -85463, 219227, -7495, 0, false, 0, false, world.instanceId);
		ForthRoom.npcList.add(thisnpc);
		
		world.rooms.put("ForthRoom", ForthRoom);
		world.status = 4;
		
		if (debug)
			_log.info("SevenSignSealOfTheEmperor: spawned Forth room");
	}
	
/**
 * Room5 Mobs 27371 27372 27373 27374 27375 27375 27377 27377 27378 27378 27379 27379
 */
	protected void runFifthRoom(SIGNSWorld world)
	{
		SIGNSRoom FifthRoom = new SIGNSRoom();
		SIGNSNpc thisnpc;
		thisnpc = new SIGNSNpc();
		thisnpc.isDead = false;
		thisnpc.npc = addSpawn(27371, -87441, 217623, -7495, 0, false, 0, false, world.instanceId);
		FifthRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27372, -87441, 217623, -7495, 0, false, 0, false, world.instanceId);
		FifthRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27373, -87441, 217623, -7495, 0, false, 0, false, world.instanceId);
		FifthRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27374, -87441, 217623, -7495, 0, false, 0, false, world.instanceId);
		FifthRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27375, -87441, 217623, -7495, 0, false, 0, false, world.instanceId);
		FifthRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27375, -87441, 217623, -7495, 0, false, 0, false, world.instanceId);
		FifthRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27377, -87441, 217623, -7495, 0, false, 0, false, world.instanceId);
		FifthRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27377, -87441, 217623, -7495, 0, false, 0, false, world.instanceId);
		FifthRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27378, -87441, 217623, -7495, 0, false, 0, false, world.instanceId);
		FifthRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27378, -87441, 217623, -7495, 0, false, 0, false, world.instanceId);
		FifthRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27379, -87441, 217623, -7495, 0, false, 0, false, world.instanceId);
		FifthRoom.npcList.add(thisnpc);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(27379, -87441, 217623, -7495, 0, false, 0, false, world.instanceId);
		FifthRoom.npcList.add(thisnpc);
		
		world.rooms.put("FifthRoom", FifthRoom);
		world.status = 5;
		
		if (debug)
			_log.info("SevenSignSealOfTheEmperor: spawned Fifth room");
	}
	
	protected void runBossRoom(SIGNSWorld world)
	{
		SIGNSRoom BossRoom = new SIGNSRoom();
		SIGNSNpc thisnpc;
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(LILITH, -83175, 217021, -7504, 0, false, 0, false, world.instanceId);
		BossRoom.npcList.add(thisnpc);
		if (noRndWalk)
			thisnpc.npc.setIsNoRndWalk(true);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(LILITH_GUARD0, -83127, 217056, -7504, 0, false, 0, false, world.instanceId);
		BossRoom.npcList.add(thisnpc);
		if (noRndWalk)
			thisnpc.npc.setIsNoRndWalk(true);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(LILITH_GUARD1, -83222, 217055, -7504, 0, false, 0, false, world.instanceId);
		BossRoom.npcList.add(thisnpc);
		if (noRndWalk)
			thisnpc.npc.setIsNoRndWalk(true);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(ANAKIM, -83179, 216479, -7504, 0, false, 0, false, world.instanceId);
		BossRoom.npcList.add(thisnpc);
		if (noRndWalk)
			thisnpc.npc.setIsNoRndWalk(true);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(ANAKIM_GUARD0, -83227, 216443, -7504, 0, false, 0, false, world.instanceId);
		BossRoom.npcList.add(thisnpc);
		if (noRndWalk)
			thisnpc.npc.setIsNoRndWalk(true);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(ANAKIM_GUARD1, -83134, 216443, -7504, 0, false, 0, false, world.instanceId);
		BossRoom.npcList.add(thisnpc);
		if (noRndWalk)
			thisnpc.npc.setIsNoRndWalk(true);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(ANAKIM_GUARD2, -83179, 216432, -7504, 0, false, 0, false, world.instanceId);
		BossRoom.npcList.add(thisnpc);
		if (noRndWalk)
			thisnpc.npc.setIsNoRndWalk(true);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(SEALDEVICE, -83177, 217353, -7520, 32768, false, 0, false, world.instanceId);
		BossRoom.npcList.add(thisnpc);
		if (noRndWalk)
			thisnpc.npc.setIsNoRndWalk(true);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(SEALDEVICE, -83177, 216137, -7520, 32768, false, 0, false, world.instanceId);
		BossRoom.npcList.add(thisnpc);
		if (noRndWalk)
			thisnpc.npc.setIsNoRndWalk(true);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(SEALDEVICE, -82588, 216754, -7520, 32768, false, 0, false, world.instanceId);
		BossRoom.npcList.add(thisnpc);
		if (noRndWalk)
			thisnpc.npc.setIsNoRndWalk(true);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(SEALDEVICE, -83804, 216754, -7520, 32768, false, 0, false, world.instanceId);
		BossRoom.npcList.add(thisnpc);
		if (noRndWalk)
			thisnpc.npc.setIsNoRndWalk(true);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(32592, -83176, 216753, -7497, 0, false, 0, false, world.instanceId);
		BossRoom.npcList.add(thisnpc);
		if (noRndWalk)
			thisnpc.npc.setIsNoRndWalk(true);
		
		world.rooms.put("BossRoom", BossRoom);
		world.status = 6;
		if (debug)
			_log.info("SevenSignSealOfTheEmperor: spawned Boss room");
	}
	
	protected void runSDRoom(SIGNSWorld world)
	{
		SIGNSRoom SDRoom = new SIGNSRoom();
		SIGNSNpc thisnpc;
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(SEALDEVICE, -83177, 217353, -7520, 32768, false, 0, false, world.instanceId);
		SDRoom.npcList.add(thisnpc);
		if (noRndWalk)
			thisnpc.npc.setIsNoRndWalk(true);
			thisnpc.npc.setRHandId(15281);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(SEALDEVICE, -83177, 216137, -7520, 32768, false, 0, false, world.instanceId);
		SDRoom.npcList.add(thisnpc);
		if (noRndWalk)
			thisnpc.npc.setIsNoRndWalk(true);
			thisnpc.npc.setRHandId(15281);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(SEALDEVICE, -82588, 216754, -7520, 32768, false, 0, false, world.instanceId);
		SDRoom.npcList.add(thisnpc);
		if (noRndWalk)
			thisnpc.npc.setIsNoRndWalk(true);
			thisnpc.npc.setRHandId(15281);
		
		thisnpc = new SIGNSNpc();
		thisnpc.npc = addSpawn(SEALDEVICE, -83804, 216754, -7520, 32768, false, 0, false, world.instanceId);
		SDRoom.npcList.add(thisnpc);
		if (noRndWalk)
			thisnpc.npc.setIsNoRndWalk(true);
			thisnpc.npc.setRHandId(15281);
		
		world.rooms.put("SDRoom", SDRoom);
		if (debug)
			_log.info("SevenSignSealOfTheEmperor: spawned SD room");
	}
	
	protected boolean checkKillProgress(L2Npc npc, SIGNSRoom room)
	{
		boolean cont = true;
		for (SIGNSNpc npcobj : room.npcList)
		{
			if (npcobj.npc == npc)
				npcobj.isDead = true;
			if (npcobj.isDead == false)
				cont = false;
		}
		
		return cont;
	}
	
	private static final void teleportPlayer(L2PcInstance player, int[] coords, int instanceId)
	{
		removeBuffs(player);
		if (player.getPet() != null)
		{
			removeBuffs(player.getPet());
		}
		player.getAI().setIntention(CtrlIntention.AI_INTENTION_IDLE);
		player.setInstanceId(instanceId);
		player.teleToLocation(coords[0], coords[1], coords[2], true);
	}
	
	private static final void openDoor(int doorId, int instanceId)
	{
		for (L2DoorInstance door : InstanceManager.getInstance().getInstance(instanceId).getDoors())
			if (door.getDoorId() == doorId)
				door.openMe();
	}
	
	private final synchronized void enterInstance(L2PcInstance player)
	{
		InstanceWorld world = InstanceManager.getInstance().getPlayerWorld(player);
		if (world != null)
		{
			if (world.templateId != INSTANCE_ID)
			{
				player.sendPacket(SystemMessage.getSystemMessage(SystemMessageId.ALREADY_ENTERED_ANOTHER_INSTANCE_CANT_ENTER));
				return;
			}
			Instance inst = InstanceManager.getInstance().getInstance(world.instanceId);
			if (inst != null)
				teleportPlayer(player, TELEPORT, world.instanceId);
			return;
		}
		else
		{
			final int instanceId = InstanceManager.getInstance().createDynamicInstance("SanctumSealOfTheEmperor.xml");
			
			world = new SIGNSWorld();
			world.instanceId = instanceId;
			world.templateId = INSTANCE_ID;
			InstanceManager.getInstance().addWorld(world);
			((SIGNSWorld) world).storeTime[0] = System.currentTimeMillis();
			runStartRoom((SIGNSWorld) world);
			runFirstRoom((SIGNSWorld) world);
			world.allowed.add(player.getObjectId());
			teleportPlayer(player, TELEPORT, instanceId);
			
			_log.info("SevenSigns 5th epic quest " + instanceId + " created by player: " + player.getName());
		}
	}
	
	protected void exitInstance(L2PcInstance player)
	{
		player.setInstanceId(0);
		player.teleToLocation(171782, -17612, -4901);
	}
	
	@Override
	public String onAttack(L2Npc npc, L2PcInstance attacker, int damage, boolean isPet, L2Skill skill)
	{
		InstanceWorld tmpworld = InstanceManager.getInstance().getWorld(npc.getInstanceId());
		if (tmpworld instanceof SIGNSWorld)
		{
			SIGNSWorld world = (SIGNSWorld) tmpworld;
			
			if (world.status == 6 && npc.getNpcId() == SEALDEVICE)
			{
				npc.doCast(SkillTable.getInstance().getInfo(5980, 3));
			}
		}
		return super.onAttack(npc, attacker, damage, isPet, skill);
	}
	
	@Override
	public String onSkillSee(L2Npc npc, L2PcInstance caster, L2Skill skill, L2Object[] targets, boolean isPet)
	{
		InstanceWorld tmpworld = InstanceManager.getInstance().getWorld(npc.getInstanceId());
		if (tmpworld instanceof SIGNSWorld)
		{
			SIGNSWorld world = (SIGNSWorld) tmpworld;
			
			if (skill.getId() == EINHASAD_STRIKE && world.status == 6 && npc.getNpcId() == SEALDEVICE)
			{
				npc.doCast(SkillTable.getInstance().getInfo(5980, 3));
			}
		}
		return super.onSkillSee(npc, caster, skill, targets, isPet);
	}
	
	@Override
	public final String onAdvEvent(String event, L2Npc npc, L2PcInstance player)
	{
		QuestState st = player.getQuestState(qn);
		
		if (st == null)
			return "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>";
		
		if (event.equalsIgnoreCase("30969-05.htm"))
		{
			st.set("cond", "1");
			st.setState(State.STARTED);
			st.playSound("ItemSound.quest_accept");
		}
		else if (event.equalsIgnoreCase("32598-02.htm"))
		{
			st.giveItems(STAFF, 1);
			player.sendMessage("�Q�ήc���]�k�v���]�k�ΡA�ж}�Ҫ����]�k�v���ɪ����C");  // �x�A�O(����r��)
			st.playSound("ItemSound.quest_middle");
		}
		else if (event.equalsIgnoreCase("30969-11.htm"))
		{
			st.set("cond", "6");
			st.playSound("ItemSound.quest_middle");
		
		}
		else if (event.equalsIgnoreCase("32584-05.htm"))
		{
			st.set("cond", "2");
			st.playSound("ItemSound.quest_middle");
			npc.deleteMe();
		}
		else if (event.equalsIgnoreCase("32586-06.htm"))
		{
			player.sendPacket(new ExShowScreenMessage("�ϥή���ĸt�C�������ި����Ѩ��c���������s�I",5000));  // �x�A�O(����r��)
			player.sendMessage("�ϥή���ĸt�C�������ި����Ѩ��c���������s�I");  // �x�A�O(����r��)
			player.sendMessage("�ϥή���ĸt����A�ж}�ҳ�¶���K�A�G�����C");  // �x�A�O(����r��)
			st.playSound("ItemSound.quest_middle");
			st.set("cond", "4");
			st.giveItems(SWORD, 1);
			st.giveItems(WATER, 1);
		}
		else if (event.equalsIgnoreCase("32586-12.htm"))
		{
			st.playSound("ItemSound.quest_middle");
			st.set("cond", "5");
			st.takeItems(SEAL, 4);
			st.takeItems(SWORD, 1);
			st.takeItems(WATER, 1);
			st.takeItems(STAFF, 1);
		}
		else if (event.equalsIgnoreCase("32593-02.htm"))
		{
			//st.addExpAndSp(52518015, 5817676);
			st.addExpAndSp(25000000, 2500000); // High Five
			st.unset("cond");
			st.setState(State.COMPLETED);
			st.exitQuest(false);
			st.playSound("ItemSound.quest_finish");
		}
		else if (event.equalsIgnoreCase("30969-06.htm"))
		{
			if (mammonst == 0)
			{
				mammonst = 1;
				L2Npc mammon = addSpawn(MAMMON, 109742, 219978, -3520, 0, false, 120000, true);
				mammon.broadcastPacket(new NpcSay(mammon.getObjectId(), 0, mammon.getNpcId(), "��...�O�֥l��ڰ]�I���ӤH��..."));
				st.startQuestTimer("despawn", 120000, mammon);
			}
			else
				return "<html><body>��ˮ����G<br>�{�b�ڥi�S����A���᪺�ɶ��I�I�I<br>�]��L�����a���b�i���ܡC�^</body></html>";
		}
		else if (event.equalsIgnoreCase("despawn"))
		{
			mammonst = 0;
			npc.broadcastPacket(new NpcSay(npc.getObjectId(), 0, npc.getNpcId(), "�P�ӫҤ��������[���w�ש�F���F..."));
			return null;
		}
		else if (event.equalsIgnoreCase("DOORS"))
		{
			InstanceWorld tmpworld = InstanceManager.getInstance().getWorld(npc.getInstanceId());
			if (tmpworld instanceof SIGNSWorld)
			{
				SIGNSWorld world = (SIGNSWorld) tmpworld;
				openDoor(DOOR, world.instanceId);
				for(int objId : world.allowed)
				{
					L2PcInstance pl = L2World.getInstance().getPlayer(objId);
					if (pl != null)
						pl.showQuestMovie(12);
						runBossRoom(world);
						player.sendMessage("���F��U�ȯǡA�Ұʨ��Ө�����������c�A�G���ӫҪ��ʦL�˸m�I�A�G�]�k���¤O�ܱj�A�ҥH�n�h�d���I");  // �x�A�O(����r��)
				}
				return null;
			}
		}
		else if (event.equalsIgnoreCase("Tele"))
		{
			player.teleToLocation(-89528, 216056, -7516);
			return null;
		}
		return event;
	}
	
	@Override
	public final String onTalk(L2Npc npc, L2PcInstance player)
	{
		final QuestState st = player.getQuestState(qn);
		final QuestState qs = player.getQuestState("195_SevenSignSecretRitualOfThePriests");
		
		if (st == null)
			return "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>";
		
		final int cond = st.getInt("cond");
		switch (npc.getNpcId())
		{
			case HEINE:
				switch (st.getState())
				{
					case State.CREATED:
						if (cond == 0 && player.getLevel() >= 79 && qs.getState() == State.COMPLETED)
							return "30969-01.htm";
						else
							st.exitQuest(true);
							return "30969-00.htm";
					case State.STARTED:
						switch (st.getInt("cond"))
						{
							case 1:
								return "30969-05.htm";
							case 2:
								st.set("cond", "3");
								st.playSound("ItemSound.quest_middle");
								return "30969-07.htm";
							case 3:
								return "30969-08.htm";
							case 4:
								return "30969-08.htm";
							case 5:
								return "30969-09.htm";
							case 6:
								return "30969-12.htm";
						}
					case State.COMPLETED:
						return "<html><body>�o�O�w�g���������ȡC</body></html>";
				}
			case WOOD:
				if (cond == 6)
					return "32593-01.htm";
				else if (st.getState() == State.COMPLETED)
					return "<html><body>�o�O�w�g���������ȡC</body></html>";
			case MAMMON:
				switch (st.getInt("cond"))
				{
					case 1:
						return "32584-01.htm";
				}
			case PROMICE_OF_MAMMON:
				switch (st.getInt("cond"))
				{
					case 0:
						return null;
					case 1:
						return null;
					case 2:
						return null;
					case 3:
						enterInstance(player);
						return null;
					case 4:
						enterInstance(player);
						return null;
					case 5:
						return null;
					case 6:
						return null;
				}
			case MAGICAN:
				switch (st.getInt("cond"))
				{
					case 4:
						if (st.getQuestItemsCount(STAFF) == 0)
						{
							player.sendMessage("�Q�ήc���]�k�v���]�k�ΡA�ж}�Ҫ����]�k�v���ɪ����C");  // �x�A�O(����r��)
							return "32598-01.htm";
						}
						if (st.getQuestItemsCount(STAFF) >= 1)
						{
							player.sendMessage("�Q�ήc���]�k�v���]�k�ΡA�ж}�Ҫ����]�k�v���ɪ����C");  // �x�A�O(����r��)
							return "32598-03.htm";
						}
				}
			case SHUNAIMAN:
				switch (st.getInt("cond"))
				{
					case 3:
						return "32586-01.htm";
					case 4:
						if (st.getQuestItemsCount(SWORD) == 0)
						{
							player.sendMessage("�ϥή���ĸt�C�������ި����Ѩ��c���������s�I");  // �x�A�O(����r��)
							player.sendMessage("�ϥή���ĸt����A�ж}�ҳ�¶���K�A�G�����C");  // �x�A�O(����r��)
							st.giveItems(SWORD, 1);
							return "32586-14.htm";
						}
						if (st.getQuestItemsCount(WATER) == 0)
						{
							player.sendMessage("�ϥή���ĸt�C�������ި����Ѩ��c���������s�I");  // �x�A�O(����r��)
							player.sendMessage("�ϥή���ĸt����A�ж}�ҳ�¶���K�A�G�����C");  // �x�A�O(����r��)
							st.giveItems(WATER, 1);
							return "32586-14.htm";
						}
						if (st.getQuestItemsCount(SEAL) <= 3)
						{
							player.sendPacket(new ExShowScreenMessage("�ϥή���ĸt�C�������ި����Ѩ��c���������s�I",5000));  // �x�A�O(����r��)
							player.sendMessage("�ϥή���ĸt�C�������ި����Ѩ��c���������s�I");  // �x�A�O(����r��)
							player.sendMessage("�ϥή���ĸt����A�ж}�ҳ�¶���K�A�G�����C");  // �x�A�O(����r��)
							return "32586-07.htm";
						}
						else if (st.getQuestItemsCount(SEAL) == 4)
							return "32586-08.htm";
					case 5:
						return "32586-13.htm";
				}
			case DISCIPLES_GK:
				switch (st.getInt("cond"))
				{
					case 4:
						return "32657-01.htm";
				}
			case LEON:
				switch (st.getInt("cond"))
				{
					case 3:
						exitInstance(player);
						return "32587-02.htm";
					case 4:
						exitInstance(player);
						return "32587-02.htm";
					case 5:
						exitInstance(player);
						return "32587-02.htm";
				}
		
		}
		return "<html><body>�ثe�S��������ȡA�α��󤣲šC</body></html>";
	}
	
	@Override
	public final String onKill(L2Npc npc, L2PcInstance player, boolean isPet)
	{
		QuestState st = player.getQuestState(qn);
		
		InstanceWorld tmpworld = InstanceManager.getInstance().getWorld(npc.getInstanceId());
		SIGNSWorld world;
		
		if (st == null)
			return null;
		
		if (tmpworld instanceof SIGNSWorld)
		{
			world = (SIGNSWorld)tmpworld;
			if (npc.getNpcId() == 27371)
			{
				npc.broadcastPacket(new NpcSay(npc.getObjectId(), 0, npc.getNpcId(), "���F�u�Y�I"));
			}
			else if (npc.getNpcId() == 27372)
			{
				npc.broadcastPacket(new NpcSay(npc.getObjectId(), 0, npc.getNpcId(), "�u�Y�k��...�o�ӥ���...�`���@��...�ڷ|����..."));
			}
			else if (npc.getNpcId() == 27373)
			{
				npc.broadcastPacket(new NpcSay(npc.getObjectId(), 0, npc.getNpcId(), "������ê�ڭ̩O�H"));
			}
			else if (npc.getNpcId() == 27377)
			{
				npc.broadcastPacket(new NpcSay(npc.getObjectId(), 0, npc.getNpcId(), "���F�u�Y�I"));
			}
			else if (npc.getNpcId() == 27378)
			{
				npc.broadcastPacket(new NpcSay(npc.getObjectId(), 0, npc.getNpcId(), "�u�Y�k��...�o�ӥ���...�`���@��...�ڷ|����..."));
			}
			else if (npc.getNpcId() == 27379)
			{
				npc.broadcastPacket(new NpcSay(npc.getObjectId(), 0, npc.getNpcId(), "������ê�ڭ̩O�H"));
			}
			
			if (world.status == 1)
			{
				if (checkKillProgress(npc, world.rooms.get("FirstRoom")))
				{
					runSecondRoom(world);
					openDoor(DOOR2, world.instanceId);
				}
			}
			else if (world.status == 2)
			{
				if (checkKillProgress(npc, world.rooms.get("SecondRoom")))
				{
					runThirdRoom(world);
					openDoor(DOOR4, world.instanceId);
				}
			}
			else if (world.status == 3)
			{
				if (checkKillProgress(npc, world.rooms.get("ThirdRoom")))
				{
					runForthRoom(world);
					openDoor(DOOR6, world.instanceId);
				}
			}
			else if (world.status == 4)
			{
				if (checkKillProgress(npc, world.rooms.get("ForthRoom")))
				{
					runFifthRoom(world);
					openDoor(DOOR8, world.instanceId);
				}
			}
			else if (world.status == 5)
			{
				if (checkKillProgress(npc, world.rooms.get("FifthRoom")))
				{
					openDoor(DOOR10, world.instanceId);
				}
			}
			else if (world.status == 6)
			{
				if (npc.getNpcId() == SEALDEVICE)
				{
					if (st.getQuestItemsCount(SEAL) < 3)
					{
						player.sendMessage("�ʦL�˸m���o���~��}�l�B�@�F�C�w�g�b���`�B�@�I");  // �x�A�O(����r��)
						npc.setRHandId(15281);
						st.playSound("ItemSound.quest_itemget");
						st.giveItems(SEAL, 1);
					}
					else
					{
						player.sendMessage("�ʦL�˸m���o���~��}�l�B�@�F�C�w�g�b���`�B�@�I");  // �x�A�O(����r��)
						npc.setRHandId(15281);
						st.giveItems(SEAL, 1);
						st.playSound("ItemSound.quest_middle");
						runSDRoom(world);
						player.showQuestMovie(13);
						startQuestTimer("Tele", 26000, null, player);
					}
				}
			}
		}
		return "";
	}
	
	public Q196_SevenSignSealOfTheEmperor(int questId, String name, String descr)
	{
		super(questId, name, descr);
		
		addStartNpc(HEINE);
		addStartNpc(PROMICE_OF_MAMMON);
		
		addSkillSeeId(SEALDEVICE);
		addAttackId(SEALDEVICE);
		
		for (int i : NPCS)
			addTalkId(i);
		
		for (int mob : TOKILL )
			addKillId(mob);
		
		for (int mob1 : TOCHAT )
			addAggroRangeEnterId(mob1);
		
		questItemIds = new int[]
		{ SWORD, WATER, SEAL, STAFF };
	}
	
	public static void main(String[] args)
	{
		new Q196_SevenSignSealOfTheEmperor(196, qn, "�C�ʦL�A�ӫҪ��ʦL");
	}
}