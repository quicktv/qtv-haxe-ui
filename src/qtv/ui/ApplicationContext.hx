package qtv.ui;

import mmvc.api.IViewContainer;
import mmvc.impl.Context;
import xuloo.ui.Timer;

/**
 * ...
 * @author Trevor B
 */

class ApplicationContext extends Context
{
	public function new(?contextView:IViewContainer=null) {
		super(contextView);
	}
	
	public override function startup():Void {
		
		injector.mapSingleton(Timer);
		injector.mapSingleton(ComponentBuilder);
	}
	
}