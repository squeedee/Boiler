package boiler.demos.googlemaps.service.parsers
{
	import boiler.demos.googlemaps.model.vos.MarkerVO;

	public interface IMarkersDataParser
	{
		function parseMarkersData( rawData : String ) : Vector.<MarkerVO>;
	}
}