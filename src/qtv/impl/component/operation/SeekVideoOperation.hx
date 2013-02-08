package qtv.impl.component.operation;

import xuloo.ui.BasicVideo;
import xuloo.ui.TargetAwareAction;

/**
 * ...
 * @author Trevor B
 */

class SeekVideoOperation extends TargetAwareAction
{
	public var time(default, default):Float;

	public function new() {
		super();
	}
	
	public override function execute():Void {
		cast(getTargetComponent(), BasicVideo).seek(Std.int(time));
	}
	
	public override function toString():String {
		return "[SeekVideoOperation('" + event + "', '" + target + "', '" + time + "')]";
	}
	
}