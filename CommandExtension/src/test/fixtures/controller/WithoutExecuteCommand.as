package fixtures.controller {

	/**
	 * Almost a command, but no public execute method
	 */
	public class WithoutExecuteCommand {
		// This ensures the detector looks for 'public' execute, not that i think you can reflect private methods?
		private function execute(event:ExampleEvent):void {

		}
	}
}
