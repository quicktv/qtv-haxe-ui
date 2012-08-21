package qtv.impl.component.operation;
import xuloo.ui.Action;

/**
 * ...
 * @author Trevor B
 */

class PlayVideoOperation extends Action
{
	public var target(never, setTarget):String;
	
	var _target:String;
	public function setTarget(value:String):String {
		return _target = value;
	}
	public function new() 
	{
		super();
	}
	
}