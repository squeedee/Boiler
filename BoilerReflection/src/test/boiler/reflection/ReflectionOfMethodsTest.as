package boiler.reflection {
	import fixtures.boiler.reflection.ClassWithMethods;

	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertNull;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	public class ReflectionOfMethodsTest {

		private var reflection:Reflection;

		[Before]
		public function setup():void {
			reflection = new ReflectionImpl().reflect(ClassWithMethods);
		}

		[Test]
		public function it_should_have_two_methods():void {
			assertThat(reflection.methods().length(), equalTo(2));
		}

		[Test]
		public function it_should_find_a_method_definition():void {
			assertNotNull(reflection.findMethodByName("methodB"));
		}

		[Test]
		public function it_should_not_find_a_method():void {
			assertNull(reflection.findMethodByName("NotKnown"));
		}

	}
}
