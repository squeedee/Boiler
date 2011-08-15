package boiler.reflection {
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	// fixme: Anyone suggest how to test this class?

	public class ClassByInstanceCache {

		private var cache:Dictionary = new Dictionary(true);

		public function getClassByInstance(instance:Object):Class {
			return cache[instance] ||= getDefinitionByName(getQualifiedClassName(instance));
		}

	}
}
