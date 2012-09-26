package qtv.ui;

import xuloo.ui.Timer;

/**
 * ...
 * @author Trevor B
 */

class TemporalContext 
{
	@inject public var timer:Timer;
	
	public var begin(default, default):Int;
	public var end(default, default):Int;
	public var duration(default, default):Int;
	public var phase(default, default):DisplayPhase;
	public var playhead(default, default):Float;
	
	public function new(?begin:Int = 0, ?end:Int = 0, ?duration:Int = 0) {
		this.begin = begin;
		this.end = end;
		this.duration = duration;
		
		phase = DisplayPhase.NOT_SHOWING;
	}
	
	@post public function post():Void {
		timer.tick.add(onTick);
	}
	
	function onTick(value:Float):Void {
		//Console.log("time = " + value);
		playhead = value;
	}
}