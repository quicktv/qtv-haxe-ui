package qtv.impl.component.operation;

import xuloo.ui.BasicVideo;
import xuloo.ui.TargetAwareAction;

/**
 * ...
 * @author Trevor B
 */

class PlayVideoOperation extends TargetAwareAction
{
	public function new() {
		super();
	}
	
	public override function execute():Void {
		cast(getTargetComponent(), BasicVideo).play();
	}
	
	public override function toString():String {
		return "[PlayVideoOperation('" + event + "', '" + target + "')]";
	}
	
}