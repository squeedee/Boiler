package minilegs.base.reflection {
	public interface Reflection {
		function source():Class;

		function xml():XML;

		function reflect(type:Class):Reflection;

		function fqn():String;
	}
}
