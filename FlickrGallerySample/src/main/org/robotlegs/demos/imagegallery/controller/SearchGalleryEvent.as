package org.robotlegs.demos.imagegallery.controller {

	import flash.events.Event;

	public class SearchGalleryEvent extends Event {

		public static const SEARCH:String = "searchGallery";
		private var _term:String;

		public function SearchGalleryEvent(term:String = null) {
			super(SEARCH);
			_term = term;
		}

		public function get term():String {
			return _term;
		}

		override public function clone():Event {
			return new SearchGalleryEvent(term);
		}
	}
}