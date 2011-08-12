package boiler.demos.googlemaps.controller.events
{
	import boiler.demos.googlemaps.model.vos.MarkerVO;
	
	import flash.events.Event;
	
	public class RetrieveMarkersListEvent extends Event
	{
		
		static public const RETRIEVE_MARKERS_LIST : String = 'boiler.demos.googlemaps.view::RetrieveMarkersListEvent#RETRIEVE_MARKERS_LIST';
		
		public function RetrieveMarkersListEvent()
		{
			super(RETRIEVE_MARKERS_LIST);
		}
		
		override public function clone():Event
		{
			return new RetrieveMarkersListEvent();
		}
		
		

	}
}