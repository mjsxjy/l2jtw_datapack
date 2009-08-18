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
public class DoomWraith extends L2Transformation
{
	public DoomWraith()
	{
		// id, colRadius, colHeight
		super(2, 8.0, 22.0);
	}

	public void onTransform()
	{
		if (getPlayer().getTransformationId() != 2 || getPlayer().isCursedWeaponEquipped())
			return;

		// give transformation skills
		transformedSkills();
	}

	public void transformedSkills()
	{
		// Rolling Attack
		getPlayer().addSkill(SkillTable.getInstance().getInfo(586, 2), false);
		// Curse of Darkness
		getPlayer().addSkill(SkillTable.getInstance().getInfo(588, 2), false);
		// Dig Attack
		getPlayer().addSkill(SkillTable.getInstance().getInfo(587, 2), false);
		// Darkness Energy Drain"
		getPlayer().addSkill(SkillTable.getInstance().getInfo(589, 2), false);
		// Transfrom Dispel
		getPlayer().addSkill(SkillTable.getInstance().getInfo(619, 1), false);
		// Decrease Bow/Crossbow Attack Speed
		getPlayer().addSkill(SkillTable.getInstance().getInfo(5491, 1), false);

		getPlayer().setTransformAllowedSkills(new int[]{619,5491,586,587,588,589});
	}

	public void onUntransform()
	{
		// remove transformation skills
		removeSkills();
	}

	public void removeSkills()
	{
		// Rolling Attack
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(586, 2), false);
		// Curse of Darkness
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(588, 2), false);
		// Dig Attack
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(587, 2), false);
		// Darkness Energy Drain"
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(589, 2), false);
		// Transfrom Dispel
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(619, 1), false);
		// Decrease Bow/Crossbow Attack Speed
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(5491, 1), false);

		getPlayer().setTransformAllowedSkills(new int[]{});
	}

	public static void main(String[] args)
	{
		TransformationManager.getInstance().registerTransformation(new DoomWraith());
	}
}
