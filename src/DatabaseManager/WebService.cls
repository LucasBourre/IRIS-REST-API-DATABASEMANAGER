Class DatabaseManager.WebService Extends (%CSP.REST, Ens.BusinessService, Ens.Util.JSON)
{

XData UrlMap
{
<Routes>
<Route Url="/table" Method="POST" Call="createTable" /> 
<Route Url="/table/:tableName" Method="GET" Call="getTable" /> 
<Route Url="/table" Method="PUT" Call="modifyTable" /> 
<Route Url="/table/:tableName" Method="DELETE" Call="deleteTable" /> 

<Route Url="/data" Method="POST" Call="createData" /> 
<Route Url="/data/search" Method="POST" Call="searchData" /> 
<Route Url="/data/:tableName/:id" Method="GET" Call="getData" /> 
<Route Url="/data" Method="PUT" Call="modifyData" /> 
<Route Url="/data/:tableName/:id" Method="DELETE" Call="deleteData" /> 
</Routes>
}

Parameter CHARSET = "utf-8";

Parameter CONVERTINPUTSTREAM = 1;

/// Exception Error
ClassMethod ExceptionResponse(Exception As %RegisteredObject, Output pOutput As DatabaseManager.Messages.BasicResponse) As %Status
{
		Set pOutput = ##class(DatabaseManager.Messages.BasicResponse).%New() 
		Set pOutput.response = "TechnicalError : "_Exception.Name_" "_Exception.Data_" "_Exception.Location
		Quit $$$OK
}

/// Allow to create a table
ClassMethod createTable() As %Status
{
	Try{   
		//Get Request
		do ..JSONStreamToObject(%request.Content,.pRequest,"DatabaseManager.Messages.CreateTableRequest",1) 
   		
		//Call method
   		Set tSC = ##class(Ens.Director).CreateBusinessService("DatabaseManager.BusinessService.TableService",.tService) if $$$ISERR(tSC) quit
		#Dim pResult As DatabaseManager.Messages.CreateTableResponse 
		Set tSC = tService.ProcessInput(pRequest,.pResult,"createTable") 
		if $$$ISERR(tSC) Throw tSC
		
    } catch(exception) {
    	Set tSC = ..ExceptionResponse(exception,.pResult)
    }
    
    //REST Response
	set %response.ContentType = "application/json" 
	set tJSONStreamStatus =  ..ObjectToJSONStream(pResult, .tOut)
	set tSC = tOut.OutputToDevice(-1)
    Quit tSC
}

/// Allow to modify a table
ClassMethod modifyTable() As %Status
{
	Try{   
		//Get request
		do ..JSONStreamToObject(%request.Content,.pRequest,"DatabaseManager.Messages.ModifyTableRequest",1) 

		//Create Business service and send request
   		Set tSC = ##class(Ens.Director).CreateBusinessService("DatabaseManager.BusinessService.TableService",.tService) if $$$ISERR(tSC) quit
		#Dim pResult As DatabaseManager.Messages.ModifyTableResponse 
		Set tSC = tService.ProcessInput(pRequest,.pResult,"modifyTable") 
		if $$$ISERR(tSC) Throw tSC
		
    } catch(exception) {
    	Set tSC = ..ExceptionResponse(exception,.pResult)
    }
    
    //REST response
	set %response.ContentType = "application/json" 
	set tJSONStreamStatus =  ..ObjectToJSONStream(pResult, .tOut)
	set tSC = tOut.OutputToDevice(-1)
    Quit tSC
}

/// Allow to get table properties
ClassMethod getTable(tableName As %String(MAXLEN=300)) As %Status
{
	Try{   
   		set pRequest = ##class(DatabaseManager.Messages.GetTableRequest).%New()
		set pRequest.tableName = tableName
		
		//Call Process Input of the Service
   		Set tSC = ##class(Ens.Director).CreateBusinessService("DatabaseManager.BusinessService.TableService",.tService) if $$$ISERR(tSC) quit
		#Dim pResult As DatabaseManager.Messages.GetTableResponse 
		Set tSC = tService.ProcessInput(pRequest,.pResult,"getTable") 
		if $$$ISERR(tSC) Throw tSC
		
    } catch(exception) {
    	Set tSC = ..ExceptionResponse(exception,.pResult)
    }
    
    //REST Response
	set %response.ContentType = "application/json" 
	set tJSONStreamStatus =  ..ObjectToJSONStream(pResult, .tOut)
	set tSC = tOut.OutputToDevice(-1)
    Quit tSC
}

/// Allow to delete table
ClassMethod deleteTable(tableName As %String(MAXLEN=300)) As %Status
{
	Try{   
		set pRequest = ##class(DatabaseManager.Messages.DeleteTableRequest).%New()
		set pRequest.tableName = tableName
   		
		//Call Process Input of the Service
   		Set tSC = ##class(Ens.Director).CreateBusinessService("DatabaseManager.BusinessService.TableService",.tService) if $$$ISERR(tSC) quit
		#Dim pResult As DatabaseManager.Messages.DeleteTableResponse 
		Set tSC = tService.ProcessInput(pRequest,.pResult,"deleteTable") 
		if $$$ISERR(tSC) Throw tSC
		
    } catch(exception) {
    	Set tSC = ..ExceptionResponse(exception,.pResult)
    }
    
    //REST Response
	set %response.ContentType = "application/json" 
	set tJSONStreamStatus =  ..ObjectToJSONStream(pResult, .tOut)
	set tSC = tOut.OutputToDevice(-1)
    Quit tSC
}

/// Allow to create data
ClassMethod createData() As %Status
{
	Try{    
		do ..JSONStreamToObject(%request.Content,.pRequest,"DatabaseManager.Messages.CreateDataRequest",1) 
   		Set tSC = ##class(Ens.Director).CreateBusinessService("DatabaseManager.BusinessService.DataService",.tService) if $$$ISERR(tSC) quit
   		 
		#Dim pResult As DatabaseManager.Messages.CreateDataResponse 
		Set tSC = tService.ProcessInput(pRequest,.pResult,"createData") 
		if $$$ISERR(tSC) Throw tSC
		
    } catch(exception) {
    	Set tSC = ..ExceptionResponse(exception,.pResult)
    }
     
	set %response.ContentType = "application/json" 
	set tJSONStreamStatus =  ..ObjectToJSONStream(pResult, .tOut)
	set tSC = tOut.OutputToDevice(-1)
    Quit tSC
}

ClassMethod searchData() As %Status
{
	Try{    
		do ..JSONStreamToObject(%request.Content,.pRequest,"DatabaseManager.Messages.SearchDataRequest",1) 
   		Set tSC = ##class(Ens.Director).CreateBusinessService("DatabaseManager.BusinessService.DataService",.tService) if $$$ISERR(tSC) quit
   		 
		#Dim pResult As DatabaseManager.Messages.SearchDataResponse 
		Set tSC = tService.ProcessInput(pRequest,.pResult,"searchData") 
		if $$$ISERR(tSC) Throw tSC
		
    } catch(exception) {
    	Set tSC = ..ExceptionResponse(exception,.pResult)
    }
      
	set %response.ContentType = "application/json" 
	set tJSONStreamStatus =  ..ObjectToJSONStream(pResult, .tOut)
	set tSC = tOut.OutputToDevice(-1)
    Quit tSC
}

ClassMethod getData(tableName As %String(MAXLEN=300), id As %Integer) As %Status
{
	Try{    
		
		set pRequest = ##class(DatabaseManager.Messages.GetDataRequest).%New()
		set pRequest.tableName = tableName
		set pRequest.dataId = id 

   		Set tSC = ##class(Ens.Director).CreateBusinessService("DatabaseManager.BusinessService.DataService",.tService) if $$$ISERR(tSC) quit
   		 
		#Dim pResult As DatabaseManager.Messages.GetDataResponse 
		Set tSC = tService.ProcessInput(pRequest,.pResult,"getData") 
		if $$$ISERR(tSC) Throw tSC
		
    } catch(exception) {
    	Set tSC = ..ExceptionResponse(exception,.pResult)
    }
     
	set %response.ContentType = "application/json" 
	set tJSONStreamStatus =  ..ObjectToJSONStream(pResult, .tOut)
	set tSC = tOut.OutputToDevice(-1)
    Quit tSC
}

ClassMethod modifyData() As %Status
{
	Try{    
		do ..JSONStreamToObject(%request.Content,.pRequest,"DatabaseManager.Messages.ModifyDataRequest",1) 
   		Set tSC = ##class(Ens.Director).CreateBusinessService("DatabaseManager.BusinessService.DataService",.tService) if $$$ISERR(tSC) quit
   		 
		#Dim pResult As DatabaseManager.Messages.ModifyDataResponse 
		Set tSC = tService.ProcessInput(pRequest,.pResult,"modifyData") 
		if $$$ISERR(tSC) Throw tSC
		
    } catch(exception) {
    	Set tSC = ..ExceptionResponse(exception,.pResult)
    }
     
	set %response.ContentType = "application/json" 
	set tJSONStreamStatus =  ..ObjectToJSONStream(pResult, .tOut)
	set tSC = tOut.OutputToDevice(-1)
    Quit tSC
}

ClassMethod deleteData(tableName As %String(MAXLEN=300), id As %Integer) As %Status
{
	Try{    		
		set pRequest = ##class(DatabaseManager.Messages.DeleteDataRequest).%New()
		set pRequest.tableName = tableName
		set pRequest.dataId = id 
   		Set tSC = ##class(Ens.Director).CreateBusinessService("DatabaseManager.BusinessService.DataService",.tService) if $$$ISERR(tSC) quit
   		 
		#Dim pResult As DatabaseManager.Messages.DeleteDataResponse 
		Set tSC = tService.ProcessInput(pRequest,.pResult,"deleteData") 
		if $$$ISERR(tSC) Throw tSC
		
    } catch(exception) {
    	Set tSC = ..ExceptionResponse(exception,.pResult)
    }
     
	set %response.ContentType = "application/json" 
	set tJSONStreamStatus =  ..ObjectToJSONStream(pResult, .tOut)
	set tSC = tOut.OutputToDevice(-1)
    Quit tSC
}

}
