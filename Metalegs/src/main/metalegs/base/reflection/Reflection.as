package metalegs.base.reflection {
	public interface Reflection {
		function source():Class;

		function type():XML;

		function instance():XML;

		function reflect(type:Class):Reflection;

		function fqn():String;
	}
}
