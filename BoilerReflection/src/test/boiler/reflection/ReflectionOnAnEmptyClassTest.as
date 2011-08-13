package boiler.reflection {
	import fixtures.boiler.reflection.EmptyClass;

	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	public class ReflectionOnAnEmptyClassTest {

		private var reflection:Reflection;

		[Before]
		public function setup():void {
			reflection = new ReflectionImpl().reflect(EmptyClass);
		}

		[Test]
		public function it_should_find_a_leaf_namespace():void {
			assertTrue(reflection.hasLeafNamespace("reflection"));
		}

		[Test]
		public function it_should_not_find_a_leaf_namespace():void {
			assertFalse(reflection.hasLeafNamespace("notanamespace"));
		}

		[Test]
		public function it_should_find_a_non_leaf_namespace():void {
			assertTrue(reflection.hasAnyNamespace("fixtures"));

		}

		[Test]
		public function it_should_not_find_a_non_leaf_namespace():void {
			assertFalse(reflection.hasAnyNamespace("notanamespace"));
		}

		[Test]
		public function it_should_have_no_methods():void {
			assertThat(reflection.methods().length(), equalTo(0));
		}

	}
}
