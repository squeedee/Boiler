package boiler.reflection {
	import flash.utils.Dictionary;

	public class Reflector {

		private var reflections:Dictionary = new Dictionary(false);

		public function getReflection(type:Class):Reflection {
			return reflections[type] || addReflection(type);
		}

		private function addReflection(type:Class):Reflection {
			var reflection:Reflection = new ReflectionImpl();
			reflections[type] = reflection.reflect(type);
			return reflection;
		}
	}
}
