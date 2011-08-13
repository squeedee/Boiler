package fixtures.controller {
	import flash.events.Event;

	public class ComplexEvent extends Event {

		public static const TYPE_1:String = "type1";
		public static const TYPE_2:String = "type2";

		public function ComplexEvent(type:String) {
			super(type);
		}

		override public function clone():Event {
			return new ComplexEvent(type);
		}

	}
}