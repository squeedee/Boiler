package boiler.reflection {
	import fixtures.boiler.reflection.EmptyClassWithMetadata;

	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;
	import org.hamcrest.number.greaterThan;

	public class ReflectionOnAnEmptyClassWithMetadataTest {

		private var reflection:Reflection;

		[Before]
		public function setup():void {
			reflection = new ReflectionImpl().reflect(EmptyClassWithMetadata);
		}

		[Test]
		public function it_should_have_class_instance_XML():void {
			assertNotNull(reflection.instance());
		}

		[Test]
		public function it_should_have_class_metadata():void {
			assertTrue(reflection.classMetadata().length(), greaterThan(0));
		}

	}
}


