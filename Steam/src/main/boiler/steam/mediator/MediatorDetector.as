package boiler.steam.mediator {
	import boiler.steam.mediator.map.MediatorFactory;

	// FIXME: I think i've gone and messed up responsibility. Detector only needs to assert that this IS as mediator.
	// FIXME: The "configuration" aspect is a seperate class to run after it's detected.
	public interface MediatorDetector {
		function getConfigurationFor(mediatorType:Class):MediatorFactory;
	}
}
