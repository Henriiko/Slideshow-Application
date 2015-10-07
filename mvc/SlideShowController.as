package mvc
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class SlideShowController extends Controller
	{
	
		private var keyTimer:Timer;
		private var numA:String;
		private var numB:String;
		private var timeCompleted:Boolean = true;
		private var settingsPanel:DisplayObject;
		
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
		
		public function addSettingsButton(Btn:Sprite):void
		{
			Btn.addEventListener(MouseEvent.CLICK, activateSettingsPanel);
			Btn.buttonMode = true;
		}
		
		public function addSettingsCloseButton(Btn:DisplayObject):void
		{
			Btn.addEventListener(MouseEvent.CLICK, closeSettingsPanel);
		}
		
		public function addSettingsPanel(Panel:DisplayObject):void
		{
			settingsPanel = Panel
		}
		
		public function activateSettingsPanel(event:MouseEvent):void
		{
			model.showSettingsPanel();
		}
		
		public function closeSettingsPanel(event:MouseEvent):void
		{
			model.closeSettingsPanel();
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