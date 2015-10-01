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
		
		public function updateLabel(event:Event = null):void
		{
		
		}
		
		public function set model(m:Model):void
		{
			_model = m;
			_model.addEventListener(Model.MODEL_CHANGE, update);
		}
		
		public function get model():*
		{
			return _model;
		}
		
	
	}
}