package minilegs.base.reflection {
	import flash.utils.Dictionary;

	import minilegs.base.*;
	import minilegs.util.*;

	public class Reflector {

		[Inject]
		public var lifetime:Lifetime;

		private var reflections:Dictionary = new Dictionary(false);

		public function getReflection(type:Class):Reflection {
			return reflections[type] || addReflection(type);
		}

		private function addReflection(type:Class):Reflection {
			var reflection:MinilegsReflection = lifetime.getInstance(Reflection);
			reflections[type] = reflection.reflect(type);
			return reflection;
		}
	}
}
