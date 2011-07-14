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

		public function hourUp(event:HourUpEvent):void {

		}

		public function hourDown(event:HourDownEvent):void {

		}

		public function minuteUp(event:MinuteUpEvent):void {

		}

		public function minuteDown(event:MinuteDownEvent):void {

		}

	}
}
