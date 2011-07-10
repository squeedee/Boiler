package minilegs.hookableSuspenders {
	import org.swiftsuspenders.InjectionConfig;

	public interface AfterMapClassHandler {
		function afterMapClass(newConfig:InjectionConfig):void;
	}
}
