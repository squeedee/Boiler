package fixtures.notController {
	import fixtures.controller.ExampleEvent;

	/** Example of 'almost' a command - without an acceptable namespace **/
	public class CommandWithoutNamespace {

		public function execute(event:ExampleEvent):void {

		}
	}
}
