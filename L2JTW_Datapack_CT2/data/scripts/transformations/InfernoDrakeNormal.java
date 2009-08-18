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
public class InfernoDrakeNormal extends L2Transformation
{
	public InfernoDrakeNormal()
	{
		// id, colRadius, colHeight
		super(214, 8.0, 22.0);
	}

	public void onTransform()
	{
		if (getPlayer().getTransformationId() != 214 || getPlayer().isCursedWeaponEquipped())
			return;

		// give transformation skills
		transformedSkills();
	}

	public void transformedSkills()
	{
        // Paw Strike
		getPlayer().addSkill(SkillTable.getInstance().getInfo(576, 3), false);
		// Fire Breath
		getPlayer().addSkill(SkillTable.getInstance().getInfo(577, 3), false);
		// Blaze Quake
		getPlayer().addSkill(SkillTable.getInstance().getInfo(578, 3), false);
		// Fire Armor
		getPlayer().addSkill(SkillTable.getInstance().getInfo(579, 3), false);
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
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(576, 3), false);
		// Fire Breath
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(577, 3), false);
		// Blaze Quake
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(578, 3), false);
		// Fire Armor
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(579, 3), false, false);
		// Transfrom Dispel
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(619, 1), false);
		// Decrease Bow/Crossbow Attack Speed
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(5491, 1), false);

		getPlayer().setTransformAllowedSkills(new int[]{});
	}

	public static void main(String[] args)
	{
		TransformationManager.getInstance().registerTransformation(new InfernoDrakeNormal());
	}
}
