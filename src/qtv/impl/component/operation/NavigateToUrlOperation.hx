package qtv.impl.component.operation;

import xuloo.ui.Action;

#if js
import js.Lib;
#end

class NavigateToUrlOperation extends Action {

	public var url(never, setUrl):String;
	
	var _url:String;
	public function setUrl(value:String):String {
		return _url = value;
	}

	public function new() {
		super();
	}
	
	public override function execute():Void {
		#if js
		Lib.window.location.replace(_url);
		#end
	}
}