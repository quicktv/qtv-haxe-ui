package qtv.ui;

import qtv.ui.ComponentEvent;
import qtv.ui.Transition;

import xuloo.ui.UIComponent;
import xuloo.ui.UIComponentPlugin;

/**
 * ...
 * @author Trevor B
 */

class DisplayPhaseResolver extends UIComponentPlugin
{
	public var context(default, default):TemporalContext;

	var _previousPhase:DisplayPhase;
		
	public function new(context:TemporalContext) {
		super("DisplayPhaseResolver");
		
		//_previousPhase = DisplayPhase.NOT_SHOWING;
		this.context = context;
	}
	
	public override function resolve(target:UIComponent):Void {
		//Console.log("resolving display phase for " + target + "(" + target.includeInLayout + ")");

		context.phase = currentDisplayPhase(target);
		
		//Console.log("context.phase = " + context.phase + " for " + target);

		if (_previousPhase == null || context.phase != _previousPhase) {

			switch (context.phase)
			{				
				case DisplayPhase.TRANSITION_IN:
					target.active = true;
					target.alpha = 0;
				case DisplayPhase.TRANSITION_OUT:
					target.active = true;
				case DisplayPhase.SHOWING:
					target.active = true;
					target.alpha = 1;
				
				default:
					target.active = false;
			}

			if (_previousPhase == DisplayPhase.NOT_SHOWING) {
				if (context.phase == DisplayPhase.SHOWING || context.phase == DisplayPhase.TRANSITION_IN) {
					target.dispatchEvent(new ComponentEvent(ComponentEvent.COMPONENT_SHOWN));
				}
			}

			if (_previousPhase == DisplayPhase.SHOWING || _previousPhase == DisplayPhase.TRANSITION_OUT) {
				if (context.phase == DisplayPhase.NOT_SHOWING) {
					target.dispatchEvent(new ComponentEvent(ComponentEvent.COMPONENT_HIDDEN));
				}
			}

			_previousPhase = context.phase;
		}

		//Console.log("resolved display phase for " + target + "(" + target.includeInLayout + ") to " + context.phase);
	}
	
	function currentDisplayPhase(target:UIComponent):DisplayPhase {
		// when displaying live feeds there's no concept of playhead time
		// so if a display component is in the layer that's it, it's showing.
		//if (_live) return DisplayPhase.DISPLAYING;

		// if this is the root object then show it.
		if (target.instanceName == "______root______") return DisplayPhase.SHOWING; 
		if (!target.includeInLayout) return DisplayPhase.NOT_SHOWING;
		
		var transition:Transition = cast(target.getPlugin(Std.string(TransitionDirection.IN)));

		if (transition != null && (context.playhead > context.begin - transition.duration && context.playhead < context.begin)) {
			return DisplayPhase.TRANSITION_IN;
		}		
		//Console.log(context.playhead + " >= " + context.begin + " && " + context.playhead + " <= " + context.end);
		if (context.playhead >= context.begin && context.playhead <= context.end) {
			/*if (context.phase != DisplayPhase.SHOWING) {
				target.dispatchEvent(new ComponentEvent(ComponentEvent.COMPONENT_SHOWN));
			}*/
			
			return DisplayPhase.SHOWING;
		}
		
		transition = cast(target.getPlugin(Std.string(TransitionDirection.OUT)));
		//Console.log("transition != null" + " && " + context.playhead  + " > " + context.end  + " && " + context.playhead + " < " + (context.end + transition.duration));
		if (transition != null && (context.playhead > context.end && context.playhead < context.end + transition.duration)) {
			return DisplayPhase.TRANSITION_OUT;
		}
		
		/*if (context.phase != DisplayPhase.NOT_SHOWING) {
			target.dispatchEvent(new ComponentEvent(ComponentEvent.COMPONENT_HIDDEN));
		}*/
		
		return DisplayPhase.NOT_SHOWING;
	}
}