package org.robotlegs.demos.imagegallery.controller {

	import flash.events.Event;

	public class LoadGalleryEvent extends Event {

		public static const LOAD:String = "loadGallery";

		public function LoadGalleryEvent() {
			super(LOAD);
		}

		override public function clone():Event {
			return new LoadGalleryEvent();
		}
	}
}