package boiler.steam.configuration {
	import boiler.base.configuration.ConfigurationBase;
	import boiler.reflection.ClassByInstanceCache;
	import boiler.reflection.Reflection;
	import boiler.reflection.ReflectionImpl;
	import boiler.reflection.Reflector;
	import boiler.reflection.helpers.SimpleEventClassHelper;

	public class ReflectionConfiguration extends ConfigurationBase {

		override public function startup():void {
			lifetime.mapClass(Reflection, ReflectionImpl);
			lifetime.mapSingleton(Reflector);
			lifetime.mapSingleton(SimpleEventClassHelper);
			lifetime.mapSingleton(ClassByInstanceCache);
		}

		override public function teardown():void {
			lifetime.unmap(ClassByInstanceCache);
			lifetime.unmap(SimpleEventClassHelper);
			lifetime.unmap(Reflector);
			lifetime.unmap(Reflection);
		}
	}
}
