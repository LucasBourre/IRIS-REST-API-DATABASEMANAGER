Class DatabaseManager.BusinessService.DataService Extends Ens.BusinessService
{

Parameter SERVICENAME = "DataService";

Method OnProcessInput(pDemande As %RegisteredObject, Output pResponse As %RegisteredObject, ByRef pHint As %String) As %Status
{
 
        set sc = $CASE(pHint,
        "createData": ..createData(pDemande,.pResponse),
        "searchData": ..searchData(pDemande,.pResponse),
        "getData": ..getData(pDemande,.pResponse),
        "modifyData": ..modifyData(pDemande,.pResponse),
        "deleteData": ..deleteData(pDemande,.pResponse),
        : $$$ERROR($$$NotImplemented)
        )
        Quit sc
}

Method createData(pInput As DatabaseManager.Messages.BusinessServices.CreateDataRequest, Output pOutput As DatabaseManager.Messages.BusinessServices.CreateDataResponse) As %Status
{
    set pOutput = ##class(DatabaseManager.Messages.BusinessServices.CreateDataResponse).%New()

    Try{
        Set tResponse= ##class(DatabaseManager.Messages.BusinessOperation.CreateDataResponse).%New()
        Set tRequest = ##class(DatabaseManager.Messages.BusinessOperation.CreateDataRequest).%New()
        
        set tRequest = pInput 

        s tSC = ..SendRequestSync("DatabaseManager.BusinessOperation.DataOperation", tRequest, .tResponse)	

        set pOutput = tResponse
    }catch Exception{
        s pOutput.errorCode = 500
        s pOutput.errorLabel = "Erreur : "_Exception.DisplayString()
    } 
    Quit $$$OK
}

Method searchData(pInput As DatabaseManager.Messages.BusinessServices.SearchDataRequest, Output pOutput As DatabaseManager.Messages.BusinessServices.SearchDataResponse) As %Status
{
    set pOutput = ##class(DatabaseManager.Messages.BusinessServices.SearchDataResponse).%New()

    Try{
        Set tResponse= ##class(DatabaseManager.Messages.BusinessOperation.SearchDataResponse).%New()
        Set tRequest = ##class(DatabaseManager.Messages.BusinessOperation.SearchDataRequest).%New()
        
        set tRequest = pInput 

        s tSC = ..SendRequestSync("DatabaseManager.BusinessOperation.DataOperation", tRequest, .tResponse)	

        set pOutput = tResponse
    }catch Exception{
        s pOutput.errorCode = 500
        s pOutput.errorLabel = "Erreur : "_Exception.DisplayString()
    } 
    Quit $$$OK
}

Method getData(pInput As DatabaseManager.Messages.BusinessServices.GetDataRequest, Output pOutput As DatabaseManager.Messages.BusinessServices.GetDataResponse) As %Status
{
    set pOutput = ##class(DatabaseManager.Messages.BusinessServices.GetDataResponse).%New()

    Try{
        Set tResponse= ##class(DatabaseManager.Messages.BusinessOperation.GetDataResponse).%New()
        Set tRequest = ##class(DatabaseManager.Messages.BusinessOperation.GetDataRequest).%New()
        
        set tRequest = pInput 

        s tSC = ..SendRequestSync("DatabaseManager.BusinessOperation.DataOperation", tRequest, .tResponse)	

        set pOutput = tResponse
    }catch Exception{
        s pOutput.errorCode = 500
        s pOutput.errorLabel = "Erreur : "_Exception.DisplayString()
    } 
    Quit $$$OK
}

Method modifyData(pInput As DatabaseManager.Messages.BusinessServices.ModifyDataRequest, Output pOutput As DatabaseManager.Messages.BusinessServices.ModifyDataResponse) As %Status
{
    set pOutput = ##class(DatabaseManager.Messages.BusinessServices.ModifyDataResponse).%New()

    Try{
        Set tResponse= ##class(DatabaseManager.Messages.BusinessOperation.ModifyDataResponse).%New()
        Set tRequest = ##class(DatabaseManager.Messages.BusinessOperation.ModifyDataRequest).%New()
        
        set tRequest = pInput 

        s tSC = ..SendRequestSync("DatabaseManager.BusinessOperation.DataOperation", tRequest, .tResponse)	

        set pOutput = tResponse
    }catch Exception{
        s pOutput.errorCode = 500
        s pOutput.errorLabel = "Erreur : "_Exception.DisplayString()
    } 
    Quit $$$OK
}

Method deleteData(pInput As DatabaseManager.Messages.BusinessServices.DeleteDataRequest, Output pOutput As DatabaseManager.Messages.BusinessServices.DeleteDataResponse) As %Status
{
    set pOutput = ##class(DatabaseManager.Messages.BusinessServices.DeleteDataResponse).%New()

    Try{
        Set tResponse= ##class(DatabaseManager.Messages.BusinessOperation.DeleteDataResponse).%New()
        Set tRequest = ##class(DatabaseManager.Messages.BusinessOperation.DeleteDataRequest).%New()
        
        set tRequest = pInput 

        s tSC = ..SendRequestSync("DatabaseManager.BusinessOperation.DataOperation", tRequest, .tResponse)	

        set pOutput = tResponse
    }catch Exception{
        s pOutput.errorCode = 500
        s pOutput.errorLabel = "Erreur : "_Exception.DisplayString()
    } 
    Quit $$$OK
}

}
