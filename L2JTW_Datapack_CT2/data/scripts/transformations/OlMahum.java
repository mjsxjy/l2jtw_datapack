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
public class OlMahum extends L2Transformation
{
	public OlMahum()
	{
		// id, colRadius, colHeight
		super(6, 32.0, 63.0);
	}

	public void onTransform()
	{
		if (getPlayer().getTransformationId() != 6 || getPlayer().isCursedWeaponEquipped())
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
			getPlayer().addSkill(SkillTable.getInstance().getInfo(750, 1), false);
			getPlayer().addSkill(SkillTable.getInstance().getInfo(749, 3), false);
			getPlayer().addSkill(SkillTable.getInstance().getInfo(751, 3), false);
		}
		else if (getPlayer().getLevel() >= 73)
		{
			getPlayer().addSkill(SkillTable.getInstance().getInfo(750, 1), false);
			getPlayer().addSkill(SkillTable.getInstance().getInfo(749, 2), false);
			getPlayer().addSkill(SkillTable.getInstance().getInfo(751, 2), false);
		}
		else if (getPlayer().getLevel() >= 70)
		{
			getPlayer().addSkill(SkillTable.getInstance().getInfo(750, 1), false);
			getPlayer().addSkill(SkillTable.getInstance().getInfo(749, 1), false);
			getPlayer().addSkill(SkillTable.getInstance().getInfo(751, 1), false);
		}


		getPlayer().setTransformAllowedSkills(new int[]{619,5491,749,750,751});
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
		if (getPlayer().getLevel() >= 76)
		{
			getPlayer().removeSkill(SkillTable.getInstance().getInfo(749, 3), false);
			getPlayer().removeSkill(SkillTable.getInstance().getInfo(751, 3), false);//Update by rocknow
		}
		else if (getPlayer().getLevel() >= 73)
		{
			getPlayer().removeSkill(SkillTable.getInstance().getInfo(749, 2), false);
			getPlayer().removeSkill(SkillTable.getInstance().getInfo(751, 2), false);//Update by rocknow
		}
		else
		{
			getPlayer().removeSkill(SkillTable.getInstance().getInfo(749, 1), false);
			getPlayer().removeSkill(SkillTable.getInstance().getInfo(751, 1), false);//Update by rocknow
		}
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(750, 1), false, false);

		getPlayer().setTransformAllowedSkills(new int[]{});
	}

	public static void main(String[] args)
	{
		TransformationManager.getInstance().registerTransformation(new OlMahum());
	}
}