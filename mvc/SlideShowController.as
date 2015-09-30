package mvc
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	public class SlideShowController extends Controller
	{
		public function SlideShowController(m:Model)
		{		
			super(m);
		}
		
		public function addNextButton(Btn:DisplayObject):void
		{
			Btn.addEventListener(MouseEvent.CLICK, nextItem);
		}
		
		public function addKeyBoardControl(stage:Stage):void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyBoardControl);
		}
		
		private function keyBoardControl(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{	
				case 39: 
				nextLabel();
				break;
				case 37:
				prevLabel();
				break;
			}
			
		}
		
	}
}