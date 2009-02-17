package transformations;

import net.sf.l2j.gameserver.datatables.SkillTable;
import net.sf.l2j.gameserver.instancemanager.TransformationManager;
import net.sf.l2j.gameserver.model.L2Skill;
import net.sf.l2j.gameserver.model.L2Transformation;

public class VanguardPaladin extends L2Transformation
{
	public VanguardPaladin()
	{
		// id, duration (secs), colRadius, colHeight
		super(312, Integer.MAX_VALUE, 8.0, 23.0);
	}
	
	public void onTransform()
	{
		// Disable all character skills.
		for (L2Skill sk : this.getPlayer().getAllSkills())
		{
			if (sk != null && !sk.isPassive())
			{
				switch (sk.getId())
				{
					case 28: // Aggression
					case 18: // Aura of Hate
					case 406: // Angelic Icon
					case 400: // Tribunal
					case 196: // Holy Blade
					case 197: // Holy Armor
					{
						// Those Skills wont be removed.
						break;
					}
					default:
					{
						this.getPlayer().removeSkill(sk, false, false);
						break;
					}
				}
			}
			
		}
		if (this.getPlayer().transformId() > 0 && !this.getPlayer().isCursedWeaponEquipped())
		{
			// give transformation skills
			transformedSkills();
			return;
		}
		// give transformation skills
		transformedSkills();
	}
	
	public void transformedSkills()
	{
		if (this.getPlayer().getLevel() > 43)
		{
			// Power Divide
			this.getPlayer().addSkill(SkillTable.getInstance().getInfo(816, this.getPlayer().getLevel() - 43), false);
			// Full Swing
			this.getPlayer().addSkill(SkillTable.getInstance().getInfo(814, this.getPlayer().getLevel() - 43), false);
		}
		// Decrease Bow/Crossbow Attack Speed
		this.getPlayer().addSkill(SkillTable.getInstance().getInfo(5491, 1), false); 
		// Switch Stance
		this.getPlayer().addSkill(SkillTable.getInstance().getInfo(838, 1), false);
		// Send a Server->Client packet StatusUpdate to the L2PcInstance.
		this.getPlayer().sendSkillList();
	}
	
	public void onUntransform()
	{
		// remove transformation skills
		removeSkills();
	}
	
	public void removeSkills()
	{
		// Power Divide
		this.getPlayer().removeSkill(SkillTable.getInstance().getInfo(816, this.getPlayer().getLevel() - 43), false);
		// Full Swing
		this.getPlayer().removeSkill(SkillTable.getInstance().getInfo(814, this.getPlayer().getLevel() - 43), false);
		// Decrease Bow/Crossbow Attack Speed
		this.getPlayer().removeSkill(SkillTable.getInstance().getInfo(5491, 1), false); 
		// Switch Stance
		this.getPlayer().removeSkill(SkillTable.getInstance().getInfo(838, 1), false);
		// Send a Server->Client packet StatusUpdate to the L2PcInstance.
		this.getPlayer().sendSkillList();
	}
	
	public static void main(String[] args)
	{
		TransformationManager.getInstance().registerTransformation(new VanguardPaladin());
	}
}