package fixtures.mvcs.reflection {
	import flash.events.Event;

	/**
	 * A class that has a method that looks like a controller method,
	 * however the class does not match any criteria for being a controller.
	 */
	public class NotAControllerAtAll {

		public function looksLikeAControllerMethod(event:Event):void {

		}

	}
}
