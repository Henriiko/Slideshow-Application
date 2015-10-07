package mvc
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	public class SlideShowView extends View
	{
		private var _loader:Loader;
		public var loaderContent:MovieClip;
		public var bg:Shape;
		public var container:Sprite;
		
		public function SlideShowView(c:Sprite)
		{
			container = c;
			container.buttonMode = true;
			bg = Shape(container.getChildAt(0));
			_loader = new Loader();
			container.addChild(_loader);
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoaded);
		}
	
		override public function update(event:Event = null):void
		{
			_loader.unload();
			_loader.load(new URLRequest(model.currentFile));
		}
		
		
		private function imageLoaded(event:Event):void
		{
			loaderContent = _loader.content as MovieClip;
			container.addChild(_loader);
		}
		
		
	
	}
}