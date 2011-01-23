/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - URI.as.
 */
package services.uri
{
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.services.wrapper.HTTPServiceWrapper;
import mx.rpc.AbstractOperation;
import mx.rpc.AsyncToken;
import mx.rpc.http.HTTPMultiService;
import mx.rpc.http.Operation;


[ExcludeClass]
internal class _Super_URI extends com.adobe.fiber.services.wrapper.HTTPServiceWrapper
{

    // Constructor
    public function _Super_URI()
    {
        // initialize service control
        _serviceControl = new mx.rpc.http.HTTPMultiService("http://localhost:3000/");
         var operations:Array = new Array();
         var operation:mx.rpc.http.Operation;
         var argsArray:Array;

         operation = new mx.rpc.http.Operation(null, "GetAll");
         operation.url = "/data/all";
         operation.method = "GET";
         argsArray = new Array("Fill_Name_Here");
         operation.argumentNames = argsArray;         
         operation.resultType = Object;
         operations.push(operation);

         _serviceControl.operationList = operations;  



         model_internal::initialize();
    }

    /**
      * This method is a generated wrapper used to call the 'GetAll' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function GetAll(Fill_Name_Here:String) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("GetAll");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(Fill_Name_Here) ;

        return _internal_token;
    }
     
}

}
