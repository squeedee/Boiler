package boiler.steam.mediator.map {
	import boiler.base.Lifetime;

	import flash.display.DisplayObject;

	public class MediatorFactory {
		private var _mediatorType:Class;
		private var _viewType:Class;
		private var _registerMethodName:String;
		private var _deregisterMethodName:String;
		private var _lifetime:Lifetime;

		public function MediatorFactory(lifetime:Lifetime, mediatorType:Class, viewType:Class, registerMethodName:String, deregisterMethodName:String = null) {
			_lifetime = lifetime;
			_mediatorType = mediatorType;
			_viewType = viewType;
			_registerMethodName = registerMethodName;
			_deregisterMethodName = deregisterMethodName;
		}

		private function hasDeregister():Boolean {
			return _deregisterMethodName != null;
		}

		public function registerMediator(view:DisplayObject):* {
			const mediator:* = _lifetime.getInstance(_mediatorType);
			mediator[_registerMethodName].call(null, view);
			return mediator;

		}

		public function deregisterMediator(mediator:*):void {
			if (!hasDeregister())
				return;

			mediator[_deregisterMethodName].call();
		}

		public function get viewType():Class {
			return _viewType;
		}
	}
}
