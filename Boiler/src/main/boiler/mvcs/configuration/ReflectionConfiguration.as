package boiler.mvcs.configuration {
	import boiler.base.configuration.ConfigurationBase;
	import boiler.reflection.ClassByInstanceCache;
	import boiler.reflection.Reflection;
	import boiler.reflection.ReflectionBase;
	import boiler.reflection.Reflector;

	public class ReflectionConfiguration extends ConfigurationBase {

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
