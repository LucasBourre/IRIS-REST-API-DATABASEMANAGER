Class DatabaseManager.BusinessOperation.DataOperation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Parameter SETTINGS = "generatedClass";

Property generatedClass As %String [ InitialExpression = "DatabaseManager.Datas" ];

Method createData(pRequest As DatabaseManager.Messages.CreateDataRequest, pResponse As DatabaseManager.Messages.CreateDataResponse)
{
	Set pResponse = ##class(DatabaseManager.Messages.CreateDataResponse).%New()
	Try {
	
		Set tableName = pRequest.tableName

		If '(##class(%Dictionary.CompiledClass).%ExistsId(..generatedClass_"."_tableName)){
			Throw ##class(%Exception.General).%New("Table "_tableName_" doesn't exist")	
		}

		For i = 1:1:pRequest.data.Count() {
			Set propertyName = pRequest.data.GetAt(i).name
			If '(..checkPropertyExist(tableName,propertyName)){
				Throw ##class(%Exception.General).%New("Property "_propertyName_" of table "_tableName_" doesn't exist")	
			}
		}
		
		Set tsc = ..insertData(..generatedClass_"."_tableName, pRequest.data) 

		Set pResponse.response ="OK"

	}Catch ex {
		Set pResponse.response = "Error : "_ex.DisplayString()
	}
	Quit $$$OK
}

Method insertData(tableName As %String, data As %ListOfObjects) As %Status
{
	set SQLRequest = ..getSQLRequest(tableName, data )
	$$$TRACE(SQLRequest)

	quit $$$OK
}

Method getSQLRequest(tableName As %String, data As %ListOfObjects) As %String
{
	set SQLRequest = "Insert into "_tableName
	set input = "("
	set values = "("

	For i = 1:1:data.Count() {
		if (i = data.Count()){
			set input = input.GetAt(i).name_")"
			set values = input.GetAt(i).value_")"
		}else{
			set input = input.GetAt(i).name_","
			set values = input.GetAt(i).value_","
		}
	}
	

	Return SQLRequest
}

Method checkPropertyExist(tableName As %String, propertyName As %String) As %Boolean
{
	Return ##class(%Dictionary.CompiledProperty).IDKEYExists(..generatedClass_"."_tableName,propertyName)
}

Method searchData(pRequest As DatabaseManager.Messages.SearchDataRequest, pResponse As DatabaseManager.Messages.SearchDataResponse)
{
	Set pResponse = ##class(DatabaseManager.Messages.SearchDataResponse).%New()
	Set pResponse.response ="OK"
   Quit $$$OK
}

Method getData(pRequest As DatabaseManager.Messages.GetDataRequest, pResponse As DatabaseManager.Messages.GetDataResponse)
{
	Set pResponse = ##class(DatabaseManager.Messages.GetDataResponse).%New()
	Set pResponse.response ="OK"
   Quit $$$OK
}

Method modifyData(pRequest As DatabaseManager.Messages.ModifyDataRequest, pResponse As DatabaseManager.Messages.ModifyDataResponse)
{
	Set pResponse = ##class(DatabaseManager.Messages.ModifyDataResponse).%New()
	Set pResponse.response ="OK"
   Quit $$$OK
}

Method deleteData(pRequest As DatabaseManager.Messages.DeleteDataRequest, pResponse As DatabaseManager.Messages.DeleteDataResponse)
{
	Set pResponse = ##class(DatabaseManager.Messages.DeleteDataResponse).%New()
	Set pResponse.response ="OK"
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
