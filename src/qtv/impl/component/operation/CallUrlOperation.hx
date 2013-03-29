package qtv.impl.component.operation;

import xuloo.ui.Action;

import haxe.Http;

class CallUrlOperation extends Action {

	public var url(never, setUrl):String;
	
	var _url:String;
	public function setUrl(value:String):String {
		return _url = value;
	}
	
	public var postData(never, setPostData):String;
	
	var _postData:String;
	public function setPostData(value:String):String {
		return _postData = value;
	}
	
	public var pauseOnExecution(never, setPauseOnExecution):Bool;

	var _pauseOnExecution:Bool = false;
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
		
		var http = new Http(_url);
		
		if (_postData != null)
		{
			http.setPostData(_postData);
			http.request(true);
		}
		else
		{
			http.request(false);
		}
	}

	public override function toString():String {
		return "[CallUrl('" + event + "', '" + _url + "')]";
	}
}