package minilegs.hookableSuspenders {
	import org.swiftsuspenders.InjectionConfig;

	public interface BeforeMapSingletonHandler {
		function beforeMapSingleton(existingConfig:InjectionConfig, useSingletonOf:Class):void;
	}
}
