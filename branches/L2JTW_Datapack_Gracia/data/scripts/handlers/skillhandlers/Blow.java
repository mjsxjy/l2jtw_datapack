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

import java.util.logging.Level;
import java.util.logging.LogRecord;
import java.util.logging.Logger;

import com.l2jserver.Config;
import com.l2jserver.gameserver.ai.CtrlIntention;
import com.l2jserver.gameserver.handler.ISkillHandler;
import com.l2jserver.gameserver.model.L2Effect;
import com.l2jserver.gameserver.model.L2ItemInstance;
import com.l2jserver.gameserver.model.L2Object;
import com.l2jserver.gameserver.model.L2Skill;
import com.l2jserver.gameserver.model.actor.L2Character;
import com.l2jserver.gameserver.model.actor.L2Playable;
import com.l2jserver.gameserver.model.actor.L2Summon;
import com.l2jserver.gameserver.model.actor.instance.L2PcInstance;
import com.l2jserver.gameserver.model.actor.instance.L2SummonInstance;
import com.l2jserver.gameserver.network.SystemMessageId;
import com.l2jserver.gameserver.network.serverpackets.SystemMessage;
import com.l2jserver.gameserver.skills.BaseStats;
import com.l2jserver.gameserver.skills.Env;
import com.l2jserver.gameserver.skills.Formulas;
import com.l2jserver.gameserver.skills.Stats;
import com.l2jserver.gameserver.skills.funcs.Func;
import com.l2jserver.gameserver.templates.item.L2WeaponType;
import com.l2jserver.gameserver.templates.skills.L2SkillType;
import com.l2jserver.gameserver.util.Util;


/**
 *
 * @author  Steuf
 */
public class Blow implements ISkillHandler
{
	private static final Logger _logDamage = Logger.getLogger("damage");

	private static final L2SkillType[] SKILL_IDS =
	{
		L2SkillType.BLOW
	};
	
	public final static byte FRONT = 50;
	public final static byte SIDE = 60;
	public final static byte BEHIND = 70;
	
