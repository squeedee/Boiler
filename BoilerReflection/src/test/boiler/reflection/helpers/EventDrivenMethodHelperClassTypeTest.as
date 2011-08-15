package boiler.reflection.helpers {
	import boiler.reflection.Reflection;
	import boiler.reflection.Reflector;

	import fixtures.boiler.reflection.helpers.eventDrivenMethodHelper.TestEvent;
	import fixtures.boiler.reflection.helpers.eventDrivenMethodHelper.TestMethods;

	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertNull;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	public class EventDrivenMethodHelperClassTypeTest {

		private var helper:EventDrivenMethodHelper;
		private var reflection:Reflection;

		[Before]
		public function setup():void {
			var reflector:Reflector = new Reflector();
			helper = new EventDrivenMethodHelper(reflector);
			reflection = reflector.getReflection(TestMethods);
		}

		[Test]
		public function it_should_provide_the_event_class_type():void {
			var methodDefinition:XML = getDefinitionFor("hasOneEventParameter");
			assertThat(helper.getEventFromMethodDefinition(methodDefinition), equalTo(TestEvent));
		}

		[Test]
		public function it_should_provide_null_for_the_event_class_type():void {
			var methodDefinition:XML = getDefinitionFor("hasNoParameters");
			assertNull(helper.getEventFromMethodDefinition(methodDefinition));
		}

		private function getDefinitionFor(methodName:String):XML {
			var methodDefinition:XML = reflection.findMethodByName(methodName);
			assertNotNull(methodDefinition);
			return methodDefinition;
		}

	}
}
