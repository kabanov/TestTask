package utils
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.controls.Alert;
	import mx.controls.Image;
	
	import spark.components.Application;
	import spark.components.SkinnableContainer;
	
	import utils.ImageCached;

	public class Figure extends SkinnableContainer
	{
		private var age:Number;
		private var p:Point = new Point;
		private var currentImage:Image = new ImageCached();
		public var DBId:Number = 0;
		public var type:Number = 0;
		public static var applicationScript:Object;
		
		private static var flowerPictures:Array = ['/Image 1', '/Image 3', '/Image 5', '/Image 7', '/Image 9'];
		private static var potatoPictures:Array = ['/Images/Image 1', '/Images/Image 3'
			, '/Images/Image 5', '/Images/Image 8', '/Images/Image 10'];
		private static var sunflowerPictures:Array = ['/Images/Image 1', '/Images/Image 3'
			, '/Images/Image 5', '/Images/Image 7', '/Images/Image 9'];
		public static var allObjects:Array = ['clover', 'potato', 'sunflower'];
		public static var arrFigures:Array = new Array;
		
		
		public function Figure(p: Point, type:Number, age:Number = 0)
		{
			this.p = p;
			this.type = type;
			this.age = age;
			this.paint(true);
			currentImage.addEventListener(MouseEvent.MOUSE_UP, this.onMouseUp);
		}
		
		private function onMouseUp(event:MouseEvent):void
		{
			if(MyEvents.gather && age == 4)
			{
				Alert.show("Собрали " + allObjects[type - 1]);
				arrFigures.splice(arrFigures.indexOf(this), 1);
				this.parent.removeChild(this);
				if (this.hasEventListener(MouseEvent.MOUSE_UP))
					this.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
				MyEvents.mainClass.onRemoveFigure(this)
			}
		}
		
		public function grow():Number
		{
			//Alert.show("Растём!");
			if(this.age < 4)
			{
				++this.age;
				this.paint();
				return this.age;
			}
			return this.age;
		}
		
		public function getAge():Number
		{
			return this.age;
		}
		
		private function paint(create:Boolean = false):void
		{
			var imageSrc:String;
			switch(type)
			{
				case 1:
					imageSrc = flowerPictures[age];
					break;
				case 2:
					imageSrc = potatoPictures[age];
					break;
				case 3:
					imageSrc = sunflowerPictures[age];
					break;
			}
			currentImage.source = "http://localhost:3000/" + allObjects[type - 1] + imageSrc + ".png";
			if(create)
			{
				currentImage.bottom = 0;
				currentImage.left = 0;
				this.x = p.x;
				this.y = p.y;
				this.width = 100;
				this.height = 130;
				currentImage.scaleContent = false;
				this.addElement(currentImage);
			}
		}
	}
}