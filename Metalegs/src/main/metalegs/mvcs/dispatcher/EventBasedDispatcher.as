package metalegs.mvcs.dispatcher {
	import flash.events.Event;
	import flash.utils.Dictionary;

	import metalegs.base.Lifetime;
	import metalegs.reflection.ClassByInstanceCache;
	import metalegs.reflection.Reflection;
	import metalegs.reflection.Reflector;

	public class EventBasedDispatcher implements Dispatcher {

		[Inject]
		public var reflector:Reflector;

		[Inject]
		public var lifetime:Lifetime;

		[Inject]
		public var classCache:ClassByInstanceCache;

		[Inject]
		public var connector:EventBasedNotifierConnector;

		private var executionMap:Dictionary = new Dictionary();

		[PostConstruct]
		public function setup():void {
			connector.setHandler(handleSignal);
		}

		public function registerSignalClass(signalClass:Class, targetControllerClass:Class, methodName:String):void {
			connector.connect(findEventType(signalClass));

			executionMap[signalClass] = function(event:Event):void {
				var controller:* = lifetime.getInstance(targetControllerClass);
				controller[methodName].call(null, event);
			}
		}

		private function handleSignal(event:Event):void {
			executionMap[classCache.getClassByInstance(event)].call(null, event);
		}

		// @todo move to reflection util
		private function findEventType(eventClass:Class):String {
			var reflection:Reflection = reflector.getReflection(eventClass);

			const classConstants:XMLList = reflection.classConstants();

			if (classConstants.length() != 1)
				throw new EventBasedDispatcherError(reflection.fqn());

			/*
			 in case it's not obvious, this is a constant lookup..
			 We cant enumerate constants on the class itself because we expect only one - "SimpleEvent"
			 If we enumerate, we get all the constants from flash.event::Event
			 Reflection gives us the locally defined one.
			 */

			var soleConstantName:String = classConstants[0].@name;
			return eventClass[soleConstantName];
		}

		public function destruct():void {
			connector.disconnectAll();
			executionMap = null;
		}

	}
}
