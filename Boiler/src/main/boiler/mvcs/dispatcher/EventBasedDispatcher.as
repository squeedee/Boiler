package boiler.mvcs.dispatcher {
	import boiler.base.Lifetime;
	import boiler.reflection.ClassByInstanceCache;
	import boiler.reflection.Reflection;
	import boiler.reflection.Reflector;
	import boiler.reflection.helpers.EventClassHelper;

	import flash.events.Event;
	import flash.utils.Dictionary;

	public class EventBasedDispatcher implements Dispatcher {

		[Inject]
		public var lifetime:Lifetime;

		[Inject]
		public var classCache:ClassByInstanceCache;

		[Inject]
		public var connector:EventBasedNotifierConnector;

		[Inject]
		public var eventClassReflection:EventClassHelper;

		private var executionMap:Dictionary = new Dictionary();

		[PostConstruct]
		public function setup():void {
			connector.setHandler(handleSignal);
		}

		public function registerSignalClass(signalClass:Class, targetControllerClass:Class, methodName:String):void {
			connector.connect(eventClassReflection.findSimpleEventType(signalClass));
			createExecutor(signalClass, targetControllerClass, methodName);
		}

		private function createExecutor(signalClass:Class, targetControllerClass:Class, methodName:String):void {
			executionMap[signalClass] = function(event:Event):void {
				var controller:* = lifetime.getInstance(targetControllerClass);
				controller[methodName].call(null, event);
			}
		}

		private function handleSignal(event:Event):void {
			executionMap[classCache.getClassByInstance(event)].call(null, event);
		}

		public function destruct():void {
			connector.disconnectAll();
			executionMap = null;
		}

	}
}
