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
package handlers.skillhandlers;

import java.util.logging.Logger;

import net.sf.l2j.Config;
import net.sf.l2j.gameserver.ai.CtrlIntention;
import net.sf.l2j.gameserver.datatables.SkillTable;
import net.sf.l2j.gameserver.handler.ISkillHandler;
import net.sf.l2j.gameserver.lib.Log;
import net.sf.l2j.gameserver.model.L2Effect;
import net.sf.l2j.gameserver.model.L2ItemInstance;
import net.sf.l2j.gameserver.model.L2Object;
import net.sf.l2j.gameserver.model.L2Skill;
import net.sf.l2j.gameserver.model.actor.L2Character;
import net.sf.l2j.gameserver.model.actor.L2Npc;
import net.sf.l2j.gameserver.model.actor.instance.L2PcInstance;
import net.sf.l2j.gameserver.network.SystemMessageId;
import net.sf.l2j.gameserver.network.serverpackets.SystemMessage;
import net.sf.l2j.gameserver.skills.Env;
import net.sf.l2j.gameserver.skills.Formulas;
import net.sf.l2j.gameserver.templates.item.L2WeaponType;
import net.sf.l2j.gameserver.templates.skills.L2SkillType;

/**
 * This class ...
 *
 * @version $Revision: 1.1.2.7.2.16 $ $Date: 2005/04/06 16:13:49 $
 */

public class Pdam implements ISkillHandler
{
	private static Logger _log = Logger.getLogger(Pdam.class.getName());
	
	private static final L2SkillType[] SKILL_IDS =
	{
		L2SkillType.PDAM, L2SkillType.FATAL, L2SkillType.DEATHLINK_PDAM
	};
	
