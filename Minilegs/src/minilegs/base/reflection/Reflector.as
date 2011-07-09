package minilegs.base.reflection {
	import flash.utils.Dictionary;

	import minilegs.base.*;
	import minilegs.util.*;

	public class Reflector {

		[Inject]
		public var lifetime:Lifetime;

		private var reflections:Dictionary = new Dictionary(false);

		public function getReflection(clazz:Class):Reflection {
			return reflections[clazz] || addReflection(clazz);
		}

		private function addReflection(clazz:Class):Reflection {
			var reflection:MinilegsReflection = lifetime.getInstance(Reflection);
			reflections[clazz] = reflection.reflect(clazz);
			return reflection;
		}
	}
}
