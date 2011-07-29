package main.controller {
	import main.model.StopwatchTimeModel;

	public class StopwatchController {
		[Inject]
		public var state:StopwatchTimeModel;

		public function toggle(event:ToggleStartStopEvent):void {
			state.toggleStopStart();
		}

	}
}
