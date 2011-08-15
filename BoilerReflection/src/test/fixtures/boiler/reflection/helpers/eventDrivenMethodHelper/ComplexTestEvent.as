package fixtures.boiler.reflection.helpers.eventDrivenMethodHelper {
	import flash.events.Event;

	public class ComplexTestEvent extends Event {
		public static const FIRST_EVENT_TYPE:String = "FirstEventType";
		public static const SECOND_EVENT_TYPE:String = "SecondEventType";

		public function ComplexTestEvent(type:String) {
			super(type);
		}

		override public function clone():Event {
			return new ComplexTestEvent(type);
		}

	}
}