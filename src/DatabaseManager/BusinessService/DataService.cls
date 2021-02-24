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

Method createData(tRequest As DatabaseManager.Messages.CreateDataRequest, Output tResponse As DatabaseManager.Messages.CreateDataResponse) As %Status
{
    set tResponse = ##class(DatabaseManager.Messages.CreateDataResponse).%New()
    Try{ 
        s tSC = ..SendRequestSync("DatabaseManager.BusinessOperation.DataOperation", tRequest, .tResponse)	
    }catch Exception{ 
        s tResponse.response = "Erreur : "_Exception.DisplayString()
    } 
    Quit $$$OK
}

Method searchData(tRequest As DatabaseManager.Messages.SearchDataRequest, Output tResponse As DatabaseManager.Messages.SearchDataResponse) As %Status
{
    set tResponse = ##class(DatabaseManager.Messages.SearchDataResponse).%New()
    Try{
        s tSC = ..SendRequestSync("DatabaseManager.BusinessOperation.DataOperation", tRequest, .tResponse)	
    }catch Exception{ 
        s tResponse.response = "Erreur : "_Exception.DisplayString()
    } 
    Quit $$$OK
}

Method getData(tRequest As DatabaseManager.Messages.GetDataRequest, Output tResponse As DatabaseManager.Messages.GetDataResponse) As %Status
{
    set tResponse = ##class(DatabaseManager.Messages.GetDataResponse).%New()

    Try{
        s tSC = ..SendRequestSync("DatabaseManager.BusinessOperation.DataOperation", tRequest, .tResponse)	
    }catch Exception{ 
        s tResponse.response = "Erreur : "_Exception.DisplayString()
    } 
    Quit $$$OK
}

Method modifyData(tRequest As DatabaseManager.Messages.ModifyDataRequest, Output tResponse As DatabaseManager.Messages.ModifyDataResponse) As %Status
{
    set tResponse = ##class(DatabaseManager.Messages.ModifyDataResponse).%New()

    Try{
        s tSC = ..SendRequestSync("DatabaseManager.BusinessOperation.DataOperation", tRequest, .tResponse)	 
    }catch Exception{ 
        s tResponse.response = "Erreur : "_Exception.DisplayString()
    } 
    Quit $$$OK
}

Method deleteData(tRequest As DatabaseManager.Messages.DeleteDataRequest, Output tResponse As DatabaseManager.Messages.DeleteDataResponse) As %Status
{
    set tResponse = ##class(DatabaseManager.Messages.DeleteDataResponse).%New()
    Try{
        s tSC = ..SendRequestSync("DatabaseManager.BusinessOperation.DataOperation", tRequest, .tResponse)	
    }catch Exception{ 
        s tResponse.response = "Erreur : "_Exception.DisplayString()
    } 
    Quit $$$OK
}

}
