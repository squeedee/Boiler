package fixtures.controller {

	import flash.events.Event;

	public class ExampleEvent extends Event {

		public static const EXAMPLE:String = "Example";

		public function ExampleEvent() {
			super(EXAMPLE);
		}

		override public function clone():Event {
			return new ExampleEvent();
		}
	}
}