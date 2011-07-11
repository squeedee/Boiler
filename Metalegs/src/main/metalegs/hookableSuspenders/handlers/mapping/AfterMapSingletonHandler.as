package metalegs.hookableSuspenders.handlers.mapping {
	import org.swiftsuspenders.InjectionConfig;

	public interface AfterMapSingletonHandler {
		function afterMapValue(newConfig:InjectionConfig):void;
	}
}
