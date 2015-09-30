package mvc
{
	import flash.events.Event;
	
	public class SlideShowModel extends Model
	{
		public var swf:XMLList;
		public var currentSWF:XML;
		public var currentTitle:String;
		public var currentFile:String;
		
		
		public function SlideShowModel()
		{
			
		}
		
		override protected function updateData():void
		{
			//Tämä metodi toteutuu kaksi kertaa!
			trace(currentIndex);
			currentSWF = swf[currentIndex];
			totalItems = swf.length();
			currentTitle = currentSWF.title;
			currentFile = currentSWF.file;
			
		}
		
		override protected function dataLoaded(event:Event):void
		{
			data = new XML(loader.data);
			swf = data.swf;
			setCurrentLabel(currentLabel);
			setCurrentIndex(currentIndex);
			
			
		}
	}
}