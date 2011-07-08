package minilegs.base {
	public interface Reflection {
		function source():Class;

		function xml():XML;

		function reflect(clazz:Class):Reflection;
	}
}
