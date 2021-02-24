Class DatabaseManager.WebService Extends (%CSP.REST, Ens.BusinessService, Ens.Util.JSON)
{

XData UrlMap
{
<Routes>
<Route Url="/database/table/:tableName" Method="POST" Call="createTable" /> 
<Route Url="/database/table/:tableName" Method="GET" Call="getTable" /> 
<Route Url="/database/table/:tableName" Method="PUT" Call="modifyTable" /> 
<Route Url="/database/table/:tableName" Method="DELETE" Call="deleteTable" /> 
</Routes>
}

Parameter CHARSET = "utf-8";

Parameter CONVERTINPUTSTREAM = 1;

/// Exception Error
ClassMethod ExceptionResponse(Exception As %RegisteredObject, Output pOutput As DatabaseManager.Messages.BasicResponse) As %Status
{
		Set pOutput = ##class(DatabaseManager.Messages.BasicResponse).%New()
		Set pOutput.errorCode  = Exception.Code
		Set pOutput.errorLabel = "TechnicalError : "_Exception.Name_" "_Exception.Data_" "_Exception.Location
		Quit $$$OK
}

/// Allow to create a table
ClassMethod createTable(tableName As %String(MAXLEN=300)) As %Status
{
	Try{   
		//Récupération de la requete
		do ..JSONStreamToObject(%request.Content,.pRequest,"DatabaseManager.Messages.BusinessServices.CreateTableRequest",1) 
   		Set tSC = ##class(Ens.Director).CreateBusinessService("TableService",.tService) if $$$ISERR(tSC) quit
   		
		//Appel de la méthode
		#Dim pResult As DatabaseManager.Messages.BusinessServices.CreateTableResponse 
		Set tSC = tService.ProcessInput(pRequest,.pResult,"createTable") 
		if $$$ISERR(tSC) Throw tSC
		
    } catch(exception) {
    	Set tSC = ..ExceptionResponse(exception,.pResult)
    }
    
    //Message que l'on retourne en REST 
	set %response.ContentType = "application/json" 
	set tJSONStreamStatus =  ..ObjectToJSONStream(pResult, .tOut)
	set tSC = tOut.OutputToDevice(-1)
    Quit tSC
}

}
