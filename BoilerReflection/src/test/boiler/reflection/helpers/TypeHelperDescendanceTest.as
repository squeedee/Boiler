package boiler.reflection.helpers {
	import boiler.reflection.Reflector;

	import fixtures.boiler.reflection.helpers.eventDrivenMethodHelper.TestEvent;

	import flash.display.DisplayObject;
	import flash.events.Event;

	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;

	public class TypeHelperDescendanceTest {
		private var helper:TypeHelper;

		[Before]
		public function setup():void {
			helper = new TypeHelper(new Reflector());
		}

		[Test]
		public function it_should_return_true_for_the_same_class():void {
			assertTrue(
					helper.type(TestEvent).isA(TestEvent)
			);
		}

		[Test]
		public function it_should_return_false_for_a_non_parent_class():void {
			assertFalse(
					helper.type(TestEvent).isA(DisplayObject)
			);
		}

		[Test]
		public function it_should_return_true_for_a_parent_class():void {
			assertTrue(
					helper.type(TestEvent).isA(Event)
			);
		}

	}
}
