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
public class GrailApostleWeak extends L2Transformation
{
	public GrailApostleWeak()
	{
		// id, colRadius, colHeight
		super(203, 8.0, 30.0);
	}

	public void onTransform()
	{
		if (getPlayer().getTransformationId() != 203 || getPlayer().isCursedWeaponEquipped())
			return;

		// give transformation skills
		transformedSkills();
	}

	public void transformedSkills()
	{
		// Spear
		getPlayer().addSkill(SkillTable.getInstance().getInfo(559, 2), false);
		// Power Slash
		getPlayer().addSkill(SkillTable.getInstance().getInfo(560, 2), false);
		// Bless of Angel
		getPlayer().addSkill(SkillTable.getInstance().getInfo(561, 2), false);
		// Wind of Angel
		getPlayer().addSkill(SkillTable.getInstance().getInfo(562, 2), false);
		// Transfrom Dispel
		getPlayer().addSkill(SkillTable.getInstance().getInfo(619, 1), false);
		// Decrease Bow/Crossbow Attack Speed
		getPlayer().addSkill(SkillTable.getInstance().getInfo(5491, 1), false);

		getPlayer().setTransformAllowedSkills(new int[]{619,5491,559,560,561,562});
	}

	public void onUntransform()
	{
		// remove transformation skills
		removeSkills();
	}

	public void removeSkills()
	{
		// Spear
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(559, 2), false);
		// Power Slash
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(560, 2), false);
		// Bless of Angel
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(561, 2), false, false);
		// Wind of Angel
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(562, 2), false, false);
		// Transfrom Dispel
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(619, 1), false);
		// Decrease Bow/Crossbow Attack Speed
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(5491, 1), false);

		getPlayer().setTransformAllowedSkills(new int[]{});
	}

	public static void main(String[] args)
	{
		TransformationManager.getInstance().registerTransformation(new GrailApostleWeak());
	}
}
