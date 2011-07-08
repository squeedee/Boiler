package minilegs.base {
	public interface Reflection {
		function reflectedClass():Class;

		function reflectionXML():XML;

		function reflect(clazz:Class):Reflection;
	}
}
