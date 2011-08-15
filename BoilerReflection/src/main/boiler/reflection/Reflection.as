package boiler.reflection {
	public interface Reflection {
		function reflect(type:Class):Reflection;

		function source():Class;

		function type():XML;

		function fqn():String;

		function instance():XML;

		function classConstants():XMLList;

		function classMetadata():XMLList;

		function methods():XMLList;

		function findMethodByName(name:String):XML;
	}
}
