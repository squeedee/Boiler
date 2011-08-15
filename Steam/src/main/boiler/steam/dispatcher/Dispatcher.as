package boiler.steam.dispatcher {
	public interface Dispatcher {

		function withController(controllerType:Class):Dispatcher;

		function invokeMethod(methodName:String):Dispatcher

		function fromEvent(eventType:Class):Dispatcher;

		function destruct():void;
	}
}
