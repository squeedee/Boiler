package metalegs.mvcs.dispatcher {
	public interface Dispatcher {

		// @todo we could use more fluency: listenFor(MyBigEvent).usingInstanceOf(MyController).call("doMyBigThing")
		
		function registerSignalClass(signalClass:Class, targetControllerClass:Class, methodName:String):void;

		function destruct():void;
	}
}
