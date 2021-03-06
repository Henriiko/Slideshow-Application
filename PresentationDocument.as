﻿package 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.display.Stage;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	
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
		public var settingsP:SettingsTab;
		public var textController:SlideTextController;
		
		public function PresentationDocument()
		{	
			
			this.stage.scaleMode = StageScaleMode.SHOW_ALL;
			this.stage.align = StageAlign.LEFT;
		
			slideView = new SlideShowView(container_mc);
			textView = new SlideTextView(numbers_txt, date_txt, name_txt, this.stage);
			
			settingsP = new SettingsTab();
			settingsP.x = stage.stageWidth / 2;
			settingsP.y = stage.stageHeight / 2;
			textView.addSettingsPanel(settingsP);
			
			slideModel = new SlideShowModel();
			slideView.model = slideModel;
			textView.model = slideModel;
			
			slideController = new SlideShowController(slideModel, this.stage);
			textController = new SlideTextController(slideModel, this.stage, settingsP.input_txt);
			
			slideModel.load(new URLRequest('data.xml'));
			
			slideController.addNextButton(container_mc);
			slideController.addKeyBoardControl(this.stage);
			slideController.addSettingsButton(settings_mc);
			slideController.addSettingsPanel(settingsP);
			slideController.addSettingsCloseButton(settingsP.offBtn_mc)
			slideController.addFullScreenButton(settingsP.fullscreenBtn_mc);
			
		}
		
		
		
	}
}