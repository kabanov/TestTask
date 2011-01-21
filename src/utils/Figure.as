package utils
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import spark.components.SkinnableContainer;
	
	import utils.ImageCached;

	public class Figure extends SkinnableContainer
	{
		public function Figure(imageSrc: String, p: Point)
		{
			var block:SkinnableContainer = this;
			var currentImage:ImageCached = new ImageCached();
			currentImage.source = imageSrc;
			currentImage.bottom = 0;
			currentImage.left = 0;
			block.x = p.x;
			block.y = p.y;
			block.width = 100;
			block.height = 130;
			currentImage.scaleContent = false;
			block.addElement(currentImage);
		}
	}
}