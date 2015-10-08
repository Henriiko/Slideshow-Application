package mvc
{
	import flash.events.Event;
	import flash.display.Stage;

	public class Controller
	{
		public var model:Model;
		protected var keysEnabled:Boolean = true;
		protected var stageView:Stage
		
		public function Controller(m:Model, s:Stage)
		{
			model = m;
			stageView = s;
		}
		
		public function nextItem(event:Event = null):void
		{
			if(keysEnabled)
			{
				model.setCurrentIndex(model.currentIndex + 1);	
			}
		}
		
		public function prevItem(event:Event = null):void
		{
			if(keysEnabled)
			{
				model.setCurrentIndex(model.currentIndex - 1);
			}
		}
		
		public function selectItem(number:Number):void
		{
			if(keysEnabled)
			{
				model.setCurrentIndex(number - 1);
			}
		}
	}
}