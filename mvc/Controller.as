package mvc
{
	import flash.events.Event;

	public class Controller
	{
		public var model:Model;
		
		public function Controller(m:Model)
		{
			model = m;
		}
		
		public function nextItem(event:Event = null):void
		{
			model.setCurrentIndex(model.currentIndex + 1);	
		}
		
		public function prevItem(event:Event = null):void
		{
			model.setCurrentIndex(model.currentIndex - 1);
		}
		
		public function selectItem(number:Number):void
		{
			model.setCurrentIndex(number - 1);
		}
	}
}