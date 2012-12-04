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
	
	public function new(context:TemporalContext) {
		super("DisplayPhaseResolver");
		
		this.context = context;
	}
	
	public override function resolve(target:UIComponent):Void {
		context.phase = currentDisplayPhase(target);
		
		//Console.log("display phase = " + context.phase);
		
		switch (context.phase)
		{
			case DisplayPhase.NOT_SHOWING:
				target.alpha = 0;
				//target.active = false;
			
			case DisplayPhase.TRANSITION_IN:
			case DisplayPhase.TRANSITION_OUT:
				//target.active = true;
			
			case DisplayPhase.SHOWING:
				target.alpha = 1;
				//target.active = true;
			
			default:
				//active = false;
		}
	}
	
	function currentDisplayPhase(target:UIComponent):DisplayPhase {
		// when displaying live feeds there's no concept of playhead time
		// so if a display component is in the layer that's it, it's showing.
		//if (_live) return DisplayPhase.DISPLAYING;

		// if this is the root object then show it.
		if (target.instanceName == "______root______") return DisplayPhase.SHOWING;
		
		var transition:Transition = cast(target.getPlugin(Std.string(TransitionDirection.IN)));
		
		if (transition != null && (context.playhead > context.begin - transition.duration && context.playhead < context.begin)) {
			return DisplayPhase.TRANSITION_IN;
		}		
		
		if (context.playhead >= context.begin && context.playhead <= context.end) {
			if (context.phase != DisplayPhase.SHOWING) {
				/*CONFIG::debug {
					logger.debug("showing component");
				}*/
				
				target.dispatchEvent(new ComponentEvent(ComponentEvent.COMPONENT_SHOWN));
			}
			
			return DisplayPhase.SHOWING;
		}
		
		transition = cast(target.getPlugin(Std.string(TransitionDirection.OUT)));
		
		if (transition != null && (context.playhead > context.end && context.playhead < context.end + transition.duration)) {
			return DisplayPhase.TRANSITION_OUT;
		}
		
		if (context.phase != DisplayPhase.NOT_SHOWING) {
			/*CONFIG::debug {
				logger.debug("hiding component");
			}*/
			
			target.dispatchEvent(new ComponentEvent(ComponentEvent.COMPONENT_HIDDEN));
		}
		
		return DisplayPhase.NOT_SHOWING;
	}
}