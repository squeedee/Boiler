package boiler.demos.googlemaps.controller.events
{
	import boiler.demos.googlemaps.model.vos.MarkerVO;
	
	import flash.events.Event;
	
	public class MarkersListRetrievedEvent extends Event
	{
		static public const MARKERS_DATA_RETRIEVED : String = 'boiler.demos.googlemaps.service::MarkersListRetrievedEvent#MARKERS_DATA_RETRIEVED';
		
		public function MarkersListRetrievedEvent( markersList : Vector.<MarkerVO> )
		{
			_markersList = markersList;
			super(MARKERS_DATA_RETRIEVED);
		}
		
		private var _markersList : Vector.<MarkerVO>

		public function get markersList():Vector.<MarkerVO>{
			return _markersList;
		}

	}
}