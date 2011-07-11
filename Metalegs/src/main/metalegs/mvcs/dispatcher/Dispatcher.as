package metalegs.mvcs.dispatcher {
	public interface Dispatcher {
		function registerSignalClass(signalClass:Class, targetController:*, methodName:String):void;
	}
}
