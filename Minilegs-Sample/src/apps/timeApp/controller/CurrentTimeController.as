package apps.timeApp.controller {
	import apps.timeApp.model.CurrentTime;

	[Controller]
	public class CurrentTimeController {

		[Inject]
		public var currentTime:CurrentTime;

		public function reset(event:ResetCurrentTimeEvent):void {
			currentTime.setTimeToNow();
		}

	}
}
