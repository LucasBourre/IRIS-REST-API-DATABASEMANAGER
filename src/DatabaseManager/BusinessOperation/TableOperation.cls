Class DatabaseManager.BusinessOperation.TableOperation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Parameter SETTINGS = "generatedClass";

Property generatedClass As %String [ InitialExpression = "DatabaseManager.Datas" ];

Method createTable(pRequest As DatabaseManager.Messages.BusinessOperations.CreateTableRequest, pResponse As DatabaseManager.Messages.BusinessOperations.CreateTableResponse)
{
   Quit $$$OK
}

Method modifyTable(pRequest As DatabaseManager.Messages.BusinessOperations.ModifyTableRequest, pResponse As DatabaseManager.Messages.BusinessOperations.ModifyTableResponse)
{
   Quit $$$OK
}

Method getTable(pRequest As DatabaseManager.Messages.BusinessOperations.GetTableRequest, pResponse As DatabaseManager.Messages.BusinessOperations.GetTableResponse)
{
   Quit $$$OK
}

Method deleteTable(pRequest As DatabaseManager.Messages.BusinessOperations.DeleteTableRequest, pResponse As DatabaseManager.Messages.BusinessOperations.DeleteTableResponse)
{
   Quit $$$OK
}

XData MessageMap
{
<MapItems>
 	<MapItem MessageType="DatabaseManager.Messages.BusinessOperations.CreateTableRequest">
		<Method>createTable</Method>
 	</MapItem>
 	<MapItem MessageType="DatabaseManager.Messages.BusinessOperations.ModifyTableRequest">
		<Method>modifyTable</Method>
 	</MapItem>
 	<MapItem MessageType="DatabaseManager.Messages.BusinessOperations.GetTableRequest">
		<Method>getTable</Method>
 	</MapItem>
 	<MapItem MessageType="DatabaseManager.Messages.BusinessOperations.DeleteTableRequest">
		<Method>deleteTable</Method>
 	</MapItem>
</MapItems>
}

}
