Class DatabaseManager.BusinessService.TableService Extends Ens.BusinessService
{

/// Name of the WebService
Parameter SERVICENAME = "DatabaseManager.BusinessService.TableService";

Method OnProcessInput(pDemande As %RegisteredObject, Output pResponse As %RegisteredObject, ByRef pHint As %String) As %Status
{

        set sc = $CASE(pHint,
        "createTable": ..CreateTable(pDemande,.pResponse),
        "modifyTable": ..CreateTable(pDemande,.pResponse),
        "getTable": ..CreateTable(pDemande,.pResponse),
        "deleteTable": ..CreateTable(pDemande,.pResponse),
        : $$$ERROR($$$NotImplemented)
        )
        Quit sc
}

Method CreateTable(tRequest As DatabaseManager.Messages.CreateTableRequest, Output tResponse As DatabaseManager.Messages.CreateTableResponse) As %Status
{
    //Init Response
    set tResponse = ##class(DatabaseManager.Messages.CreateTableResponse).%New()
    Try{  
        s tSC = ..SendRequestSync("DatabaseManager.BusinessOperation.TableOperation", tRequest, .tResponse)	 
    }catch Exception{ 
        s tResponse.response = "Erreur : "_Exception.DisplayString()
    } 
    Quit $$$OK
}

Method ModifyTable(tRequest As DatabaseManager.Messages.ModifyTableRequest, Output tResponse As DatabaseManager.Messages.ModifyTableResponse) As %Status
{
    //Init response
    set tResponse = ##class(DatabaseManager.Messages.ModifyTableResponse).%New()
    Try{  
        s tSC = ..SendRequestSync("DatabaseManager.BusinessOperation.TableOperation", tRequest, .tResponse)	 
    }catch Exception{ 
        s tResponse.response = "Erreur : "_Exception.DisplayString()
    } 
    Quit $$$OK
}

Method GetTable(tRequest As DatabaseManager.Messages.GetTableRequest, Output tResponse As DatabaseManager.Messages.GetTableResponse) As %Status
{
    //Init message
    set tResponse = ##class(DatabaseManager.Messages.GetTableResponse).%New()
    Try{ 
        s tSC = ..SendRequestSync("DatabaseManager.BusinessOperation.TableOperation", tRequest, .tResponse)	
    }catch Exception{ 
        s tResponse.response = "Erreur : "_Exception.DisplayString()
    } 
    Quit $$$OK
}

Method DeleteTable(tRequest As DatabaseManager.Messages.DeleteTableRequest, Output tResponse As DatabaseManager.Messages.DeleteTableResponse) As %Status
{
    //Init response message
    set tResponse = ##class(DatabaseManager.Messages.DeleteTableResponse).%New()
    Try{
        s tSC = ..SendRequestSync("DatabaseManager.BusinessOperation.TableOperation", tRequest, .tResponse)	
    }catch Exception{ 
        s tResponse.response = "Erreur : "_Exception.DisplayString()
    } 
    Quit $$$OK
}

}
