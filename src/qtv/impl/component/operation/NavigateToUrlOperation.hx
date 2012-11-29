package qtv.impl.component.operation;

import xuloo.ui.Action;

#if flash
import flash.net.URLRequest;
import flash.Lib;
#elseif js
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
			interactiveLayer.pauseVideo();
		}
		else
		{
			interactiveLayer.playVideo();
		}

		#if flash
		Lib.getURL(new URLRequest(_url));
		#elseif js
		Lib.window.location.replace(_url);
		#end
	}

	public override function toString():String {
		return "[NavigateToUrl('" + event + "', '" + _url + "')]";
	}
}