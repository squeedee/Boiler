package main.configuration {
	import boiler.base.configuration.ConfigurationBase;

	import main.controller.StopwatchController;
	import main.model.StopwatchTimeModel;
	import main.view.ElapsedTimeMediator;
	import main.view.StartStopButtonMediator;

	public class StopwatchConfiguration extends ConfigurationBase {

		override public function startup():void {

			// models
			lifetime.mapSingleton(StopwatchTimeModel);

			// controllers
			lifetime.mapSingleton(StopwatchController);

			// mediators
			lifetime.mapClass(StartStopButtonMediator, StartStopButtonMediator);
			lifetime.mapClass(ElapsedTimeMediator,ElapsedTimeMediator);
		}

		override public function teardown():void {
			// mediators
			lifetime.unmap(ElapsedTimeMediator);
			lifetime.unmap(StartStopButtonMediator);

			// controllers
			lifetime.unmap(StopwatchController);

			// models
			lifetime.unmap(StopwatchTimeModel);
		}
	}
}
