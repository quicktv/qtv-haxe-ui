package qtv.impl.component.operation;

import qtv.utils.Window;

import xuloo.ui.Action;

class OpenPopupOperation extends Action {
	public var url(getUrl, setUrl) : String;
	public var title(getTitle, setTitle) : String;
	public var data(never, setData) : Dynamic;

	public function new() {
		_url = "";
		_title = "";
		super();
	}

	var _url : String;
	public function getUrl() : String {
		return _url;
	}

	public function setUrl(value : String) : String {
		_url = value;
		return value;
	}

	var _title : String;
	public function getTitle() : String {
		return _title;
	}

	public function setTitle(value : String) : String {
		_title = value;
		return value;
	}

	var _specs : String;
	public function setData(value : Dynamic) : Dynamic {
		_specs = value;
		return value;
	}

	override public function execute() : Void {
		//Console.log("opening popup window " + _url + " '" + title + "' '" + _specs + "'");
		interactiveLayer.openPopup(_url, _title, _specs);
	}

	public function executeWithData(value : Dynamic) : Void {
		data = value;
		execute();
	}

}

