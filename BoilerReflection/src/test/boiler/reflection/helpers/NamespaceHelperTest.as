package boiler.reflection.helpers {
	import boiler.reflection.Reflection;
	import boiler.reflection.Reflector;

	import fixtures.boiler.reflection.EmptyClass;

	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;

	public class NamespaceHelperTest {

		private var helper:NamespaceHelper;

		[Before]
		public function setup():void {
			var reflection:Reflection = new Reflector().getReflection(EmptyClass);
			helper = new NamespaceHelper(reflection);
		}

		[Test]
		public function it_should_find_a_leaf_namespace():void {
			assertTrue(helper.hasLeafNamespace("reflection"));
		}

		[Test]
		public function it_should_not_find_a_leaf_namespace():void {
			assertFalse(helper.hasLeafNamespace("notanamespace"));
		}

		[Test]
		public function it_should_find_a_non_leaf_namespace():void {
			assertTrue(helper.hasAnyNamespace("fixtures"));

		}

		[Test]
		public function it_should_not_find_a_non_leaf_namespace():void {
			assertFalse(helper.hasAnyNamespace("notanamespace"));
		}

	}
}
