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
			model.setCurrentIndex(model.currentIndex + 1, model.currentLabel);	
		}
		
		public function prevItem(event:Event = null):void
		{
			model.setCurrentIndex(model.currentIndex - 1, model.currentLabel);
		}
		
		public function nextLabel():void
		{	
			model.setCurrentIndex(model.currentIndex, model.currentLabel + 1);	
		}
		
		public function prevLabel():void
		{
			model.setCurrentIndex(model.currentIndex, model.currentLabel - 1);
		}
		
		public function selectLabel():void
		{
		 // Tähän numerovalinta controller
		}
	}
}