package utils
{
	import mx.controls.Image;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.system.LoaderContext;
	import flash.display.BitmapData;

	public class ImageCached extends Image
	{
		private static var cached_urls      : Array = new Array();
		private static var cached_imageData : Array = new Array();
		
		private static var waiting_filenames : Array = new Array();
		private static var waiting_images    : Array = new Array();
		
		override public function set source(value : Object) : void
		{
			// check for string value
			const string_value : String = value as String;
			
			// if source is not string / null / empty string
			if((string_value == null) || (string_value == ""))
			{
				// then just pass it further
				super.source = value;
				return;                   
			}
			
			// url            
			const url  : String = string_value;
			
			// at start check if this image already waits loading 
			const waiting_pos : int = waiting_images.indexOf(this);
			if(waiting_pos >= 0)
			{
				// if so - then remove it from wait queue
				waiting_filenames.splice(waiting_pos, 1);
				waiting_images.splice(waiting_pos, 1);
			}
			
			// source is the string (filename)
			// look for it in cache table
			const cachedFilenameID : int = cached_urls.indexOf(url);
			
			// if filename not found in cache
			if(cachedFilenameID < 0)
			{
				// then this is completely new image
				// add filename to the cache
				cached_urls.push(url);
				// add empty pointer as image data (because image not loaded yet)
				cached_imageData.push(null);
				// add this object(and filename) to the waiting list
				waiting_filenames.push(url);
				waiting_images.push(this);
				// and init loading routine
				var loader : Loader = new Loader();
				// use anonymous function as event handler
				// to pass parameter 
				loader.contentLoaderInfo.addEventListener(
					Event.COMPLETE,
					function (event:Event):void
					{
						onLoadComplete(event, url);
					}
				);
				loader.load(new URLRequest(url), new LoaderContext(true));
				return;              
			}
			
			// at this point image have it filename in cache table
			// now check if it data loaded
			
			// if data loaded then set it as source 
			if(cached_imageData[cachedFilenameID] != null)
			{
				super.source = new Bitmap(cached_imageData[cachedFilenameID]);
				return;
			}
			
			// if data not loaded then add this object to the waiting list
			waiting_filenames.push(url);
			waiting_images.push(this);
		}
		
		private static function onLoadComplete(event : Event, sourceFilename : String) : void
		{
			// loaded image data
			const imageData : BitmapData = event.currentTarget.content.bitmapData;
			
			trace(sourceFilename + " cached");
			
			// get id of loaded image in cache table
			const cachedFilenameID : int = cached_urls.indexOf(sourceFilename);
			// fill image data in cache
			cached_imageData[cachedFilenameID] = imageData;
			
			// loop through waiting list and set sources for waiting objects
			for(var i : int = waiting_filenames.length-1; i >= 0; i--)
			{
				// skip not equal filenames
				if(sourceFilename != waiting_filenames[i])
					continue;
				// have record
				// set source as loaded imageData
				(waiting_images[i] as Image).source = new Bitmap(imageData);
				trace("    set as source for " + waiting_images[i]);
				// and remove record from waiting list
				waiting_filenames.splice(i, 1);
				waiting_images.splice(i, 1);
			}
		}

	}
}