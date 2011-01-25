package utils
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	
	// Экспериментальный класс, пока не доделал
	public class MyEvents extends Sprite
	{
		public static var gather:Boolean;
		public static var mainClass: Object;
		
		public function MyEvents(pa: Object)
		{
			mainClass = pa; 
			/* pa.addEventListener(MouseEvent.MOUSE_UP, function onMouseUp():void {
			 	Alert.show("Error in query.");
			});*/
		}
	}
}