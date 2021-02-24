Class DatabaseManager.BusinessOperation.DataOperation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method createData(pRequest As DatabaseManager.Messages.CreateDataRequest, pResponse As DatabaseManager.Messages.CreateDataResponse)
{
	set pResponse = ##class(DatabaseManager.Messages.CreateDataResponse).%New()
	set pResponse.response ="OK"
   Quit $$$OK
}

Method searchData(pRequest As DatabaseManager.Messages.SearchDataRequest, pResponse As DatabaseManager.Messages.SearchDataResponse)
{
	set pResponse = ##class(DatabaseManager.Messages.SearchDataResponse).%New()
	set pResponse.response ="OK"
   Quit $$$OK
}

Method getData(pRequest As DatabaseManager.Messages.GetDataRequest, pResponse As DatabaseManager.Messages.GetDataResponse)
{
	set pResponse = ##class(DatabaseManager.Messages.GetDataResponse).%New()
	set pResponse.response ="OK"
   Quit $$$OK
}

Method modifyData(pRequest As DatabaseManager.Messages.ModifyDataRequest, pResponse As DatabaseManager.Messages.ModifyDataResponse)
{
	set pResponse = ##class(DatabaseManager.Messages.ModifyDataResponse).%New()
	set pResponse.response ="OK"
   Quit $$$OK
}

Method deleteData(pRequest As DatabaseManager.Messages.DeleteDataRequest, pResponse As DatabaseManager.Messages.DeleteDataResponse)
{
	set pResponse = ##class(DatabaseManager.Messages.DeleteDataResponse).%New()
	set pResponse.response ="OK"
   Quit $$$OK
}

XData MessageMap
{
<MapItems>
 	<MapItem MessageType="DatabaseManager.Messages.CreateDataRequest">
		<Method>createData</Method>
 	</MapItem>
 	<MapItem MessageType="DatabaseManager.Messages.SearchDataRequest">
		<Method>searchData</Method>
 	</MapItem>
 	<MapItem MessageType="DatabaseManager.Messages.GetDataRequest">
		<Method>getData</Method>
 	</MapItem>
 	<MapItem MessageType="DatabaseManager.Messages.ModifyDataRequest">
		<Method>modifyData</Method>
 	</MapItem>
 	<MapItem MessageType="DatabaseManager.Messages.DeleteDataRequest">
		<Method>deleteData</Method>
 	</MapItem>
</MapItems>
}

}
