package mvc
{
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	public class SlideShowView extends View
	{
		private var loader:Loader;
		private var bmp:Bitmap;
		public var loaderContent:MovieClip;
		public var bg:Shape;
		public var container:Sprite;
		
		public function SlideShowView(c:Sprite)
		{
			container = c;
			container.buttonMode = true;
			bg = Shape(container.getChildAt(0));
			bmp = new Bitmap();
			loader = new Loader();
			container.addChild(bmp);
			container.addChild(loader);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoaded);
		}
	
		override public function update(event:Event = null):void
		{
			if(loader.width > 0)
			{
				container.addChild(bmp);
				bmp.alpha = 1;
				bmp.bitmapData = new BitmapData(loader.content.width, loader.content.height);
				bmp.bitmapData.draw(loader);
				TweenLite.to(bmp, 0.5, {alpha:0});
				
			}
			loader.unload();
			loader.load(new URLRequest(model.currentFile));
		}
		
		
		private function imageLoaded(event:Event):void
		{
			loaderContent = loader.content as MovieClip;
			container.addChild(loader);
			TweenLite.fromTo(loader, 0.5, {alpha:0}, {alpha:1});
		}
		
		
	
	}
}