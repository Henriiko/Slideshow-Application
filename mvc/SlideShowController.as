package mvc
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import com.greensock.*;
	import flash.ui.Mouse;
	
	import flash.display.StageDisplayState;
	
	public class SlideShowController extends Controller
	{
	
		private var keyTimer:Timer;
		private var mouseTimer:Timer;
		private var numA:String;
		private var numB:String;
		private var timeCompleted:Boolean = true;
		private var settingsPanel:DisplayObject;
		
		public function SlideShowController(m:Model, s:Stage)
		{	
			super(m, s);
			s.addEventListener(MouseEvent.MOUSE_MOVE, mouseFadeIn);
			initiateMouseFade();
		}
		
		private function mouseFadeIn(event:MouseEvent):void
		{
			Mouse.show();
			mouseTimer.reset();
			mouseTimer.start();
		}
		
		private function initiateMouseFade():void
		{
			mouseTimer = new Timer(5000, 1);
			mouseTimer.start();
			mouseTimer.addEventListener(TimerEvent.TIMER_COMPLETE, mouseFade);
		}
		
		private function mouseFade(event:TimerEvent):void
		{
			Mouse.hide();
			mouseTimer.stop();
		}
		
		public function addNextButton(Btn:DisplayObject):void
		{
			Btn.addEventListener(MouseEvent.CLICK, nextItem);
		}
		
		public function addKeyBoardControl(stage:Stage):void
		{
			model.addEventListener(Model.SETTINGS_OPEN, disableKeys);
			model.addEventListener(Model.SETTINGS_CLOSE, enableKeys);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyControl);
		}
		
		public function addSettingsButton(Btn:Sprite):void
		{
			Btn.addEventListener(MouseEvent.CLICK, activateSettingsPanel);
			Btn.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			Btn.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			Btn.buttonMode = true;
			
		}
		
		public function addSettingsCloseButton(Btn:DisplayObject):void
		{
			Btn.addEventListener(MouseEvent.CLICK, closeSettingsPanel);
			Btn.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			Btn.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		}
		
		public function addSettingsPanel(Panel:DisplayObject):void
		{
			settingsPanel = Panel;
		}
		
		public function addFullScreenButton(Btn:Sprite):void
		{
			Btn.addEventListener(MouseEvent.CLICK, toggleFullScreen);0
			Btn.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			Btn.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			Btn.buttonMode = true;
			
		}
		
		public function activateSettingsPanel(event:MouseEvent):void
		{
			model.showSettingsPanel();
		}
		
		public function toggleFullScreen(event:MouseEvent = null):void
		{
			if(stageView.displayState == StageDisplayState.NORMAL)
			{
				stageView.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
			}
			else if(stageView.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE)
			{
				stageView.displayState = StageDisplayState.NORMAL;
			}
		}
		
		public function closeSettingsPanel(event:MouseEvent = null):void
		{
			model.closeSettingsPanel();
		}
		
		private function disableKeys(event:Event):void
		{
			keysEnabled = false;
		}
		
		private function enableKeys(event:Event):void
		{
			keysEnabled = true;
		}
		
		private function onMouseOver(event:MouseEvent):void
		{
			event.target.gotoAndStop(2)
		}
		
		private function onMouseOut(event:MouseEvent):void
		{
			event.target.gotoAndStop(1)
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
						case 122:
						toggleFullScreen();
						break;
						case 13:
						closeSettingsPanel();
						break;
						case 27:
						closeSettingsPanel();
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