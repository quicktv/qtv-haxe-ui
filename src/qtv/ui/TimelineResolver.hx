package qtv.ui;

#if flash 
import qtv.ui.ComponentEvent;
import qtv.ui.Transition;

import xuloo.ui.BasicSwfComponent;
import xuloo.ui.IQtvSwfAsset;
#end 

import xuloo.ui.UIComponentPlugin;
import xuloo.ui.UIComponent;

/**
 * ...
 * @author Trevor B
 */

class TimelineResolver extends UIComponentPlugin
{
	public var context(default, default):TemporalContext;
	
	public function new(context:TemporalContext) {
		super("TimelineResolver");
		
		this.context = context;
	}
	
	public override function resolve(target:UIComponent):Void {
		#if flash
		if(target != null && Std.is(target, BasicSwfComponent))  {
			var component:BasicSwfComponent = cast target;
			if(Std.is(component.movieClip, IQtvSwfAsset)) cast(component.movieClip, IQtvSwfAsset).playheadUpdate(context.playhead);
		}
		#end
	}
}