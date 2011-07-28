package boiler.steam.mediator {
	import boiler.steam.mediator.map.MediatorFactory;

	public interface MediatorDetector {
		function getConfigurationFor(mediatorType:Class):MediatorFactory;
	}
}
