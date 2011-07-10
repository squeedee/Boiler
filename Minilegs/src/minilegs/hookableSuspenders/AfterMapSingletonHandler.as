package minilegs.hookableSuspenders {
	import org.swiftsuspenders.InjectionConfig;

	public interface AfterMapSingletonHandler {
		function afterMapValue(newConfig:InjectionConfig):void;
	}
}