	/**
	 * 
	 * @see net.sf.l2j.gameserver.handler.ISkillHandler#useSkill(net.sf.l2j.gameserver.model.actor.L2Character, net.sf.l2j.gameserver.model.L2Skill, net.sf.l2j.gameserver.model.L2Object[])
	 */
	public void useSkill(L2Character activeChar, L2Skill skill, L2Object[] targets)
	{
		if (activeChar.isAlikeDead())
			return;
		
		int damage = 0;
		
		if (Config.DEBUG)
		{
			_log.fine("Begin Skill processing in Pdam.java " + skill.getSkillType());
		}
		
		L2ItemInstance weapon = activeChar.getActiveWeaponInstance();
		boolean soul = (weapon != null && weapon.getChargedSoulshot() == L2ItemInstance.CHARGED_SOULSHOT && weapon.getItemType() != L2WeaponType.DAGGER);
		
		for (L2Character target: (L2Character[]) targets)
		{
			
			if (activeChar instanceof L2PcInstance && target instanceof L2PcInstance && ((L2PcInstance)target).isFakeDeath())
			{
				target.stopFakeDeath(null);
			}
			else if (target.isDead())
				continue;
			
			boolean dual = activeChar.isUsingDualWeapon();
			byte shld = Formulas.calcShldUse(activeChar, target, skill);
			// PDAM critical chance not affected by buffs, only by STR. Only some skills are meant to crit.
			boolean crit = false;
			if (skill.getBaseCritRate() > 0)
				crit = Formulas.calcCrit(skill.getBaseCritRate() * 10 * Formulas.getSTRBonus(activeChar), target);
			
			
			if (!crit && (skill.getCondition() & L2Skill.COND_CRIT) != 0)
				damage = 0;
			else
				damage = (int) Formulas.calcPhysDam(activeChar, target, skill, shld, false, dual, soul);
			
            if (skill.getSkillType() == L2SkillType.DEATHLINK_PDAM || skill.getSkillType() == L2SkillType.FATAL)   
            {   
                 double cur = 2*activeChar.getCurrentHp();   
                 double max = activeChar.getMaxHp();   
                 if (cur<max)   
                      damage *= Math.sqrt(max/cur);   
                 else damage *= Math.pow(max/cur, 4);   
            }
            
			if (skill.getMaxSoulConsumeCount() > 0 && activeChar instanceof L2PcInstance && ((L2PcInstance) activeChar).getSouls() > 0)
			{
				switch (((L2PcInstance) activeChar).getSouls())
				{
					case 1:
						damage *= 1.10;
						break;
					case 2:
						damage *= 1.12;
						break;
					case 3:
						damage *= 1.15;
						break;
					case 4:
						damage *= 1.18;
						break;
					default:
						damage *= 1.20;
						break;
				}
			}
			if (crit)
				damage *= 2; // PDAM Critical damage always 2x and not affected by buffs
				
			
			final boolean skillIsEvaded = Formulas.calcPhysicalSkillEvasion(target, skill);
			final byte reflect = Formulas.calcSkillReflect(target, skill);
			
			if (!skillIsEvaded)
			{
				if (damage > 0)
				{
					activeChar.sendDamageMessage(target, damage, false, crit, false);
				
					if (skill.hasEffects())
					{
						if ((reflect & Formulas.SKILL_REFLECT_SUCCEED) != 0)
						{
							activeChar.stopSkillEffects(skill.getId());
							skill.getEffects(target, activeChar);
							SystemMessage sm = new SystemMessage(SystemMessageId.YOU_FEEL_S1_EFFECT);
							sm.addSkillName(skill);
							activeChar.sendPacket(sm);
						}
						else
						{
							// activate attacked effects, if any
							target.stopSkillEffects(skill.getId());
							if (Formulas.calcSkillSuccess(activeChar, target, skill, shld, false, false, true))
							{
								skill.getEffects(activeChar, target, new Env(shld, false, false, false));
							
								SystemMessage sm = new SystemMessage(SystemMessageId.YOU_FEEL_S1_EFFECT);
								sm.addSkillName(skill);
								target.sendPacket(sm);
							}
							else
							{
								SystemMessage sm = new SystemMessage(SystemMessageId.C1_RESISTED_YOUR_S2);
								sm.addCharName(target);
								sm.addSkillName(skill);
								activeChar.sendPacket(sm);
							}
						}
					
						if (Config.LOG_GAME_DAMAGE && damage > 5000 && activeChar instanceof L2PcInstance)
						{
							String name = "";
							if (target.isRaid())
								name = "RaidBoss ";
							if (target instanceof L2Npc)
								name += target.getName() + "(" + ((L2Npc) target).getTemplate().npcId + ")";
							if (target instanceof L2PcInstance)
								name = target.getName() + "(" + target.getObjectId() + ") ";
							name += target.getLevel() + " lvl";
							Log.add(activeChar.getName() + "(" + activeChar.getObjectId() + ") " + activeChar.getLevel() + " lvl did damage " + damage + " with skill " + skill.getName() + "(" + skill.getId() + ") to " + name, "damage_pdam");
						}
					}
				
					// Possibility of a lethal strike
					boolean lethal = Formulas.calcLethalHit(activeChar, target, skill);
				
					// Make damage directly to HP
					if (!lethal && skill.getDmgDirectlyToHP())
					{
						final L2Character[] ts = {target, activeChar};
						
						/*
						 * This loop iterates over previous array but, if skill damage is not reflected
						 * it stops on first iteration (target) and misses activeChar
						 */
						for (L2Character targ : ts)
						{
							if (targ instanceof L2PcInstance)
							{
								L2PcInstance player = (L2PcInstance) targ;
								if (!player.isInvul())
								{
									if (damage >= player.getCurrentHp())
									{
										if (player.isInDuel())
											player.setCurrentHp(1);
										else
										{
											player.setCurrentHp(0);
											if (player.isInOlympiadMode())
											{
												player.abortAttack();
												player.abortCast();
												player.getStatus().stopHpMpRegeneration();
												player.setIsDead(true);
												player.setIsPendingRevive(true);
												if (player.getPet() != null)
													player.getPet().getAI().setIntention(CtrlIntention.AI_INTENTION_IDLE,null);
											}
											else
												player.doDie(activeChar);
										}
									}
									else
										player.setCurrentHp(player.getCurrentHp()- damage);
								}

								SystemMessage smsg = new SystemMessage(SystemMessageId.C1_RECEIVED_DAMAGE_OF_S3_FROM_C2);
								smsg.addPcName(player);
								smsg.addCharName(activeChar);
								smsg.addNumber(damage);
								player.sendPacket(smsg);

							}
							else
								target.reduceCurrentHp(damage, activeChar, skill);
							
							if ((reflect & Formulas.SKILL_REFLECT_VENGEANCE) == 0) // stop if no vengeance, so only target will be effected
								break;
						}
					}
					else
					{
						target.reduceCurrentHp(damage, activeChar, skill);
						
						// vengeance reflected damage
						if ((reflect & Formulas.SKILL_REFLECT_VENGEANCE) != 0)
							activeChar.reduceCurrentHp(damage, target, skill);
					}
				
				}
				else // No - damage
				{
					activeChar.sendPacket(new SystemMessage(SystemMessageId.ATTACK_FAILED));
				}
			}
			else
			{
				if (activeChar instanceof L2PcInstance)
				{
					SystemMessage sm = new SystemMessage(SystemMessageId.C1_DODGES_ATTACK);
					sm.addString(target.getName());
					((L2PcInstance) activeChar).sendPacket(sm);
				}
				if (target instanceof L2PcInstance)
				{
					SystemMessage sm = new SystemMessage(SystemMessageId.AVOIDED_C1_ATTACK);
					sm.addString(activeChar.getName());
					((L2PcInstance) target).sendPacket(sm);
				}
				
				// Possibility of a lethal strike despite skill is evaded
				Formulas.calcLethalHit(activeChar, target, skill);
			}
			
			if (activeChar instanceof L2PcInstance)
			{
				L2Skill soulmastery = SkillTable.getInstance().getInfo(467, ((L2PcInstance) activeChar).getSkillLevel(467));
				if (soulmastery != null)
				{
					if (((L2PcInstance) activeChar).getSouls() < soulmastery.getNumSouls())
					{
						int count = 0;
					
						if (((L2PcInstance) activeChar).getSouls() + skill.getNumSouls() <= soulmastery.getNumSouls())
							count = skill.getNumSouls();
						else
							count = soulmastery.getNumSouls() - ((L2PcInstance) activeChar).getSouls();
						((L2PcInstance) activeChar).increaseSouls(count);
					}
					else
					{
						SystemMessage sm = new SystemMessage(SystemMessageId.SOUL_CANNOT_BE_INCREASED_ANYMORE);
						((L2PcInstance) activeChar).sendPacket(sm);
					}
				}
			}
			//self Effect :]
			L2Effect effect = activeChar.getFirstEffect(skill.getId());
			if (effect != null && effect.isSelfEffect())
			{
				//Replace old effect with new one.
				effect.exit();
			}
			skill.getEffectsSelf(activeChar);
			
			if (skill.isSuicideAttack())
				activeChar.doDie(activeChar);
		}
		
		if (soul && weapon != null)
			weapon.setChargedSoulshot(L2ItemInstance.CHARGED_NONE);
	}
	
	/**
	 * 
	 * @see net.sf.l2j.gameserver.handler.ISkillHandler#getSkillIds()
	 */
	public L2SkillType[] getSkillIds()
	{
		return SKILL_IDS;
	}
}
