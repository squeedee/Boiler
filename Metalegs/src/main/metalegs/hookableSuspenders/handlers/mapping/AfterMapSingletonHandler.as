package metalegs.hookableSuspenders.handlers.mapping {
	import org.swiftsuspenders.InjectionConfig;

	public interface AfterMapSingletonHandler {
		function afterMapSingleton(newConfig:InjectionConfig):void;
	}
}
