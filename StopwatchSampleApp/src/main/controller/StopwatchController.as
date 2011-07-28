package main.controller {
	import main.model.StopwatchState;

	public class StopwatchController {
		[Inject]
		public var state:StopwatchState;

		public function toggle(event:ToggleStopwatchStateEvent):void {
			state.toggle();
		}

	}
}
