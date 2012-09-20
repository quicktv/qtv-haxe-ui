package qtv.ui;
import minject.Injector;
import qtv.impl.component.display.video.BasicVideo;
import xuloo.ui.BasicShape;
import xuloo.ui.UIComponent;

/**
 * ...
 * @author Trevor B
 */

class ComponentBuilder 
{
	@inject public var injector:Injector;
	
	public function new() {
		
	}
	
	public function create<T>(clazz:Class<T>, ?vars:Array<Dynamic>):T {
		if (vars == null) vars = [];
		Console.log("creating instance of clazz " + clazz);

		var instance:T = Type.createInstance(clazz, []);
		injector.injectInto(instance);

		return instance;
	}
	
}