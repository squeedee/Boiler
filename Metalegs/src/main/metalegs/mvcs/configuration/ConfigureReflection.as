package metalegs.mvcs.configuration {
	import metalegs.base.configuration.Configuration;
	import metalegs.base.reflection.Reflection;
	import metalegs.base.reflection.Reflector;
	import metalegs.mvcs.reflection.MVCSReflection;

	public class ConfigureReflection extends Configuration {

		override public function startup():void {
			lifetime.mapClass(Reflection, MVCSReflection);
			lifetime.mapSingleton(Reflector);
		}
	}
}
