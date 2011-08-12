package boiler.demos.googlemaps.configuration
{
	import boiler.base.configuration.ConfigurationBase;
	import boiler.demos.googlemaps.controller.MarkersController;
	import boiler.demos.googlemaps.model.MarkersListModel;
	import boiler.demos.googlemaps.model.constants.ApplicationConstants;
	import boiler.demos.googlemaps.service.EmbeddedXMLMarkersDataRetrieverService;
	import boiler.demos.googlemaps.service.IMarkersDataRetrieverService;
	import boiler.demos.googlemaps.service.parsers.IMarkersDataParser;
	import boiler.demos.googlemaps.service.parsers.XMLMarkersDataParser;
	import boiler.demos.googlemaps.view.mediators.GoogleMapsMediator;
	import boiler.steam.SteamConfiguration;
	
	import flash.display.DisplayObject;
	
	public class GoogleMapsSampleConfiguration extends ConfigurationBase
	{
		public function GoogleMapsSampleConfiguration()
		{
			trace( this, 'constructor' );
			super();
		}
		
		private var _root : DisplayObject;
		public function set root( value : DisplayObject ) : void{
			_root = value;
		}
		public function get root() : DisplayObject{
			return _root
		}
		
		override public function startup():void
		{
			trace( this, 'startup' );
			this.lifetime.mapValue( DisplayObject, root );
			this.lifetime.runConfiguration( boiler.steam.SteamConfiguration );
			
			this.lifetime.mapValue( String, ApplicationConstants.GMAPS_API_KEY, 'gmapsAPIKey' );
			
			//controller
			this.lifetime.mapClass( MarkersController, MarkersController );
			
			//service
			this.lifetime.mapSingletonOf( IMarkersDataParser, XMLMarkersDataParser );
			this.lifetime.mapSingletonOf( IMarkersDataRetrieverService, EmbeddedXMLMarkersDataRetrieverService );
			
			//model
			this.lifetime.mapSingleton( MarkersListModel );
			
			//view
			this.lifetime.mapClass( GoogleMapsMediator, GoogleMapsMediator );
			
		}
		
		override public function teardown():void
		{
			// TODO Auto Generated method stub
			super.teardown();
		}
		
		
		
	}
}