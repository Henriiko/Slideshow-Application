package mvc
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class SlideShowController extends Controller
	{
	
		private var keyTimer:Timer;
		private var numA:String;
		private var numB:String;
		private var timeCompleted:Boolean = true;
	
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
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyControl);
		}
		
		private function KeyControl(event:KeyboardEvent):void
		{
			if (parseInt(String.fromCharCode(event.keyCode)) is int)
			{
				if (numA == null)
				{	keyTimer = new Timer(500, 1);
					keyTimer.addEventListener(TimerEvent.TIMER_COMPLETE, timerComplete);
					numA = String.fromCharCode(event.keyCode);
					keyTimer.start();
					timeCompleted = false;
				}
				else if (numA != null && !timeCompleted)
				{
					numB = String.fromCharCode(event.keyCode);
				}
				
			}else
			{
				switch(event.keyCode)
				{	
					case 39: 
					nextItem();
					break;
					case 37:
					prevItem();
					break;
				}
			}
			
		}
		
		private function timerComplete(event:TimerEvent):void
		{
				var pagenum:int;
				keyTimer.stop();
				timeCompleted = true;
				pagenum = parseInt(numA + numB);
				selectItem(pagenum);
				numA = null;
				numB = null;
				
		}
		
	}
}