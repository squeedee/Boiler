package main.controller {
	import main.model.StopwatchState;

	public class StopwatchController {
		[Inject]
		public var state:StopwatchState;

		public function toggle(event:ToggleStartStopEvent):void {
			state.toggle();
		}

	}
}
