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
		private var previousFile:String;
		
		
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
			if (model.currentFile != previousFile)
			{
				_loader.unload();
				_loader.load(new URLRequest(model.currentFile));
				previousFile = model.currentFile;
				trace(loaderContent.currentLabels.length);
			
			}else if (loaderContent)
			{
				loaderContent.gotoAndPlay(loaderContent.currentLabels[model.currentLabel].name);
			}
				
		}
		
		private function imageLoaded(event:Event):void
		{
			loaderContent = _loader.content as MovieClip;
			model.totalLabels = loaderContent.currentLabels.length;
			
			container.addChild(_loader);
			loaderContent.gotoAndPlay(loaderContent.currentLabels[model.currentLabel].name);
		}
		
		
	
	}
}