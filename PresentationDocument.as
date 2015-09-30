package 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	import mvc.SlideShowController;
	import mvc.SlideShowModel;
	import mvc.SlideShowView;
	
	public class PresentationDocument extends MovieClip
	{
		public var slideModel:SlideShowModel;
		public var slideView:SlideShowView;
		public var slideController:SlideShowController;
		
		public function PresentationDocument()
		{	
			slideView = new SlideShowView(container_mc);
			
			slideModel = new SlideShowModel();
			slideView.model = slideModel;
			
			slideController = new SlideShowController(slideModel);
			
			slideModel.load(new URLRequest('data.xml'));
			
			slideController.addNextButton(container_mc);
			slideController.addKeyBoardControl(this.stage);
			
		}
		
		
		
	}
}