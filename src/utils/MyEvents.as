package utils
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	
	
	public class MyEvents extends Sprite
	{
		public static var gather:Boolean;
		
		public function MyEvents()
		{
			Alert.show("Error in query.");
			stage.addEventListener(MouseEvent.MOUSE_UP, function onMouseUp():void {
				Alert.show("Error in query.");
			});
			Alert.show("Error in query.");
		}
		
		private function onMouseUp():void {
			Alert.show("Error in query.");
		}
	}
}