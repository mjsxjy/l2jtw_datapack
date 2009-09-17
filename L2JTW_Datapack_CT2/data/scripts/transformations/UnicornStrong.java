package transformations;

import net.sf.l2j.gameserver.datatables.SkillTable;
import net.sf.l2j.gameserver.instancemanager.TransformationManager;
import net.sf.l2j.gameserver.model.L2Transformation;

public class UnicornStrong extends L2Transformation
{
	public UnicornStrong()
	{
		// id, colRadius, colHeight
		super(204, 15, 28);
	}

	public void onTransform()
	{
		if (getPlayer().getTransformationId() != 204 || getPlayer().isCursedWeaponEquipped())
			return;

		transformedSkills();
	}

	public void transformedSkills()
	{
		// Horn of Doom (up to 4 levels)
		getPlayer().addSkill(SkillTable.getInstance().getInfo(563, 4), false);
		// Gravity Control (up to 4 levels)
		getPlayer().addSkill(SkillTable.getInstance().getInfo(564, 4), false);
		// Horn Assault (up to 4 levels)
		getPlayer().addSkill(SkillTable.getInstance().getInfo(565, 4), false);
		// Light of Heal (up to 4 levels)
		getPlayer().addSkill(SkillTable.getInstance().getInfo(567, 4), false);
		// Decrease Bow/Crossbow Attack Speed
		getPlayer().addSkill(SkillTable.getInstance().getInfo(5491, 1), false);
		// Transfrom Dispel
		getPlayer().addSkill(SkillTable.getInstance().getInfo(619, 1), false);

		getPlayer().setTransformAllowedSkills(new int[]{563,564,565,567,5491,619});
	}

	public void onUntransform()
	{
		removeSkills();
	}

	public void removeSkills()
	{
		// Horn of Doom (up to 4 levels)
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(563, 4), false);
		// Gravity Control (up to 4 levels)
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(564, 4), false);
		// Horn Assault (up to 4 levels)
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(565, 4), false);
		// Light of Heal (up to 4 levels)
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(567, 4), false);
		// Decrease Bow/Crossbow Attack Speed
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(5491, 1), false);
		// Transfrom Dispel
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(619, 1), false);

		getPlayer().setTransformAllowedSkills(new int[]{});
	}

	public static void main(String[] args)
	{
		TransformationManager.getInstance().registerTransformation(new UnicornStrong());
	}
}
