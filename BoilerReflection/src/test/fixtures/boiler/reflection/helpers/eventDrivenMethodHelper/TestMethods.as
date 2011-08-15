package fixtures.boiler.reflection.helpers.eventDrivenMethodHelper {
	public class TestMethods {

		public function hasNoParameters():void {

		}

		public function hasTwoNonOptionalParameters(event:TestEvent, foo:String):void {

		}

		public function hasOneNonEventParameter(objectParameter:Object):void {

		}

		public function hasOneEventParameter(event:TestEvent):void {

		}

		public function hasOneEventParameterAndOneOptionalParameter(event:TestEvent, foo:String = "foo"):void {

		}

	}
}
