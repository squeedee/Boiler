package main.controller {

	import flash.events.Event;

	public class ToggleStartStopEvent extends Event {

		public static const TOGGLE:String = "ToggleStartStop";

		public function ToggleStartStopEvent() {
			super(TOGGLE);
		}

		override public function clone():Event {
			return new ToggleStartStopEvent();
		}
	}
}