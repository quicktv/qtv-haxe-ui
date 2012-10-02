package qtv.impl.component.operation;

import xuloo.ui.BasicVideo;
import xuloo.ui.TargetAwareAction;

/**
 * ...
 * @author Trevor B
 */

class PauseVideoOperation extends TargetAwareAction
{
	public function new() {
		super();
	}
	
	public override function execute():Void {
		Console.log("pausing video " + getTargetComponent());
		
		cast(getTargetComponent(), BasicVideo).pause();
	}
	
}