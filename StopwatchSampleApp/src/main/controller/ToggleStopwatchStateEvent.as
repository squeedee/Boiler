package main.controller {

	import flash.events.Event;

	public class ToggleStopwatchStateEvent extends Event {

		public static const TOGGLE:String = "ToggleStopwatchState";

		public function ToggleStopwatchStateEvent() {
			super(TOGGLE);
		}

		override public function clone():Event {
			return new ToggleStopwatchStateEvent();
		}
	}
}