package qtv.impl.component.operation;

import xuloo.ui.TargetAwareAction;

class ToggleComponentOperation extends TargetAwareAction {

	public function new() {
		super();
	}
	
	public override function execute():Void {
		Console.log("toggling component " + getTargetComponent());
		
		getTargetComponent().visible = !getTargetComponent().visible;
	}

}

