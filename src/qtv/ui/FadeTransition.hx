package qtv.ui;

import qtv.ui.TemporalContext;
import qtv.ui.Transition;
import xuloo.ui.UIComponent;

/**
 * ...
 * @author Trevor B
 */

class FadeTransition extends Transition {

	public function new(?name:String, ?context:TemporalContext, ?direction:TransitionDirection, ?duration:Int) {
		super(name, context, direction, duration);
	}
	
	public override function resolve(target:UIComponent):Void {
		
		if (context.phase == DisplayPhase.SHOWING) {
			target.alpha = 1;
			return;
		}
		
		if (direction == TransitionDirection.IN && context.phase == DisplayPhase.TRANSITION_IN) {
			Console.log("target = " + target);
			target.alpha = 1 - ((context.begin - context.playhead) / duration);
			return;
		}
		
		if (direction == TransitionDirection.OUT && context.phase == DisplayPhase.TRANSITION_OUT) {
			target.alpha = ((context.end + duration) - context.playhead) / duration;
			return;
		}
	}
	
}