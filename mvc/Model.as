package mvc
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	
	public class Model extends EventDispatcher
	{
		public var currentIndex:int = 0;
		public var totalItems:int = 0;
		protected var loader:URLLoader;
		public var data:*;
		
		public static const MODEL_CHANGE:String = 'modelChange';
		public static const SETTINGS_OPEN:String = 'settingsOpen'
		public static const SETTINGS_CLOSE:String = 'settingsClose'
		
		public function Model()
		{
			loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, dataLoaded);
		}
		
		public function load(req:URLRequest):void
		{
			loader.load(req);
		}
		
		public function setCurrentIndex(index:int):void
		{
			currentIndex = index;
			controlCurrentIndex();
			updateData();
			dispatchEvent(new Event(Model.MODEL_CHANGE));
		}
		
		public function showSettingsPanel():void
		{
			dispatchEvent(new Event(Model.SETTINGS_OPEN));
		}
		
		public function closeSettingsPanel():void
		{
			dispatchEvent(new Event(Model.SETTINGS_CLOSE));
		}
		
		protected function updateData():void
		{
			
		}
		
		private function controlCurrentIndex():void
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

		
		protected function dataLoaded(event:Event):void
		{
			data = loader.data;
			setCurrentIndex(currentIndex);
			
		}
		
	}
}