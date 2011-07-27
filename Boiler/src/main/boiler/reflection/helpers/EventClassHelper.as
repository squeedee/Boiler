package boiler.reflection.helpers {
	import boiler.reflection.Reflection;
	import boiler.reflection.Reflector;

	public class EventClassHelper {

		[Inject]
		public var reflector:Reflector;

		/**
		 * Finds the 'type' of a simple event. A simple event is one with only once Constant definition.
		 * @param eventClass
		 * @return
		 */
		public function findSimpleEventType(eventClass:Class):String {
			var reflection:Reflection = reflector.getReflection(eventClass);

			const classConstants:XMLList = reflection.classConstants();

			if (classConstants.length() != 1)
				throw new EventClassNotSimpleError(reflection.fqn());

			var soleConstantName:String = classConstants[0].@name;
			return eventClass[soleConstantName];
		}
	}
}
