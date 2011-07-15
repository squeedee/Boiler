package metalegs.mvcs.dispatcher {
	public interface Dispatcher {
		function registerSignalClass(signalClass:Class, targetControllerClass:Class, methodName:String):void;

		function destruct():void;
	}
}
