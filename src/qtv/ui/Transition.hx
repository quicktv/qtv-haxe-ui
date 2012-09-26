package qtv.ui;
import xuloo.ui.UIComponent;
import xuloo.ui.UIComponentPlugin;

/**
 * ...
 * @author Trevor B
 */

class Transition extends UIComponentPlugin
{
	public var context(default, default):TemporalContext;
	
	public var direction(default, default):TransitionDirection;
	
	public var duration(default, default):Int;
	
	public function new(?name:String, ?context:TemporalContext, ?direction:TransitionDirection, ?duration:Int) {
		super(name);
		
		this.context = context;
		this.direction = direction;
		this.duration = duration;
	}
}

enum TransitionDirection {
	IN;
	OUT;
}