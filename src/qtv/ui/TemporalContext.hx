package qtv.ui;

import qtv.api.core.IVideoTimer;

import xuloo.ui.UIComponent;

/**
 * ...
 * @author Trevor B
 */

class TemporalContext 
{
	@inject public var timer:IVideoTimer;
	
	public var begin(default, default):Int;
	public var end(default, default):Int;
	public var duration(default, default):Int;
	public var phase(default, default):DisplayPhase;
	public var playhead(default, default):Int;
	public var target(default, default):UIComponent;
	
	public function new(?target:UIComponent, ?begin:Int = 0, ?end:Int = 0, ?duration:Int = 0) {
		this.target = target;
		this.begin = begin;
		this.end = end;
		this.duration = duration;
		
		phase = DisplayPhase.NOT_SHOWING;

		_rendered = false;
	}
	
	@post public function post():Void {
		timer.timeChanged.add(onTick);
	}

	var _rendered:Bool;
	
	function onTick(value:Int):Void {
		//Console.log("time = " + value);
		if (!_rendered) {
			Console.log("on tick -- '" + target + "' " + playhead + " => " + value + " " + (playhead != value));
			if (playhead != value) {
				playhead = value;
				target.render();
			}
			_rendered = true;
		}
	}
}