Class DatabaseManager.BusinessOperation.TableOperation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Parameter SETTINGS = "generatedClass";

Property generatedClass As %String [ InitialExpression = "DatabaseManager.Datas" ];

Method createTable(pRequest As DatabaseManager.Messages.BusinessServices.CreateTableRequest, pResponse As DatabaseManager.Messages.BusinessServices.CreateTableResponse)
{
   Quit $$$OK
}

XData MessageMap
{
<MapItems>
 	<MapItem MessageType="DatabaseManager.Messages.BusinessServices.CreateTableRequest">
		<Method>createTable</Method>
 	</MapItem>
</MapItems>
}

}
