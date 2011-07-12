package apps.timeApp.controller {
	import apps.timeApp.model.CurrentTime;

	// Note [CONMET]: you can omit the controller metadata. The MVCS configuration will guess a controller by it's
	// namespace alone.
	[Controller]
	public class CurrentTimeController {

		[Inject]
		public var currentTime:CurrentTime;

		public function reset(event:ResetCurrentTimeEvent):void {
			currentTime.setTimeToNow();
		}

	}
}
