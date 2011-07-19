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

	import org.robotlegs.demos.imagegallery.controller.SearchGalleryEvent;

	import org.robotlegs.demos.imagegallery.remote.services.IGalleryImageService;
	import org.robotlegs.demos.imagegallery.views.components.GalleryLabel;

	public class GalleryLabelMediator {

		[Inject]
		public var service:IGalleryImageService;

		[Inject]
		public var notifier:IEventDispatcher;

		private var view:GalleryLabel;

		public function register(view:GalleryLabel):void {

			this.view = view;

			view.text = "interestingness";

			// todo: it would be nice if notifier was a better version of event dispatcher with the type detection magic built in
			// todo: better still, use signals
			notifier.addEventListener(SearchGalleryEvent.SEARCH, handleSearch);

			view.visible = view.includeInLayout = service.searchAvailable;
		}

		public function deregister():void {
			view.removeEventListener(SearchGalleryEvent.SEARCH, handleSearch);
		}

		protected function handleSearch(event:SearchGalleryEvent):void {
			this.view.text = event.term;
		}
	}
}