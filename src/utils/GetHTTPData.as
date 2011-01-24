package utils{
	import flash.events.*;
	import flash.net.*;
	import flash.utils.*;
	
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class GetHTTPData{
		private var __parent:Object; // Связь с родительским модулем
		private var __type:String;
		private var http:HTTPService = new HTTPService;
		public function GetHTTPData(pa:Object) {
			http.resultFormat = "xml";
			__parent = pa;
		}
		public function ask(what:String, type:String = "def", data:Object = ""):void { // Метод вызывается родителем. Параметр what - имя (URL) запрашиваемого файла
			__type = type;
			/*var loader:URLLoader=new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.addEventListener(Event.COMPLETE, handleComplete); //Слушатель события "Завершение загрузки"
			loader. load( new URLRequest(what)); // Запрос к серверу
			*/
			http.url = what;
			http.method = "GET";
			http.request = data;
			http.addEventListener(ResultEvent.RESULT, handleComplete);
			http.send();
		}
		private function handleComplete( event:Event ):void {
			__parent.answer(new XML(http.lastResult), __type); // Загрузка завершена. Родительский модуль получает результат.
			// для этого он должен иметь метод answer.
		}
	}
}