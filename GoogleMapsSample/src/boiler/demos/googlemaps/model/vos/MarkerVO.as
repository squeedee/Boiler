package boiler.demos.googlemaps.model.vos
{
	public class MarkerVO
	{
		public function MarkerVO()
		{
		}
		
		private var _headline : String;

		public function get headline():String{
			return _headline;
		}

		public function set headline(value:String):void{
			_headline = value;
		}
		
		private var _fotoURL : String

		public function get fotoURL():String{
			return _fotoURL;
		}

		public function set fotoURL(value:String):void{
			_fotoURL = value;
		}
		
		private var _body : String;

		public function get body():String{
			return _body;
		}

		public function set body(value:String):void{
			_body = value;
		}
		
		private var _lat : Number

		public function get lat():Number{
			return _lat;
		}

		public function set lat(value:Number):void{
			_lat = value;
		}
		
		private var _lng : Number;

		public function get lng():Number{
			return _lng;
		}

		public function set lng(value:Number):void{
			_lng = value;
		}

		private var _city : String

		public function get city():String{
			return _city;
		}

		public function set city(value:String):void{
			_city = value;
		}
		
		private var _address : String

		public function get address():String{
			return _address;
		}

		public function set address(value:String):void{
			_address = value;
		}

	}
}