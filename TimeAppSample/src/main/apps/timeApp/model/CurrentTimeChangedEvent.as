package apps.timeApp.model {

	import flash.events.Event;

	public class CurrentTimeChangedEvent extends Event {

		public static const CHANGED:String = "CurrentTimeChanged";

		public function CurrentTimeChangedEvent() {
			super(CHANGED);
		}

		override public function clone():Event {
			return new CurrentTimeChangedEvent();
		}
	}
}