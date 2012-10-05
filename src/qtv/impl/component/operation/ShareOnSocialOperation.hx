package qtv.impl.component.operation;

import flash.external.ExternalInterface;
import flash.net.URLRequest;
import flash.net.NavigateToURL;
import qtv.api.core.Constants;

import xuloo.ui.Action;

class ShareOnSocialOperation extends Action {
	public var target(getTarget, setTarget) : String;
	public var body(getBody, setBody) : String;
	public var data(never, setData) : Dynamic;

	static var TWITTER_SHARE_URL : String = "http://twitter.com/home?status=[body]" + escape(" ") + "[url]";
	static var FACEBOOK_SHARE_URL : String = "http://www.facebook.com/sharer/sharer.php?u=[url]";
	static var GOOGLE_SHARE_URL : String = "https://apis.google.com/js/plusone.js";
	var _target : String;
	var _body : String;
	public function getTarget() : String {
		return _target;
	}

	public function setTarget(value : String) : String {
		_target = value;
		return value;
	}

	public function getBody() : String {
		return _body;
	}

	public function setBody(value : String) : String {
		_body = value;
		return value;
	}

	public function setData(value : Dynamic) : Dynamic {
		if(value.hasOwnProperty("target"))  {
			_target = value["target"];
		}
		if(value.hasOwnProperty("body"))  {
			_body = value["body"];
		}
		return value;
	}

	public function new() {
		super();
	}

	override public function execute() : Void {
		var url : String = compileShareURL(_target, _body);
		// was going to use controlLayer.openPopup but that doesn't do what I expect
		openURL(url, "Share", _target);
		controlLayer.setEnabled(true);
	}

	public function executeWithData(value : Dynamic) : Void {
		data = value;
		execute();
	}

	// helpers
	static function getShareURL(target : String) : String {
		var url : String = "";
		switch(target) {
		case Constants.FACEBOOK:
			url = FACEBOOK_SHARE_URL;
		case Constants.TWITTER:
			url = TWITTER_SHARE_URL;
		case Constants.GOOGLE:
			url = GOOGLE_SHARE_URL;
		}
		return url;
	}

	static function compileShareURL(target : String, body : String) : String {
		var url : String = getShareURL(target);
		url = url.replace("[body]", escape(body));
		url = url.replace("[url]", escape(getPageURL()));
		return url;
	}

	static function openURL(url : String, title : String, target : String) : Void {
		if(ExternalInterface.available)  {
			ExternalInterface.call("window.open", url, title, buildPopupProperties(target));
		}

		else  {
			var request : URLRequest = new URLRequest(url);
			navigateToURL(request);
		}

	}

	static function buildPopupProperties(target : String) : String {
		var properties : String = "height=[h],width=[w],toolbar=no,scrollbars=yes,top=200,left=200";
		var h : Int = 500;
		var w : Int = 500;
		switch(target) {
		case Constants.FACEBOOK:
			h = 600;
			w = 800;
		case Constants.TWITTER:
		case Constants.GOOGLE:
		}
		properties = properties.replace("[h]", h);
		properties = properties.replace("[w]", w);
		return properties;
	}

	static function getPageURL() : String {
		if(ExternalInterface.available) return ExternalInterface.call("window.location.href.toString")
		else return "";
	}

}

