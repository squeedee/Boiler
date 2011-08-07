package boiler.steam.mediator {
	import flash.display.DisplayObject;

	public interface MediatorSugar {
		function register(view:DisplayObject):MediatorSugar;

		function deregister():MediatorSugar;

	}
}
