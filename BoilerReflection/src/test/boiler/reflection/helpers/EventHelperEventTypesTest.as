package boiler.reflection.helpers {
	import boiler.reflection.Reflection;
	import boiler.reflection.Reflector;

	import fixtures.boiler.reflection.helpers.eventDrivenMethodHelper.ComplexTestEvent;

	import fixtures.boiler.reflection.helpers.eventDrivenMethodHelper.TestEvent;

	import fixtures.boiler.reflection.helpers.eventDrivenMethodHelper.TestMethods;

	import org.hamcrest.assertThat;
	import org.hamcrest.collection.hasItem;
	import org.hamcrest.collection.hasItems;
	import org.hamcrest.object.equalTo;

	public class EventHelperEventTypesTest {

		private var helper:EventHelper;
		private var reflection:Reflection;

		[Before]
		public function setup():void {
			var reflector:Reflector = new Reflector();
			helper = new EventHelper(reflector);
			reflection = reflector.getReflection(TestMethods);
		}

		[Test]
		public function it_should_find_one_type():void {
			var result:Array = helper.getEventsFromEventType(TestEvent);
			assertThat(result, hasItem("test"))
		}

		[Test]
		public function it_should_find_two_types():void {
			var result:Array = helper.getEventsFromEventType(ComplexTestEvent);
			assertThat(result.length, equalTo(2));
		}

		[Test]
		public function it_should_find_distinct_types():void {
			var result:Array = helper.getEventsFromEventType(ComplexTestEvent);
			assertThat(result, hasItems("FirstEventType","SecondEventType"));
		}


	}
}
