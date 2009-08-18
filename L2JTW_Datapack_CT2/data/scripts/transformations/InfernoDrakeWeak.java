package transformations;

import net.sf.l2j.gameserver.datatables.SkillTable;
import net.sf.l2j.gameserver.instancemanager.TransformationManager;
import net.sf.l2j.gameserver.model.L2Transformation;

/**
 * Description: <br>
 * This will handle the transformation, giving the skills, and removing them, when the player logs out and is transformed these skills
 * do not save. 
 * 
 * @author durgus
 *
 */
public class InfernoDrakeWeak extends L2Transformation
{
	public InfernoDrakeWeak()
	{
		// id, colRadius, colHeight
		super(215, 8.0, 22.0);
	}

	public void onTransform()
	{
		if (getPlayer().getTransformationId() != 215 || getPlayer().isCursedWeaponEquipped())
			return;

		// give transformation skills
		transformedSkills();
	}

	public void transformedSkills()
	{
        // Paw Strike
		getPlayer().addSkill(SkillTable.getInstance().getInfo(576, 2), false);
		// Fire Breath
		getPlayer().addSkill(SkillTable.getInstance().getInfo(577, 2), false);
		// Blaze Quake
		getPlayer().addSkill(SkillTable.getInstance().getInfo(578, 2), false);
		// Fire Armor
		getPlayer().addSkill(SkillTable.getInstance().getInfo(579, 2), false);
		// Transfrom Dispel
		getPlayer().addSkill(SkillTable.getInstance().getInfo(619, 1), false);
		// Decrease Bow/Crossbow Attack Speed
		getPlayer().addSkill(SkillTable.getInstance().getInfo(5491, 1), false);

		getPlayer().setTransformAllowedSkills(new int[]{619,5491,576,577,578,579});
	}

	public void onUntransform()
	{
		// remove transformation skills
		removeSkills();
	}

	public void removeSkills()
	{
        // Paw Strike
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(576, 2), false);
		// Fire Breath
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(577, 2), false);
		// Blaze Quake
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(578, 2), false);
		// Fire Armor
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(579, 2), false, false);
		// Transfrom Dispel
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(619, 1), false);
		// Decrease Bow/Crossbow Attack Speed
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(5491, 1), false);

		getPlayer().setTransformAllowedSkills(new int[]{});
	}

	public static void main(String[] args)
	{
		TransformationManager.getInstance().registerTransformation(new InfernoDrakeWeak());
	}
}
