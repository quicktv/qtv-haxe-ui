package qtv.impl.component.operation;

import xuloo.ui.TargetAwareAction;

/**
 * ...
 * @author Trevor B
 */

class PlayVideoOperation extends TargetAwareAction
{
	public function new() 
	{
		super();
	}
	
	public override function execute():Void {
		Console.log("playing video " + getTargetComponent());
	}
	
}