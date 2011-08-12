package boiler.demos.googlemaps.service
{
	import mx.rpc.Responder;

	public interface IMarkersDataRetrieverService
	{
		function retrieveMarkersData( responder : Responder ) : void;
	}
}