package qtv.ui;

import nme.events.Event;
	 
class ComponentEvent extends Event
{
	public static var COMPONENT_SHOWN:String = "shown";
	public static var COMPONENT_HIDDEN:String = "hidden";
	
	public function new(type:String, bubbles:Bool=false, cancelable:Bool=false)
	{
		super(type, bubbles, cancelable);
	}
}