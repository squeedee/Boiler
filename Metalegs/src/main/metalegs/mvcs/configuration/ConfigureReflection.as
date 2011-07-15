package metalegs.mvcs.configuration {
	import metalegs.base.configuration.ConfigurationBase;
	import metalegs.reflection.ClassByInstanceCache;
	import metalegs.reflection.Reflection;
	import metalegs.reflection.ReflectionBase;
	import metalegs.reflection.Reflector;

	public class ConfigureReflection extends ConfigurationBase {

		override public function startup():void {
			lifetime.mapClass(Reflection, ReflectionBase);
			lifetime.mapSingleton(Reflector);
			lifetime.mapSingleton(ClassByInstanceCache);
		}

		override public function teardown():void {
			lifetime.unmap(ClassByInstanceCache);
			lifetime.unmap(Reflector);
			lifetime.unmap(Reflection);
		}
	}
}
