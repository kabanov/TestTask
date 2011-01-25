package utils{
	import flash.events.*;
	import flash.net.*;
	import flash.utils.*;
	
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class GetHTTPData{
		private var __parent:Object; // Связь с родительским модулем
		private var __type:String;
		
		public function GetHTTPData(pa:Object) {
			__parent = pa;
		}
		
		public function ask(what:String, type:String = "def", data:Object = ""):void { // Метод вызывается родителем. Параметр what - имя (URL) запрашиваемого файла
			__type = type;
			var http:HTTPService = new HTTPService;
			http.resultFormat = "xml";
			http.url = what;
			http.method = "GET";
			http.request = data;
			http.addEventListener(ResultEvent.RESULT, handleComplete);
			http.send();
		}
		
		private function handleComplete( event:Event ):void {
			__parent.answer(new XML(event.currentTarget.lastResult), __type); // Загрузка завершена. Родительский модуль получает результат.
			event.currentTarget.removeEventListener(ResultEvent.RESULT, handleComplete);
			// для этого он должен иметь метод answer.
		}
	}
}