package boiler.demos.googlemaps.service
{
	import boiler.demos.googlemaps.model.constants.ApplicationConstants;
	import boiler.demos.googlemaps.model.vos.MarkerVO;
	
	import mx.rpc.Responder;
	import boiler.demos.googlemaps.service.parsers.IMarkersDataParser;

	public class EmbeddedXMLMarkersDataRetrieverService implements IMarkersDataRetrieverService
	{
		public function EmbeddedXMLMarkersDataRetrieverService()
		{
			trace( this, 'constructor' );
		}
		
		[Inject]
		public var parser : IMarkersDataParser;
		
		public function retrieveMarkersData( responder : Responder ):void
		{
			trace( this, 'retrieveMarkersData' );
			var rawData : String = ApplicationConstants.MARKERS_XML.toXMLString();
			var output : Vector.<MarkerVO> = parser.parseMarkersData( rawData );
			responder.result( output );
		}
	}
}