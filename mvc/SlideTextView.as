package mvc
{
	import flash.display.*;
	import flash.events.Event;
	import flash.text.TextField;
	
	public class SlideTextView extends View
	{
	
		private var numbers:TextField;
		private var datenumbers:TextField;
		private var username:TextField;
		private var currentDate:Date;
		
		public function SlideTextView(num:TextField, date:TextField, nam:TextField)
		{
			numbers = num;
			datenumbers = date;
			username = nam;
			currentDate = new Date();
		}
	
		override public function update(event:Event = null):void
		{
			numbers.text = String((model.currentIndex + 1) + '/' + (model.totalItems));
			datenumbers.text = String(currentDate.getDate() + '.' + (currentDate.getMonth() + 1) + '.' + currentDate.getFullYear());
		}
		
		
		
		
	
	}
}