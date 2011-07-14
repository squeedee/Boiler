package metalegs.reflection {
	import flash.utils.Dictionary;

	import metalegs.base.*;

	public class Reflector {

		[Inject]
		public var lifetime:Lifetime;

		private var reflections:Dictionary = new Dictionary(false);

		public function getReflection(type:Class):Reflection {
			return reflections[type] || addReflection(type);
		}

		private function addReflection(type:Class):ReflectionBase {
			var reflection:ReflectionBase = lifetime.getInstance(ReflectionBase);
			reflections[type] = reflection.reflect(type);
			return reflection;
		}
	}
}
