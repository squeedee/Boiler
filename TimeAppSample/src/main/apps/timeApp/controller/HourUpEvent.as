package apps.timeApp.controller {

	import flash.events.Event;

	public class HourUpEvent extends Event {

		public static const HOUR_UP:String = "HourUp";

		public function HourUpEvent() {
			super(HOUR_UP);
		}

		override public function clone():Event {
			return new HourUpEvent();
		}
	}
}