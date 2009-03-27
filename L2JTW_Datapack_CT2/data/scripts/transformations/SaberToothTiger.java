package transformations;

import net.sf.l2j.gameserver.datatables.SkillTable;
import net.sf.l2j.gameserver.instancemanager.TransformationManager;
import net.sf.l2j.gameserver.model.L2Transformation;

/**
 * Description: <br>
 * This will handle the transformation, giving the skills, and removing them, when the player logs out and is transformed these skills
 * do not save. 
 * When the player logs back in, there will be a call from the enterworld packet that will add all their skills.
 * The enterworld packet will transform a player.
 * 
 * @author Ahmed
 *
 */
public class SaberToothTiger extends L2Transformation
{
	public SaberToothTiger()
	{
		// id, duration (secs), colRadius, colHeight
		super(5, 1800, 34.0, 28.0);
	}

	public void onTransform()
	{
		if (getPlayer().getTransformationId() != 5 || getPlayer().isCursedWeaponEquipped())
			return;

		// give transformation skills
		transformedSkills();
	}

	public void transformedSkills()
	{
		// Transfrom Dispel
		getPlayer().addSkill(SkillTable.getInstance().getInfo(619, 1), false);
		// Decrease Bow/Crossbow Attack Speed
		getPlayer().addSkill(SkillTable.getInstance().getInfo(5491, 1), false);
		if (getPlayer().getLevel() >= 76)
		{
			getPlayer().addSkill(SkillTable.getInstance().getInfo(746, 3), false);
			getPlayer().addSkill(SkillTable.getInstance().getInfo(747, 3), false);
		}
		else if (getPlayer().getLevel() >= 73)
		{
			getPlayer().addSkill(SkillTable.getInstance().getInfo(746, 2), false);
			getPlayer().addSkill(SkillTable.getInstance().getInfo(747, 2), false);
		}
		else if (getPlayer().getLevel() >= 70)
		{
			getPlayer().addSkill(SkillTable.getInstance().getInfo(746, 1), false);
			getPlayer().addSkill(SkillTable.getInstance().getInfo(747, 1), false);
		}
		getPlayer().addSkill(SkillTable.getInstance().getInfo(748, 1), false);

		getPlayer().setTransformAllowedSkills(new int[]{619,5491,746,747,748});
	}

	public void onUntransform()
	{
		// remove transformation skills
		removeSkills();
	}

	public void removeSkills()
	{
		// Transfrom Dispel
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(619, 1), false, false);
		// Decrease Bow/Crossbow Attack Speed
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(5491, 1), false, false);
		if (getPlayer().getLevel() >= 76)
		{
			getPlayer().removeSkill(SkillTable.getInstance().getInfo(746, 3), false, false);
			getPlayer().removeSkill(SkillTable.getInstance().getInfo(747, 3), false, false);
		}
		else if (getPlayer().getLevel() >= 73)
		{
			getPlayer().removeSkill(SkillTable.getInstance().getInfo(746, 2), false, false);
			getPlayer().removeSkill(SkillTable.getInstance().getInfo(747, 2), false, false);
		}
		else
		{
			getPlayer().removeSkill(SkillTable.getInstance().getInfo(746, 1), false, false);
			getPlayer().removeSkill(SkillTable.getInstance().getInfo(747, 1), false, false);
		}
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(748, 1), false, false);

		getPlayer().setTransformAllowedSkills(new int[]{});
	}

	public static void main(String[] args)
	{
		TransformationManager.getInstance().registerTransformation(new SaberToothTiger());
	}
}