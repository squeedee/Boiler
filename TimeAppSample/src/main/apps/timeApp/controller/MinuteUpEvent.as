package apps.timeApp.controller {

	import flash.events.Event;

	public class MinuteUpEvent extends Event {

		public static const MINUTE_UP:String = "MinuteUp";

		public function MinuteUpEvent() {
			super(MINUTE_UP);
		}

		override public function clone():Event {
			return new MinuteUpEvent();
		}
	}
}