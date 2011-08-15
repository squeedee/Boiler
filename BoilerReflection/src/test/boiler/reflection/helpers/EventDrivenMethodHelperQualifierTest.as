package boiler.reflection.helpers {
	import boiler.reflection.Reflection;
	import boiler.reflection.Reflector;

	import fixtures.boiler.reflection.helpers.eventDrivenMethodHelper.TestMethods;

	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;

	public class EventDrivenMethodHelperQualifierTest {

		private var helper:EventDrivenMethodHelper;
		private var reflection:Reflection;

		[Before]
		public function setup():void {
			var reflector:Reflector = new Reflector();
			helper = new EventDrivenMethodHelper(reflector);
			reflection = reflector.getReflection(TestMethods);
		}

		[Test]
		public function it_should_qualify_when_only_parameter_is_an_event():void {
			var methodDefinition:XML = getDefinitionFor("hasOneEventParameter");
			assertTrue(helper.isEventDrivenMethodDefinition(methodDefinition));
		}

		[Test]
		public function it_should_qualify_when_only_required_parameter_is_an_event():void {
			var methodDefinition:XML = getDefinitionFor("hasOneEventParameterAndOneOptionalParameter");
			assertTrue(helper.isEventDrivenMethodDefinition(methodDefinition));
		}

		[Test]
		public function it_should_not_qualify_with_no_parameters():void {
			var methodDefinition:XML = getDefinitionFor("hasNoParameters");
			assertFalse(helper.isEventDrivenMethodDefinition(methodDefinition));
		}

		[Test]
		public function it_should_not_qualify_with_more_than_one_required_parameters():void {
			var methodDefinition:XML = getDefinitionFor("hasTwoNonOptionalParameters");
			assertFalse(helper.isEventDrivenMethodDefinition(methodDefinition));
		}

		[Test]
		public function it_should_not_qualify_with_one_non_event_parameter():void {
			var methodDefinition:XML = getDefinitionFor("hasOneNonEventParameter");
			assertFalse(helper.isEventDrivenMethodDefinition(methodDefinition));
		}

		private function getDefinitionFor(methodName:String):XML {
			var methodDefinition:XML = reflection.findMethodByName(methodName);
			assertNotNull(methodDefinition);
			return methodDefinition;
		}

	}
}
