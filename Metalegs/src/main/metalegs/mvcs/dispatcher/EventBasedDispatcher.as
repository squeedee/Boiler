package metalegs.mvcs.dispatcher {
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	import metalegs.base.Lifetime;
	import metalegs.base.reflection.Reflector;
	import metalegs.mvcs.reflection.MVCSReflection;

	public class EventBasedDispatcher implements Dispatcher {

		[Inject]
		public var notifier:IEventDispatcher;

		[Inject]
		public var reflector:Reflector;

		[Inject]
		public var lifetime:Lifetime;

		private var executionMap:Dictionary = new Dictionary();
		private var eventClassCache:Dictionary = new Dictionary();

		public function registerSignalClass(signalClass:Class, targetControllerClass:Class, methodName:String):void {
			notifier.addEventListener(findEventType(signalClass), handleSignal);

			executionMap[signalClass] = function(event:Event):void {
				var controller:* = lifetime.getInstance(targetControllerClass);
				controller[methodName].call(null, event);
			}
		}

		private function handleSignal(event:Event):void {
			executionMap[getClass(event)].call(null, event);
		}

		private function getClass(event:Event):Object {
			return eventClassCache[event] ||= getDefinitionByName(getQualifiedClassName(event));
		}

		private function findEventType(eventClass:Class):String {
			var reflection:MVCSReflection = MVCSReflection(reflector.getReflection(eventClass));

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

	}
}
