package mvc
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	
	public class Model extends EventDispatcher
	{
		public var currentIndex:int = 0;
		public var currentLabel:int = 0;
		public var totalLabels:int;
		public var totalItems:int = 0;
		protected var loader:URLLoader;
		public var data:*;
		
		public static const MODEL_CHANGE:String = 'modelChange';
		public static const LABEL_CHANGE:String = 'labelChange';
		
		public function Model()
		{
			loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, dataLoaded);
		}
		
		public function load(req:URLRequest):void
		{
			loader.load(req);
		}
		
		public function setCurrentIndex(index:int, label:int):void
		{
			trace('setCurrentIndex');
			currentIndex = index;
			currentLabel = label;
			controlCurrentIndex();
			updateData();
			dispatchEvent(new Event(Model.MODEL_CHANGE));
		}
		
		protected function updateData():void
		{
			
		}
		
		protected function controlCurrentIndex():void
		{
			if(currentIndex >= totalItems)
			{
				currentIndex = 0;
			}
			else if(currentIndex < 0)
			{
				currentIndex = totalItems - 1;
			}
		}
		
		protected function controlCurrentLabel():void
		{
			if(totalLabels)
			{
				if(currentLabel >= totalLabels)
				{
					currentLabel = 0;
					currentIndex = currentIndex + 1;
				}
				else if(currentLabel < 0)
				{
					currentLabel = totalLabels - 1;
					currentIndex = currentIndex - 1;
				}
				
				//Tästä metodista tulisi poistaa kaikki funktiot ja jättää ainoastaan päivittäminen.
			}
		}
		
		protected function dataLoaded(event:Event):void
		{
			
			data = loader.data;
			setCurrentIndex(currentIndex, currentLabel);
			
		}
		
	}
}