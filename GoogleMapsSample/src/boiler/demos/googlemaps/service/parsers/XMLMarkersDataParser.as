package boiler.demos.googlemaps.service.parsers
{
	import boiler.demos.googlemaps.model.vos.MarkerVO;

	public class XMLMarkersDataParser implements IMarkersDataParser
	{
		public function XMLMarkersDataParser()
		{
			trace( this, 'constructor' );
		}
		
		public function parseMarkersData(rawData:String):Vector.<MarkerVO>
		{
			trace( this, 'parseMarkersData' );
			
			var rawXML : XML = new XML( rawData );
			
			var markersXML : XMLList = rawXML.marker;
			var markersList : Vector.<MarkerVO> = new Vector.<MarkerVO>();
			var i : int;
			var n : int = markersXML.length();
			for( i = 0; i < n; i++ ){
				var marker : MarkerVO = new MarkerVO();
				var markerXML : XML = markersXML[ i ];
				marker.body = markerXML.@body;
				marker.fotoURL = markerXML.@foto;
				marker.headline = markerXML.@headline;
				marker.address = markerXML.@adres;
				marker.city = markerXML.@stad;
				marker.lat = markerXML.@lat;
				marker.lng = markerXML.@lng;
				markersList.push( marker );
			}
			return markersList;
			
		}
	}
}