package boiler.reflection {
	import boiler.base.*;

	import flash.utils.Dictionary;

	public class Reflector {

		[Inject]
		public var lifetime:Lifetime;

		private var reflections:Dictionary = new Dictionary(false);

		public function getReflection(type:Class):Reflection {
			return reflections[type] || addReflection(type);
		}

		private function addReflection(type:Class):Reflection {
			var reflection:Reflection = lifetime.getInstance(Reflection);
			reflections[type] = reflection.reflect(type);
			return reflection;
		}
	}
}
