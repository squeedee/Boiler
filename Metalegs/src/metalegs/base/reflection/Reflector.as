package metalegs.base.reflection {
	import flash.utils.Dictionary;

	import metalegs.base.*;
	import metalegs.base.util.*;
	import metalegs.mvcs.reflection.MVCSReflection;

	public class Reflector {

		[Inject]
		public var lifetime:Lifetime;

		private var reflections:Dictionary = new Dictionary(false);

		public function getReflection(type:Class):Reflection {
			return reflections[type] || addReflection(type);
		}

		private function addReflection(type:Class):Reflection {
			var reflection:MVCSReflection = lifetime.getInstance(Reflection);
			reflections[type] = reflection.reflect(type);
			return reflection;
		}
	}
}
