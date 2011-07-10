package metalegs.mvcs.configuration {
	import metalegs.base.configuration.ConfigurationBase;
	import metalegs.base.util.reflection.Reflection;
	import metalegs.base.util.reflection.Reflector;
	import metalegs.mvcs.controller.ControllerExtension;
	import metalegs.mvcs.util.MVCSReflection;

	public class MVCSConfiguration extends ConfigurationBase {

		override public function configure():void {
			lifetime.mapClass(Reflection,MVCSReflection);
			lifetime.mapSingleton(Reflector);
			lifetime.mappingHandlers.add(ControllerExtension);
		}
	}
}
