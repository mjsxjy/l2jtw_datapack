package transformations;

import net.sf.l2j.gameserver.datatables.SkillTable;
import net.sf.l2j.gameserver.instancemanager.TransformationManager;
import net.sf.l2j.gameserver.model.L2Transformation;

/**
 * Description: <br>
 * This will handle the transformation, giving the skills, and removing them, when the player logs out and is transformed these skills
 * do not save. 
 * 
 * @author Ahmed
 *
 */
public class Zaken extends L2Transformation
{
	public Zaken()
	{
		// id, colRadius, colHeight
		super(305, 16.0, 32.0);
	}

	public void onTransform()
	{
		if (getPlayer().getTransformationId() != 305 || getPlayer().isCursedWeaponEquipped())
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
		getPlayer().addSkill(SkillTable.getInstance().getInfo(715, 1), false);
		getPlayer().addSkill(SkillTable.getInstance().getInfo(716, 1), false);
		getPlayer().addSkill(SkillTable.getInstance().getInfo(717, 1), false);
		getPlayer().addSkill(SkillTable.getInstance().getInfo(718, 1), false);
		getPlayer().addSkill(SkillTable.getInstance().getInfo(719, 1), false);

		getPlayer().setTransformAllowedSkills(new int[]{619,5491,715,716,717,718,719});
	}

	public void onUntransform()
	{
		// remove transformation skills
		removeSkills();
	}

	public void removeSkills()
	{
		// Transfrom Dispel
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(619, 1), false);
		// Decrease Bow/Crossbow Attack Speed
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(5491, 1), false);
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(715, 1), false);
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(716, 1), false);
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(717, 1), false);
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(718, 1), false);
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(719, 1), false, false);

		getPlayer().setTransformAllowedSkills(new int[]{});
	}

	public static void main(String[] args)
	{
		TransformationManager.getInstance().registerTransformation(new Zaken());
	}
}