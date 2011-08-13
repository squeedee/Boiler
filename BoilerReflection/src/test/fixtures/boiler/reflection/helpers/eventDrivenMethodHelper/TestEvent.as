package fixtures.boiler.reflection.helpers.eventDrivenMethodHelper {
	import flash.events.Event;

	public class TestEvent extends Event {

		public static const TEST:String = "test";

		public function TestEvent(type:String) {
			super(type);
		}

		override public function clone():Event {
			return new TestEvent(type);
		}

	}
}