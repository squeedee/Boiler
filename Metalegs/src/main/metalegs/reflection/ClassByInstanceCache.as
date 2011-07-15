package metalegs.reflection {
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	public class ClassByInstanceCache {

		private var cache:Dictionary = new Dictionary();

		public function getClassByInstance(instance:Object):Class {
			return cache[instance] ||= getDefinitionByName(getQualifiedClassName(instance));
		}

	}
}
