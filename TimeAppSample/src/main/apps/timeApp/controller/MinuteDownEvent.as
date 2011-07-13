package apps.timeApp.controller {

	import flash.events.Event;

	public class MinuteDownEvent extends Event {

		public static const MINUTE_DOWN:String = "MinuteDown";

		public function MinuteDownEvent() {
			super(MINUTE_DOWN);
		}

		override public function clone():Event {
			return new MinuteDownEvent();
		}
	}
}