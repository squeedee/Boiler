package fixtures.mvcs.reflection.notController {
	import flash.events.Event;

	/**
	 * A class that has a method that looks like a controller method,
	 * however the class does not match any criteria for being a controller.
	 * Even tho, its namepace and class name mention the word 'controller'
	 */
	public class NotAControllerAtAll {

		public function looksLikeAControllerMethod(event:Event):void {

		}

	}
}
