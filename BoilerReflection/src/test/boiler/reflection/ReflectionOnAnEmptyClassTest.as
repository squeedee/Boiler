package boiler.reflection {
	import fixtures.boiler.reflection.EmptyClass;

	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	public class ReflectionOnAnEmptyClassTest {

		private var reflection:Reflection;

		[Before]
		public function setup():void {
			reflection = new ReflectionImpl().reflect(EmptyClass);
		}

		[Test]
		public function it_should_have_no_methods():void {
			assertThat(reflection.methods().length(), equalTo(0));
		}

	}
}
