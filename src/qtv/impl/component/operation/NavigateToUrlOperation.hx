package qtv.impl.component.operation;

import xuloo.ui.Action;

#if flash
import flash.net.URLRequest;
import flash.Lib;
#elseif js
import js.Dom;
import js.Lib;
#end

class NavigateToUrlOperation extends Action {

	public var url(never, setUrl):String;
	
	var _url:String;
	public function setUrl(value:String):String {
		return _url = value;
	}

	public var pauseOnExecution(never, setPauseOnExecution):Bool;

	var _pauseOnExecution:Bool = true;
	public function setPauseOnExecution(value:Bool):Bool {
		return _pauseOnExecution = value;
	}

	public function new() {
		super();
	}
	
	public override function execute():Void {

		if (_pauseOnExecution) 
		{
			cast(interactiveLayer.getRootComponent(), xuloo.ui.BasicVideo).pause();
		}
		else
		{
			cast(interactiveLayer.getRootComponent(), xuloo.ui.BasicVideo).play();
		}

		#if flash
		Lib.getURL(new URLRequest(_url), "_blank");
		#elseif js
		try {
			//Console.log("trying location.replace");
			//Lib.window.location.replace(_url);
			//Lib.window.openWindow(_url, "nothing", "");
			//Console.log("opening window '" + _url + "' in parent");
			//Lib.window.open(_url, "", "_blank");
			//Console.log("window parent " + Lib.window.parent);
			var window:Window = Lib.window;
			while (window.parent != null) {
				Console.log("changing console to -- " + window.parent);
				window = window.parent;
			}
			window.location.replace(_url);
		} catch (e:String) {
			Console.log("error: " + e);
		}
		untyped __js__('openWindow(' + _url + ', "", ""');
		#end
	}

	public override function toString():String {
		return "[NavigateToUrl('" + event + "', '" + _url + "')]";
	}
}