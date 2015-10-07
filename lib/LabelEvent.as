package lib
{
	import flash.events.Event;

	public class LabelEvent extends Event
	{
		public static const LABEL_CHANGE:String = 'labelChange';
		
		private var actionstring:String;
	
		public function LabelEvent(type:String, action:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.actionstring = action;
		}
		
		public function get action():String
		{
			return actionstring;
		}
		
		public override function clone():Event
		{
			return new LabelEvent(type, action, bubbles, cancelable);
		}
	
	}

}