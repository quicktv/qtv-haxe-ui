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
		#if preview Console.log("creating instance of clazz " + clazz); #end

		var instance:T = Type.createInstance(clazz, []);
		#if preview Console.log("creating instance of clazz " + clazz); #end
		injector.injectInto(instance);
		#if preview Console.log("creating instance of clazz " + clazz); #end

		return instance;
	}
	
}