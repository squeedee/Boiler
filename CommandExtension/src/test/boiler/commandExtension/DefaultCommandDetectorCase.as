package boiler.commandExtension {
	import boiler.base.Lifetime;
	import boiler.reflection.Reflection;
	import boiler.reflection.ReflectionBase;
	import boiler.reflection.Reflector;

	import fixtures.controller.DoesNotEndWithCommandSuffix;

	import fixtures.controller.WithoutExecuteCommand;

	import fixtures.controller.ExampleCommand;
	import fixtures.notController.CommandWithoutNamespace;

	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;

	public class DefaultCommandDetectorCase {
		private var classUnderTest:Class;
		private var commandDetector:CommandDetector;

		[Before]
		public function setup():void {
			var lifetime:Lifetime = new Lifetime();
			lifetime.mapClass(Reflection, ReflectionBase);
			lifetime.mapSingleton(Reflector);
			commandDetector = new DefaultCommandDetector();
			lifetime.injectInto(commandDetector);
		}

		[Test]
		public function it_should_detect_a_command():void {
			classUnderTest = ExampleCommand;
			assertTrue(commandDetector.isCommand(classUnderTest));
		}

		[Test]
		public function it_should_not_detect_a_command_without_a_controller_namespace():void {
			classUnderTest = CommandWithoutNamespace;
			assertFalse(commandDetector.isCommand(classUnderTest));
		}

		[Test]
		public function it_should_not_detect_a_command_without_a_command_suffix():void {
			classUnderTest = DoesNotEndWithCommandSuffix;
			assertFalse(commandDetector.isCommand(classUnderTest));
		}

		[Test]
		public function it_should_not_detect_a_command_without_a_public_execute_method():void {
			classUnderTest = WithoutExecuteCommand;
				assertFalse(commandDetector.isCommand(classUnderTest));
		}

	}
}
