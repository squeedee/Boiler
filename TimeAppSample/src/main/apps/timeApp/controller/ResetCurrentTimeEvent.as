package apps.timeApp.controller {

	import flash.events.Event;

	public class ResetCurrentTimeEvent extends Event {

		public static const RESET:String = "ResetCurrentTime";

		public function ResetCurrentTimeEvent() {
			super(RESET);
		}

		override public function clone():Event {
			return new ResetCurrentTimeEvent();
		}
	}
}