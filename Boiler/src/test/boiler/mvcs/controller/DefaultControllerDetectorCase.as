package boiler.mvcs.controller {
	import boiler.base.Lifetime;
	import boiler.reflection.Reflection;
	import boiler.reflection.ReflectionBase;
	import boiler.reflection.Reflector;

	import fixtures.mvcs.reflection.ByClassNameController;
	import fixtures.mvcs.reflection.ControllerByMetadata;
	import fixtures.mvcs.reflection.controller.ControllerByNamespace;
	import fixtures.mvcs.reflection.controller.subNamespace.ControllerByParentNamespace;
	import fixtures.mvcs.reflection.notController.NotAControllerAtAll;

	import org.flexunit.asserts.assertFalse;
	import org.hamcrest.assertThat;

	public class DefaultControllerDetectorCase {
		private var detector:DefaultControllerDetector;
		private var classUnderTest:Class;

		[Before]
		public function setup():void {
			var lifetime:Lifetime = new Lifetime();
			lifetime.mapClass(Reflection, ReflectionBase);
			lifetime.mapSingleton(Reflector);
			detector = new DefaultControllerDetector();
			lifetime.injectInto(detector);
		}

		[After]
		public function teardown():void {
			detector = null;
			classUnderTest = null;
		}

		[Test(
				given="A class with a non leaf namespace 'controller'",
				it="It detects a class with a non-leaf namespace 'controller'"
				)]
		public function ItDetectsAClassWIthANonLeafNamespaceController():void {
			withControllerByParentNamespace();
			assertThat(detector.isController(classUnderTest));
		}

		[Test(
				given="A class with a leaf namespace 'controller'",
				it="It detects a class with a leaf namespace 'controller'"
				)]
		public function ItDetectsAClassWIthALeafNamespaceController():void {
			withControllerByNamespace();
			assertThat(detector.isController(classUnderTest));
		}

		[Test(
				given="A class with name that ends in 'Controller'",
				it="It detects a class with a name ending in 'Controller'"
				)]
		public function ItDetectsAClassWithANameEndingInController():void {
			withControllerByName();
			assertThat(detector.isController(classUnderTest));
		}

		[Test(
				given="A class marked with controller metadata",
				it="It detects a class with '[Controller]' metadata"
				)]
		public function ItDetectsAClassWithControllerMetadata():void {
			withControllerByMetadata();
			assertThat(detector.isController(classUnderTest));
		}

		[Test(
				given="A class that is not a controller",
				it="It does not detect a class that is not a controller"
				)]
		public function ItDoesNotDetectAClassWithNoControllerNamespace():void {
			withNotAControllerAtAll();
			assertFalse(detector.isController(classUnderTest));
		}

		//************** GIVENS ***************//

		private function withControllerByMetadata():void {
			classUnderTest = ControllerByMetadata;
		}

		private function withControllerByName():void {
			classUnderTest = ByClassNameController;
		}

		private function withControllerByNamespace():void {
			classUnderTest = ControllerByNamespace;
		}

		private function withNotAControllerAtAll():void {
			classUnderTest = NotAControllerAtAll;
		}

		private function withControllerByParentNamespace():void {
			classUnderTest = ControllerByParentNamespace;
		}
	}
}
