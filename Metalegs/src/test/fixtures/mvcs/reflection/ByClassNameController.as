package fixtures.mvcs.reflection {
	import flash.events.Event;

	/**
	 * A class that would be detected as a controller because of it's class name ending in Controller
	 */
	public class ByClassNameController {

		public function anAction(event:Event):void {

		}
		
	}
}
