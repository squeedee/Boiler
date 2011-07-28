package main.configuration {
	import boiler.base.configuration.ConfigurationBase;

	import main.controller.StopwatchController;

	import main.model.StopwatchState;
	import main.view.StartStopButtonMediator;

	public class StopwatchConfiguration extends ConfigurationBase {

		override public function startup():void {

			// models
			lifetime.mapSingleton(StopwatchState);

			// controllers
			lifetime.mapSingleton(StopwatchController);

			// mediators
			lifetime.mapClass(StartStopButtonMediator,StartStopButtonMediator)
		}

		override public function teardown():void {
			// mediators
			lifetime.unmap(StartStopButtonMediator);

			// controllers
			lifetime.unmap(StopwatchController);

			// models
			lifetime.unmap(StopwatchState);
		}
	}
}
