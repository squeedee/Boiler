package boiler.steam.dispatcher {
	import boiler.base.Lifetime;
	import boiler.reflection.ClassByInstanceCache;
	import boiler.reflection.Reflector;
	import boiler.reflection.helpers.EventHelper;

	import flash.events.Event;
	import flash.utils.Dictionary;

	public class DispatcherImpl implements Dispatcher {
		private var executionMap:Dictionary = new Dictionary();
		private var currentControllerType:Class;
		private var currentMethod:String;
		private var eventHelper:EventHelper;

		[Inject]
		public var lifetime:Lifetime;

		[Inject]
		public var classCache:ClassByInstanceCache;

		[Inject]
		public var connector:NotificationObserver;

		[Inject]
		public var reflector:Reflector;

		[PostConstruct]
		public function setup():void {
			eventHelper = new EventHelper(reflector);
			connector.setHandler(handleEvent);
		}

		private function createExecutor(signalClass:Class, targetControllerClass:Class, methodName:String):void {
			executionMap[signalClass] = function(event:Event):void {
				var controller:* = lifetime.getInstance(targetControllerClass);
				controller[methodName].call(null, event);
			}
		}

		private function handleEvent(event:Event):void {
			executionMap[classCache.getClassByInstance(event)].call(null, event);
		}

		public function destruct():void {
			connector.disconnectAll();
			executionMap = null;
		}

		public function withController(controllerType:Class):Dispatcher {
			currentControllerType = controllerType;
			return this;
		}

		public function invokeMethod(methodName:String):Dispatcher {
			currentMethod = methodName;
			return this;
		}

		public function fromEvent(eventType:Class):Dispatcher {
			var events:Array = eventHelper.getEventsFromEventType(eventType);

			if (events.length == 0)
				return this;

			createExecutor(eventType, currentControllerType, currentMethod);

			for each (var event:String in events) {
				connector.connect(event);
			}

			return this;
		}
	}
}
