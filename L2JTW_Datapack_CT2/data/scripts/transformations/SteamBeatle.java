package transformations;

import net.sf.l2j.gameserver.datatables.SkillTable;
import net.sf.l2j.gameserver.instancemanager.TransformationManager;
import net.sf.l2j.gameserver.model.L2Transformation;

public class SteamBeatle extends L2Transformation
{
	public SteamBeatle()
	{
		// id, colRadius, colHeight
		super(110, 40, 28);
	}

	public void onTransform()
	{
		if (getPlayer().getTransformationId() != 110 || getPlayer().isCursedWeaponEquipped())
			return;

		transformedSkills();
	}

	public void transformedSkills()
	{
		// Decrease Bow/Crossbow Attack Speed
		getPlayer().addSkill(SkillTable.getInstance().getInfo(5491, 1), false);
		// Dismount
		getPlayer().addSkill(SkillTable.getInstance().getInfo(839, 1), false);
		getPlayer().addSkill(SkillTable.getInstance().getInfo(5437, 1), false);//Update by rocknow

		getPlayer().setTransformAllowedSkills(new int[]{5491,839,5437});//Update by rocknow
	}

	public void onUntransform()
	{
		removeSkills();
	}

	public void removeSkills()
	{
		// Decrease Bow/Crossbow Attack Speed
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(5491, 1), false);
		// Dismount
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(839, 1), false);
		getPlayer().removeSkill(SkillTable.getInstance().getInfo(5437, 1), false);//Update by rocknow

		getPlayer().setTransformAllowedSkills(new int[]{});
	}

	public static void main(String[] args)
	{
		TransformationManager.getInstance().registerTransformation(new SteamBeatle());
	}
}
