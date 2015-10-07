package mvc
{
	import flash.events.Event;
	
	public class View
	{
		private var _model:Model;
		
		public function View()
		{
			
		}
		
		public function update(event:Event = null):void
		{
			
		}
		
		public function settingsOpen(event:Event = null):void
		{
			
		}
		
		public function settingsClose(event:Event = null):void
		{
			
		}
		
		public function set model(m:Model):void
		{
			_model = m;
			_model.addEventListener(Model.MODEL_CHANGE, update);
			_model.addEventListener(Model.SETTINGS_OPEN, settingsOpen);
			_model.addEventListener(Model.SETTINGS_CLOSE, settingsClose);
		}		
		
		public function get model():*
		{
			return _model;
		}
		
	
	}
}