package 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	import mvc.SlideShowController;
	import mvc.SlideShowModel;
	import mvc.SlideShowView;
	import mvc.SlideTextView;
	import mvc.SlideTextController;
	import SettingsTab;
	
	public class PresentationDocument extends MovieClip
	{
		public var slideModel:SlideShowModel;
		public var slideView:SlideShowView;
		public var textView:SlideTextView;
		public var slideController:SlideShowController;
		public var settings:SettingsTab;
		public var textController:SlideTextController;
		
		public function PresentationDocument()
		{	
			slideView = new SlideShowView(container_mc);
			textView = new SlideTextView(numbers_txt, date_txt, name_txt);
			
			settings = new SettingsTab();
			
			slideModel = new SlideShowModel();
			slideView.model = slideModel;
			textView.model = slideModel;
			
			
			slideController = new SlideShowController(slideModel);
			textController = new SlideTextController(slideModel, settings.input_txt);
			
			slideModel.load(new URLRequest('data.xml'));
			
			slideController.addNextButton(container_mc);
			slideController.addKeyBoardControl(this.stage);
			
		}
		
		
		
	}
}