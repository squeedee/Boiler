package boiler.commandExtension {
	import fixtures.controller.ExampleCommand;

	import org.flexunit.asserts.assertTrue;

	public class DefaultCommandDetectorCase {
		private var classUnderTest:Class;
		private var commandDetector:CommandDetector;

		[Before]
		public function setup():void {
			commandDetector =  new DefaultCommandDetector();
		}

		[Test(
				given="A class conforming to the Command Convention",
				it="should detect it as a Command Class"
				)]
		public function itShouldDetectItAsACommandClass():void {
			withCommandClass();
			assertTrue(commandDetector.isCommand(classUnderTest));

		}


		private function withCommandClass():void {
			classUnderTest = ExampleCommand;
		}

	}
}
