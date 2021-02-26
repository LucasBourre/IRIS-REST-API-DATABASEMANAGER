Class DatabaseManager.BusinessOperation.DataOperation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Parameter SETTINGS = "generatedClass";

Property generatedClass As %String [ InitialExpression = "DatabaseManager.Datas" ];

Property generatedData As %String [ InitialExpression = "DatabaseManager_Datas" ];

Method createData(pRequest As DatabaseManager.Messages.CreateDataRequest, pResponse As DatabaseManager.Messages.CreateDataResponse)
{
	Set pResponse = ##class(DatabaseManager.Messages.CreateDataResponse).%New()
	Try {
	
		Do ..checkTable(pRequest.tableName)
		Set tableName = pRequest.tableName

		For i = 1:1:pRequest.data.Count() {
			Set propertyName = pRequest.data.GetAt(i).name
			If '(..checkPropertyExist(tableName,propertyName)){
				Throw ##class(%Exception.General).%New("Property "_propertyName_" of table "_tableName_" doesn't exist")	
			}
		}
		Set SQLRequest = ..getInsertSQLRequest(..generatedData_"."_tableName, pRequest.data)
		$$$TRACE(SQLRequest)
		Set rs = ..sqlPrepare(SQLRequest)
		Do rs.%Next()
		Set pResponse.response = ..verifyResultSQL(rs)
		
	}Catch ex {
		Set pResponse.response = "Error : "_ex.DisplayString()
	}
	Quit $$$OK
}

Method searchData(pRequest As DatabaseManager.Messages.SearchDataRequest, pResponse As DatabaseManager.Messages.SearchDataResponse)
{
	Set pResponse = ##class(DatabaseManager.Messages.SearchDataResponse).%New()
	Try {
		Do ..checkTable(pRequest.tableName)
		Set tableName = pRequest.tableName
		Set def=##class(%Dictionary.ClassDefinition).%OpenId(..generatedClass_"."_tableName)

		If (pRequest.data.Count()=0){
			Throw ##class(%Exception.General).%New("Error : no criteria")	
		}
		Set SQLRequest = "Select * from "_..generatedData_"."_tableName_" where "
		
		For i = 1:1:pRequest.data.Count() {
			If (i>1){
				Set SQLRequest = SQLRequest_" and"
			}
			Set SQLRequest = SQLRequest_pRequest.data.GetAt(i).name_" = '"_pRequest.data.GetAt(i).value_"'"
		}
		$$$TRACE(SQLRequest)
		Set rs = ..sqlPrepare(SQLRequest)
		While (rs.%Next()){
			Set datas = ##class(DatabaseManager.Object.Datas).%New()
			Set data = ##class(DatabaseManager.Object.Data).%New()
			Set data.name = "ID"
			Set data.value = rs.%Get("ID")
			Set tsc = datas.data.Insert(data)
			For i=1:1:def.Properties.Count() {
				Set data = ##class(DatabaseManager.Object.Data).%New()
				Set data.name = def.Properties.GetAt(i).Name
				Set data.value = rs.%Get(def.Properties.GetAt(i).Name)

				Set tsc = datas.data.Insert(data)
			}
			Set tsc = pResponse.datas.Insert(datas) If $$$ISERR(tsc) Throw tsc
		}

		If (pResponse.datas.Count()>0){
			Set pResponse.response ="OK"
		}Else{
			Set pResponse.response = "Error : no data for criteria"
		}
	}Catch ex {
		Set pResponse.response = "Error : "_ex.DisplayString()
	}
   Quit $$$OK
}

Method getData(pRequest As DatabaseManager.Messages.GetDataRequest, pResponse As DatabaseManager.Messages.GetDataResponse)
{
	Set pResponse = ##class(DatabaseManager.Messages.GetDataResponse).%New()
	Try {
		Do ..checkTable(pRequest.tableName)
		Set tableName = pRequest.tableName
		Set def=##class(%Dictionary.ClassDefinition).%OpenId(..generatedClass_"."_tableName)

		Set SQLRequest = "Select * from "_..generatedData_"."_tableName_" where ID = "_pRequest.dataId
		$$$TRACE(SQLRequest)
		
		Set rs = ..sqlPrepare(SQLRequest)
		If (rs.%Next()){
			For i=1:1:def.Properties.Count() {
				Set data = ##class(DatabaseManager.Object.Data).%New()
				Set data.name = def.Properties.GetAt(i).Name
				Set data.value = rs.%Get(def.Properties.GetAt(i).Name)
				Set tsc = pResponse.data.Insert(data) If $$$ISERR(tsc) Throw tsc
			}
			Set pResponse.response = "OK"
		}Else{
			Set pResponse.response = "Error data doesn't not exist"
		}
	}Catch ex {
		Set pResponse.response = "Error : "_ex.DisplayString()
	}
   Quit $$$OK
}

