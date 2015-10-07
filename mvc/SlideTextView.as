package mvc
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.text.TextField;
	import SettingsTab;
	
	public class SlideTextView extends View
	{
	
		private var numbers:TextField;
		private var datenumbers:TextField;
		private var username:TextField;
		private var currentDate:Date;
		private var stageView:Stage;
		private var settingsPanel:SettingsTab;
		
		
		public function SlideTextView(num:TextField, date:TextField, nam:TextField, s:Stage)
		{
			stageView = s;
			numbers = num;
			datenumbers = date;
			username = nam;
			currentDate = new Date();
		}
	
		public function addSettingsPanel(panel:SettingsTab):void
		{
			settingsPanel = panel;
			settingsPanel.offBtn_mc.buttonMode = true;
		}
		
		public override function settingsOpen(event:Event = null):void
		{
			stageView.addChild(settingsPanel);
		}
		
		public override function settingsClose(event:Event = null):void
		{
			stageView.removeChild(settingsPanel);
		}
		
		override public function update(event:Event = null):void
		{
			numbers.text = String((model.currentIndex + 1) + '/' + (model.totalItems));
			datenumbers.text = String(currentDate.getDate() + '.' + (currentDate.getMonth() + 1) + '.' + currentDate.getFullYear());
		}
		
		
		
		
		
		
	
	}
}