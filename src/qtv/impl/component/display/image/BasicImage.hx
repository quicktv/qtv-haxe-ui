package qtv.impl.component.display.image;
import xuloo.ui.Image;

/**
 * ...
 * @author Trevor B
 */

class BasicImage extends Image
{
	public var source(never, setSource):String;
	
	public function setSource(value:String):String {
		src = value;
		return value;
	}
	
	public function new() 
	{
		super();
	}
	
}