package qtv.impl.component.operation;

import xuloo.ui.BasicVideo;
import xuloo.ui.TargetAwareAction;

/**
 * ...
 * @author Trevor B
 */

class ShowComponentOperation extends TargetAwareAction
{
	public function new() {
		super();
	}
	
	public override function execute():Void {
		getTargetComponent().includeInLayout = true;
	}
	
	public override function toString():String {
		return "[ShowComponentOperation('" + event + "', '" + target + "')]";
	}
	
}