	public void useSkill(L2Character activeChar, L2Skill skill, L2Object[] targets)
	{
		if (activeChar.isAlikeDead())
			return;
		for (L2Character target: (L2Character[]) targets)
		{
			//Update by rocknow-Start
			if (activeChar.CRIT_ATTACK == 1)
			/*
			if (target.isAlikeDead())
				continue;
			
			// Check firstly if target dodges skill
			final boolean skillIsEvaded = Formulas.calcPhysicalSkillEvasion(target, skill);
			
			byte _successChance = SIDE;
			
			if (activeChar.isBehindTarget())
				_successChance = BEHIND;
			else if (activeChar.isInFrontOfTarget())
				_successChance = FRONT;
			
			
			//If skill requires Crit or skill requires behind,
			//calculate chance based on DEX, Position and on self BUFF
			boolean success = true;
			if ((skill.getCondition() & L2Skill.COND_BEHIND) != 0)
				success = (_successChance == BEHIND);
			if ((skill.getCondition() & L2Skill.COND_CRIT) != 0)
				success = (success && Formulas.calcBlow(activeChar, target, _successChance));
			if (!skillIsEvaded && success)
			*/
			//Update by rocknow-End
			{
				final byte reflect = Formulas.calcSkillReflect(target, skill);
				
				if (skill.hasEffects())
				{
					if (reflect == Formulas.SKILL_REFLECT_SUCCEED)
					{
						activeChar.stopSkillEffects(skill.getId());
						skill.getEffects(target, activeChar);
						SystemMessage sm = new SystemMessage(SystemMessageId.YOU_FEEL_S1_EFFECT);
						sm.addSkillName(skill);
						activeChar.sendPacket(sm);
					}
					else
					{
						final byte shld = Formulas.calcShldUse(activeChar, target, skill);
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
				}
				L2ItemInstance weapon = activeChar.getActiveWeaponInstance();
				boolean soul = (weapon != null && weapon.getChargedSoulshot() == L2ItemInstance.CHARGED_SOULSHOT && (weapon.getItemType() == L2WeaponType.DAGGER || weapon.getItemType() == L2WeaponType.DUAL_DAGGER || weapon.getItemType() == L2WeaponType.RAPIER));
				byte shld = Formulas.calcShldUse(activeChar, target, skill);
				
				// Crit rate base crit rate for skill, modified with STR bonus
				boolean crit = false;
				if (Formulas.calcCrit(skill.getBaseCritRate() * 10 * BaseStats.STR.calcBonus(activeChar), target))
					crit = true;
				double damage = (int) Formulas.calcBlowDamage(activeChar, target, skill, shld, soul);
				if (skill.getMaxSoulConsumeCount() > 0 && activeChar instanceof L2PcInstance)
				{
					switch (((L2PcInstance) activeChar).getSouls())
					{
						case 0:
							break;
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
				{
					damage *= 2;
					// Vicious Stance is special after C5, and only for BLOW skills
					// Adds directly to damage
					L2Effect vicious = activeChar.getFirstEffect(312);
					if (vicious != null && damage > 1)
					{
						for (Func func : vicious.getStatFuncs())
						{
							Env env = new Env();
							env.player = activeChar;
							env.target = target;
							env.skill = skill;
							env.value = damage;
							func.calc(env);
							damage = (int) env.value;
						}
					}
				}
				
				if (soul)
					weapon.setChargedSoulshot(L2ItemInstance.CHARGED_NONE);

				if (Config.LOG_GAME_DAMAGE
						&& activeChar instanceof L2Playable
						&& damage > Config.LOG_GAME_DAMAGE_THRESHOLD)
				{
					LogRecord record = new LogRecord(Level.INFO, "");
					record.setParameters(new Object[]{activeChar, " did damage ", (int)damage, skill, " to ", target});
					record.setLoggerName("pdam");
					_logDamage.log(record);
				}

				if (skill.getDmgDirectlyToHP() && target instanceof L2PcInstance)
				{
					final L2Character[] ts = {target, activeChar};
					
					/*
					 * This loop iterates over previous array but, if skill damage is not reflected
					 * it stops on first iteration (target) and misses activeChar
					 */
					for (L2Character targ : ts)
					{
						L2PcInstance player = (L2PcInstance) targ;
						if (!player.isInvul()) {
							// Check and calculate transfered damage
							L2Summon summon = player.getPet();
							if (summon instanceof L2SummonInstance && Util.checkIfInRange(900, player, summon, true))
							{
								int tDmg = (int) damage * (int) player.getStat().calcStat(Stats.TRANSFER_DAMAGE_PERCENT, 0, null, null) / 100;

								// Only transfer dmg up to current HP, it should
								// not be killed
								if (summon.getCurrentHp() < tDmg)
									tDmg = (int) summon.getCurrentHp() - 1;
								if (tDmg > 0)
								{
									summon.reduceCurrentHp(tDmg, activeChar, skill);
									damage -= tDmg;
								}
							}
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
								player.setCurrentHp(player.getCurrentHp() - damage);
						}
						SystemMessage smsg = new SystemMessage(SystemMessageId.C1_RECEIVED_DAMAGE_OF_S3_FROM_C2);
						smsg.addPcName(player);
						smsg.addCharName(activeChar);
						smsg.addNumber((int) damage);
						player.sendPacket(smsg);

						// stop if no vengeance, so only target will be effected
						if ((reflect & Formulas.SKILL_REFLECT_VENGEANCE) == 0) 
							break;
					} // end for
	        	} // end skill directlyToHp check
	        	else
	        	{
	        		target.reduceCurrentHp(damage, activeChar, skill);
	        		
	        		// vengeance reflected damage
					if ((reflect & Formulas.SKILL_REFLECT_VENGEANCE) != 0)
						activeChar.reduceCurrentHp(damage, target, skill);
	        	}
				
				// Manage attack or cast break of the target (calculating rate, sending message...)
                if (!target.isRaid() && Formulas.calcAtkBreak(target, damage))
                {
                	target.breakAttack();
                	target.breakCast();
                }
				if(activeChar instanceof L2PcInstance)
				{
					L2PcInstance activePlayer = (L2PcInstance) activeChar; 
					
					activePlayer.sendDamageMessage(target, (int)damage, false, true, false);
				}
			}
			
			// Sending system messages
			//Update by rocknow-Start
			/*
			if (skillIsEvaded)
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
			}
			*/
			//Update by rocknow-End
			
			//Possibility of a lethal strike
			Formulas.calcLethalHit(activeChar, target, skill);
			
			L2Effect effect = activeChar.getFirstEffect(skill.getId());
			//Self Effect
			if (effect != null && effect.isSelfEffect())
				effect.exit();
			skill.getEffectsSelf(activeChar);
		}
	}
	
	public L2SkillType[] getSkillIds()
	{
		return SKILL_IDS;
	}
}
