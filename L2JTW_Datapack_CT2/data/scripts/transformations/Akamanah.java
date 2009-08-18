package transformations;

import net.sf.l2j.gameserver.model.L2Transformation;
import net.sf.l2j.gameserver.instancemanager.TransformationManager;
import net.sf.l2j.gameserver.datatables.MessageTable;//Update by rocknow

/**
 * @author durgus
 *
 */
public class Akamanah extends L2Transformation
{
    public Akamanah()
    {
        // id, colRadius, colHeight
        super(302, 10.0, 32.73);
    }
    
    public void onTransform()
    {
        // Set charachter name to transformed name
    	getPlayer().getAppearance().setVisibleName(MessageTable.Messages[590].getMessage());//Update by rocknow
    	getPlayer().getAppearance().setVisibleTitle("");
    }
    
    public void onUntransform()
    {
    	// set character back to true name.
    	getPlayer().getAppearance().setVisibleName(null);
    	getPlayer().getAppearance().setVisibleTitle(null);
    }
    
    public static void main(String[] args)
    {
        TransformationManager.getInstance().registerTransformation(new Akamanah());
    }
}
