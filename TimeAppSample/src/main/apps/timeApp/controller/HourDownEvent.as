package apps.timeApp.controller {

	import flash.events.Event;

	public class HourDownEvent extends Event {

		public static const HOUR_DOWN:String = "HourDown";

		public function HourDownEvent() {
			super(HOUR_DOWN);
		}

		override public function clone():Event {
			return new HourDownEvent();
		}
	}
}