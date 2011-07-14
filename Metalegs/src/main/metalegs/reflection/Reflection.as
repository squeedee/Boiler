package metalegs.reflection {
	public interface Reflection {
		function reflect(type:Class):Reflection;

		function source():Class;

		function type():XML;

		function fqn():String;

		function instance():XML;

		function hasAnyNamespace(anyNamespaceCalled:String):Boolean;

		function hasLeafNamespace(leafNamespaceCalled:String):Boolean;

		function classConstants():XMLList;

		function classMetadata():XMLList;
	}
}
