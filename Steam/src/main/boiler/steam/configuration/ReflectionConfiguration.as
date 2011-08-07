package boiler.steam.configuration {
	import boiler.base.configuration.ConfigurationBase;
	import boiler.reflection.ClassByInstanceCache;
	import boiler.reflection.Reflection;
	import boiler.reflection.ReflectionBase;
	import boiler.reflection.Reflector;
	import boiler.reflection.helpers.EventClassHelper;

	public class ReflectionConfiguration extends ConfigurationBase {

		override public function startup():void {
			lifetime.mapClass(Reflection, ReflectionBase);
			lifetime.mapSingleton(Reflector);
			lifetime.mapSingleton(EventClassHelper);
			lifetime.mapSingleton(ClassByInstanceCache);
		}

		override public function teardown():void {
			lifetime.unmap(ClassByInstanceCache);
			lifetime.unmap(EventClassHelper);
			lifetime.unmap(Reflector);
			lifetime.unmap(Reflection);
		}
	}
}
