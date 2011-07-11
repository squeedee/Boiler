package metalegs.mvcs.configuration {
	import metalegs.base.configuration.ConfigurationBase;
	import metalegs.base.reflection.Reflection;
	import metalegs.base.reflection.Reflector;
	import metalegs.mvcs.reflection.MVCSReflection;

	public class ConfigureReflection extends ConfigurationBase {

		override public function configure():void {
			lifetime.mapClass(Reflection, MVCSReflection);
			lifetime.mapSingleton(Reflector);
		}
	}
}
