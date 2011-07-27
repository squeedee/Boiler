package boiler.mvcs.mediator {
	import boiler.mvcs.mediator.map.MediatorFactory;

	public interface MediatorDetector {
		function getConfigurationFor(mediatorType:Class):MediatorFactory;
	}
}
