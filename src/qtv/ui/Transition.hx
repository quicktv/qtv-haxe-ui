package qtv.ui;

import qtv.ui.TransitionDirection;

import xuloo.ui.UIComponent;
import xuloo.ui.UIComponentPlugin;

/**
 * ...
 * @author Trevor B
 */

class Transition extends UIComponentPlugin
{
	public var context(default, default):TemporalContext;
	
	public var direction(getDirection, setDirection):TransitionDirection;

	var _direction:TransitionDirection;
	public function getDirection():TransitionDirection {
		return _direction;
	}
	public function setDirection(value:TransitionDirection):TransitionDirection {
		name = Std.string(value);
		return _direction = value;
	}
	
	public var duration(default, default):Int;
	
	public function new(?name:String, ?context:TemporalContext, ?direction:TransitionDirection, ?duration:Int) {
		super(name);
		
		this.context = context;
		this.direction = direction;
		this.duration = duration;
	}
}