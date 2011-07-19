/*
 Inversion of Control/Dependency Injection Using Robotlegs
 Image Gallery

 Any portion of this demonstration may be reused for any purpose where not
 licensed by another party restricting such use. Please leave the credits intact.

 Joel Hooks
 http://joelhooks.com
 joelhooks@gmail.com
 */
package org.robotlegs.demos.imagegallery.views.mediators {
	import flash.events.IEventDispatcher;

	import org.robotlegs.demos.imagegallery.controller.LoadGalleryEvent;

	import org.robotlegs.demos.imagegallery.controller.SearchGalleryEvent;

	import org.robotlegs.demos.imagegallery.controller.SelectImageEvent;

	import org.robotlegs.demos.imagegallery.models.vo.GalleryImage;
	import org.robotlegs.demos.imagegallery.remote.services.GalleryLoadedEvent;
	import org.robotlegs.demos.imagegallery.views.components.GalleryView;

	public class GalleryViewMediator {

		[Inject]
		public var notifier:IEventDispatcher;

		private var view:GalleryView;

		public function register(view:GalleryView):void {

			this.view = view;

			view.addEventListener(SelectImageEvent.SELECT,onImageSelected);

			notifier.addEventListener(GalleryLoadedEvent.LOADED, onGalleryLoaded);
			notifier.addEventListener(SearchGalleryEvent.SEARCH, onSearch);

			notifier.dispatchEvent(new LoadGalleryEvent());
		}

		public function deregister():void {
			view.removeEventListener(SelectImageEvent.SELECT,onImageSelected);
			notifier.removeEventListener(GalleryLoadedEvent.LOADED, onGalleryLoaded);
			notifier.removeEventListener(SearchGalleryEvent.SEARCH, onSearch);
		}

		protected function selectImage(image:GalleryImage):void {
			view.imageSource = image.URL;
			notifier.dispatchEvent(new SelectImageEvent(image));
		}

		protected function onGalleryLoaded(event:GalleryLoadedEvent):void {
			view.dataProvider = event.gallery.photos;
			selectImage(event.gallery.photos[0] as GalleryImage);
		}

		protected function onImageSelected(event:SelectImageEvent):void {
			this.selectImage(event.image);
		}

		protected function onSearch(event:SearchGalleryEvent):void {
			view.setThumbScrollPosition(0);
		}
	}
}