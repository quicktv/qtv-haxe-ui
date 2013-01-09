package qtv.impl.component.operation;

import xuloo.ui.BasicVideo;
import xuloo.ui.TargetAwareAction;

/**
 * ...
 * @author Trevor B
 */

class HideComponentOperation extends TargetAwareAction
{
	public function new() {
		super();
	}
	
	public override function execute():Void {
		getTargetComponent().includeInLayout = false;
	}
	
	public override function toString():String {
		return "[HideComponentOperation('" + event + "', '" + target + "')]";
	}
	
}