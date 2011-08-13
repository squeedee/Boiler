package boiler.steam.controller {
	import boiler.base.Lifetime;
	import boiler.reflection.Reflection;
	import boiler.reflection.ReflectionImpl;
	import boiler.reflection.Reflector;

	import fixtures.boiler.steam.detector.ByClassNameController;
	import fixtures.boiler.steam.detector.ControllerByMetadata;
	import fixtures.boiler.steam.detector.controller.ControllerByNamespace;
	import fixtures.boiler.steam.detector.notController.NotAControllerAtAll;

	import org.flexunit.asserts.assertFalse;
	import org.hamcrest.assertThat;

	public class DefaultControllerDetectorCase {
		private var detector:DefaultControllerDetector;
		private var classUnderTest:Class;

		[Before]
		public function setup():void {
			var lifetime:Lifetime = new Lifetime();
			lifetime.mapClass(Reflection, ReflectionImpl);
			lifetime.mapSingleton(Reflector);
			detector = new DefaultControllerDetector();
			lifetime.injectInto(detector);
		}

		[Test]
		public function it_detects_a_controller_by_namespace():void {
			classUnderTest = ControllerByNamespace;
			assertThat(detector.isController(classUnderTest));
		}

		[Test]
		public function it_detects_a_controller_by_class_name_suffix():void {
			classUnderTest = ByClassNameController;
			assertThat(detector.isController(classUnderTest));
		}

		[Test]
		public function it_detects_a_controller_by_metadata():void {
			classUnderTest = ControllerByMetadata;
			assertThat(detector.isController(classUnderTest));
		}

		[Test]
		public function it_does_not_detect_a_non_controller():void {
			classUnderTest = NotAControllerAtAll;
			assertFalse(detector.isController(classUnderTest));
		}

	}
}
