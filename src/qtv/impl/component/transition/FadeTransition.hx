package qtv.impl.component.transition;

import qtv.ui.DisplayPhase;
import qtv.ui.TemporalContext;
import qtv.ui.Transition;
import qtv.ui.TransitionDirection;

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
		
		//Console.log("display phase " + context.phase);

		if (context.phase == DisplayPhase.SHOWING) {
			target.alpha = 1;
			return;
		}
		
		if (direction == TransitionDirection.IN && context.phase == DisplayPhase.TRANSITION_IN) {
			target.alpha = 1 - ((context.begin - context.playhead) / duration);
			return;
		}
		
		if (direction == TransitionDirection.OUT && context.phase == DisplayPhase.TRANSITION_OUT) {
			Console.log("calculating " + target.alpha + " -- " + (((context.end + duration) - context.playhead) / duration));
			target.alpha = ((context.end + duration) - context.playhead) / duration;
			return;
		}
	}
	
}