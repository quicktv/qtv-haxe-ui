package qtv.ui;

import mmvc.impl.Context;

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
		
		Console.log("starting up");
		
		injector.mapSingleton(Timer);
		injector.mapSingleton(ComponentBuilder);
	}
	
}