Method modifyData(pRequest As DatabaseManager.Messages.ModifyDataRequest, pResponse As DatabaseManager.Messages.ModifyDataResponse)
{
	Set pResponse = ##class(DatabaseManager.Messages.ModifyDataResponse).%New()
	Try {
		Do ..checkTable(pRequest.tableName)
		Set tableName = pRequest.tableName

		If '(pRequest.dataId > 0){
			Throw ##class(%Exception.General).%New("Error : field dataId required")	
		}
		Set SQLRequest = ..getUpdateSQLRequest(tableName, pRequest)
		$$$TRACE(SQLRequest)
		
		Set rs = ..sqlPrepare(SQLRequest)
		Do rs.%Next()
		Set pResponse.response = ..verifyResultSQL(rs)
	}Catch ex {
		Set pResponse.response = "Error : "_ex.DisplayString()
	}
   Quit $$$OK
}

Method deleteData(pRequest As DatabaseManager.Messages.DeleteDataRequest, pResponse As DatabaseManager.Messages.DeleteDataResponse)
{
	Set pResponse = ##class(DatabaseManager.Messages.DeleteDataResponse).%New()
	Try {
		Do ..checkTable(pRequest.tableName)
		Set tableName = pRequest.tableName

		Set SQLRequest = "Delete from "_..generatedData_"."_tableName_" where ID = "_pRequest.dataId
		$$$TRACE(SQLRequest)
		
		Set rs = ..sqlPrepare(SQLRequest)
		Do rs.%Next()
		Set pResponse.response = ..verifyResultSQL(rs)
	}Catch ex {
		Set pResponse.response = "Error : "_ex.DisplayString()
	}
   Quit $$$OK
}

Method verifyResultSQL(rs As %SQL.StatementResult) As %String
{
	If (rs.%SQLCODEGet()=0){
		Return "OK with ID "_rs.%ROWIDGet()
	}
	Return "Error with SQLCODE "_rs.%SQLCODEGet()_" : "_rs.%MessageGet()
}

Method getUpdateSQLRequest(tableName As %String, pRequest As DatabaseManager.Messages.ModifyDataRequest) As %String
{
	Set SQLRequest = "Update "_..generatedData_"."_tableName_" set"
	For i = 1:1:pRequest.data.Count() {
		Set SQLRequest = SQLRequest_" "_pRequest.data.GetAt(i).name_" = '"_pRequest.data.GetAt(i).value_"'"
		If (i<pRequest.data.Count()){
			Set SQLRequest = SQLRequest_","
		}
	}
	Set SQLRequest = SQLRequest_" where ID = "_pRequest.dataId

	Return SQLRequest
}

Method getInsertSQLRequest(tableName As %String, data As %ListOfObjects) As %String
{
	Set SQLRequest = "Insert into "_tableName
	Set input = " ("
	Set values = " values ("

	For i = 1:1:data.Count() {
		If (i = data.Count()){
			Set input = input_data.GetAt(i).name_")"
			Set values = values_"'"_data.GetAt(i).value_"')"
		}Else{
			Set input = input_data.GetAt(i).name_","
			Set values = values_"'"_data.GetAt(i).value_"',"
		}
	}
	
	Return SQLRequest_input_values
}

Method checkTable(tableName As %String) As %Status
{
	If '(##class(%Dictionary.CompiledClass).%ExistsId(..generatedClass_"."_tableName)){
		Throw ##class(%Exception.General).%New("Table "_tableName_" doesn't exist")	
	}
	Quit $$$OK
}

Method checkPropertyExist(tableName As %String, propertyName As %String) As %Boolean
{
	Return ##class(%Dictionary.CompiledProperty).IDKEYExists(..generatedClass_"."_tableName,propertyName)
}

Method sqlPrepare(SQLRequest As %String) As %SQL.StatementResult
{
	Set statement=##class(%SQL.Statement).%New() 
	Do statement.%Prepare(SQLRequest)
	Set rs = statement.%Execute()
	Return rs
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
