package boiler.demos.googlemaps.model
{
	import boiler.demos.googlemaps.model.vos.MarkerVO;

	public class MarkersListModel
	{
		public function MarkersListModel()
		{
			trace( this, 'constructor' );
		}
		
		private var _markersList : Vector.<MarkerVO>;

		public function get markersList():Vector.<MarkerVO>{
			return _markersList;
		}

		public function set markersList(value:Vector.<MarkerVO>):void{
			_markersList = value;
			_isSet = true;
		}
		
		private var _isSet : Boolean = false;

		public function get isSet():Boolean{
			return _isSet;
		}


	}
}