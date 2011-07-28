package main.model {

	import flash.events.Event;

	public class StopwatchStateUpdatedEvent extends Event {

		public static const UPDATED:String = "StopwatchStateUpdated";

		public function StopwatchStateUpdatedEvent() {
			super(UPDATED);
		}

		override public function clone():Event {
			return new StopwatchStateUpdatedEvent();
		}
	}
}