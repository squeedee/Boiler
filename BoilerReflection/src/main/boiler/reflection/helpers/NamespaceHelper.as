package boiler.reflection.helpers {
	import boiler.reflection.Reflection;

	public class NamespaceHelper {
		private var _reflection:Reflection;

		public function NamespaceHelper(reflection:Reflection) {
			_reflection = reflection;
		}

		public function hasAnyNamespace(anyNamespaceCalled:String):Boolean {
			return (_reflection.fqn().search("\\.*" + anyNamespaceCalled + "[:.]") >= 0);
		}

		public function hasLeafNamespace(leafNamespaceCalled:String):Boolean {
			return (_reflection.fqn().search("\\.*" + leafNamespaceCalled + ":") >= 0);
		}

	}
}
