package qtv.impl.component.display.image;

import xuloo.ui.UIComponent;

/**
 * ...
 * @author Trevor B
 */

class BasicImage extends UIComponent
{
	public var source(never, setSource):String;
	
	public function setSource(value:String):String {
		return value;
	}
	
	public function new() 
	{
		super();
	}
	
}