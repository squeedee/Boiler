package org.robotlegs.demos.imagegallery.controller {
	import org.robotlegs.demos.imagegallery.models.GalleryModel;
	import org.robotlegs.demos.imagegallery.remote.services.GalleryLoadedEvent;
	import org.robotlegs.demos.imagegallery.remote.services.IGalleryImageService;

	public class GalleryController {
		[Inject]
		public var service:IGalleryImageService;

		[Inject]
		public var galleryModel:GalleryModel;

		public function load(event:LoadGalleryEvent):void {
			service.loadGallery();
		}

		public function update(event:GalleryLoadedEvent):void {
			this.galleryModel.gallery = event.gallery;
		}

		public function search(event:SearchGalleryEvent):void {
			service.search(event.term);
		}

	}

}
