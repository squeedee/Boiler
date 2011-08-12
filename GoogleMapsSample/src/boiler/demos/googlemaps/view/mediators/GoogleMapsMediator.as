package boiler.demos.googlemaps.view.mediators
{
	import boiler.demos.googlemaps.controller.events.MarkersListRetrievedEvent;
	import boiler.demos.googlemaps.controller.events.RetrieveMarkersListEvent;
	import boiler.demos.googlemaps.view.components.GoogleMapsView;
	
	import com.google.maps.MapEvent;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	public class GoogleMapsMediator
	{
		public function GoogleMapsMediator()
		{
			trace( this, 'constructor' );
		}
		
		[Inject]
		public var dispatcher : IEventDispatcher;
		
		[Inject(name='gmapsAPIKey')]
		public var gmapsAPIKey : String;
		
		private var _view : GoogleMapsView;
		
		public function register( view : GoogleMapsView ) :void{
			trace( this, 'register' );
			
			_view = view;
			_view.gmapsAPIKey = gmapsAPIKey;
			
			_view.addEventListener( MapEvent.MAP_READY, handle_MapReadyEvent );
			
		}
		
		protected function handle_MapReadyEvent(event:MapEvent):void
		{
			dispatcher.addEventListener( MarkersListRetrievedEvent.MARKERS_DATA_RETRIEVED, handle_MarkersDataRetrievedEvent );
			dispatcher.dispatchEvent( new RetrieveMarkersListEvent() );
		}
		
		private function handle_MarkersDataRetrievedEvent( event : MarkersListRetrievedEvent ):void
		{
			trace( this, 'handle_MarkersDataRetrievedEvent' );
			_view.markersList = event.markersList;
		}
	}
}