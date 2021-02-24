Class DatabaseManager.BusinessOperation.DataOperation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method createData(pRequest As DatabaseManager.Messages.BusinessOperations.CreateDataRequest, pResponse As DatabaseManager.Messages.BusinessOperations.CreateDataResponse)
{
	//TODO
   Quit $$$OK
}

Method searchData(pRequest As DatabaseManager.Messages.BusinessOperations.SearchDataRequest, pResponse As DatabaseManager.Messages.BusinessOperations.SearchDataResponse)
{
	//TODO
   Quit $$$OK
}

Method getData(pRequest As DatabaseManager.Messages.BusinessOperations.GetDataRequest, pResponse As DatabaseManager.Messages.BusinessOperations.GetDataResponse)
{
	//TODO
   Quit $$$OK
}

Method modifyData(pRequest As DatabaseManager.Messages.BusinessOperations.ModifyDataRequest, pResponse As DatabaseManager.Messages.BusinessOperations.ModifyDataResponse)
{
	//TODO
   Quit $$$OK
}

Method deleteData(pRequest As DatabaseManager.Messages.BusinessOperations.DeleteDataRequest, pResponse As DatabaseManager.Messages.BusinessOperations.DeleteDataResponse)
{
	//TODO
   Quit $$$OK
}

XData MessageMap
{
<MapItems>
 	<MapItem MessageType="DatabaseManager.Messages.BusinessServices.CreateDataRequest">
		<Method>createData</Method>
 	</MapItem>
 	<MapItem MessageType="DatabaseManager.Messages.BusinessServices.SearchDataRequest">
		<Method>searchData</Method>
 	</MapItem>
 	<MapItem MessageType="DatabaseManager.Messages.BusinessServices.GetDataRequest">
		<Method>getData</Method>
 	</MapItem>
 	<MapItem MessageType="DatabaseManager.Messages.BusinessServices.ModifyDataRequest">
		<Method>modifyData</Method>
 	</MapItem>
 	<MapItem MessageType="DatabaseManager.Messages.BusinessServices.DeleteDataRequest">
		<Method>deleteData</Method>
 	</MapItem>
</MapItems>
}

}
