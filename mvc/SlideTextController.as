package mvc
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class SlideTextController extends Controller
	{
		private var inputField:TextField;
		private var placeholder_text:String = 'Etunimi Sukunimi  ';
	
		public function SlideTextController(m:Model, s:Stage, input:TextField)
		{
			super(m, s);
			setInputField(input);
		}
		
		private function setInputField(input:TextField):void
		{
			inputField = input;
			inputField.addEventListener(Event.CHANGE, textInput);
			inputField.addEventListener(FocusEvent.FOCUS_IN, focusIn);
			inputField.addEventListener(FocusEvent.FOCUS_OUT, focusOut);
			inputField.multiline = false;
			inputField.maxChars = 25;
			inputField.restrict = "A-Za-zöäÖÄ_ ";
			inputField.text = placeholder_text;
		}
		
		private function textInput(event:Event):void
		{
			var str:String = inputField.text;
			model.setUserName(str);
		}
		
		private function focusIn(event:FocusEvent):void
		{
			if(inputField.text == placeholder_text)
			{
				inputField.text = '';
			}
		}
		
		private function focusOut(event:FocusEvent):void
		{
		
		}
	
	}
}