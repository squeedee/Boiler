package boiler.demos.googlemaps.controller
{
	import boiler.demos.googlemaps.model.vos.MarkerVO;
	import boiler.demos.googlemaps.model.MarkersListModel;
	import boiler.demos.googlemaps.service.IMarkersDataRetrieverService;
	
	import flash.events.IEventDispatcher;
	
	import mx.rpc.Responder;
	import boiler.demos.googlemaps.controller.events.MarkersListRetrievedEvent;
	import boiler.demos.googlemaps.controller.events.RetrieveMarkersListEvent;

	public class MarkersController
	{
		public function MarkersController()
		{
			trace( this, 'constructor' );
		}
		
		[Inject]
		public var dispatcher : IEventDispatcher;
		
		[Inject]
		public var service : IMarkersDataRetrieverService;
		
		[Inject]
		public var markersModel : MarkersListModel;
		
		public function retrieveMarkersList( event : RetrieveMarkersListEvent ) : void{
			trace( this, 'retrieveMarkersList' );
			if( markersModel.isSet ){
				serveMarkersList();
			}else{
				var responder : Responder = new Responder( handle_retrieveMarkersListSuccess, handle_retrieveMarkersListFailure );
				service.retrieveMarkersData(responder);
			}
		}
		
		private function storeMarkersList( markersList : Vector.<MarkerVO> ):void
		{
			markersModel.markersList = markersList;
		}		
		
		private function serveMarkersList():void
		{
			dispatcher.dispatchEvent( new MarkersListRetrievedEvent( markersModel.markersList ) );
		}
		
		private function handle_retrieveMarkersListFailure():void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function handle_retrieveMarkersListSuccess( markersList : Vector.<MarkerVO> ):void
		{
			storeMarkersList( markersList );
			serveMarkersList();
		}
		
		
		
	}
}