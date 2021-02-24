Class DatabaseManager.BusinessService.TableService Extends Ens.BusinessService
{

/// Name of the WebService
Parameter SERVICENAME = "TableService";

Method OnProcessInput(pDemande As %RegisteredObject, Output pResponse As %RegisteredObject, ByRef pHint As %String) As %Status
{
 
        set sc = $CASE(pHint,
        "createTable": ..CreateTable(pDemande,.pResponse),
        : $$$ERROR($$$NotImplemented)
        )
        Quit sc
}

Method CreateTable(pInput As DatabaseManager.Messages.BusinessServices.CreateTableRequest, Output pOutput As DatabaseManager.Messages.BusinessServices.CreateTableResponse) As %Status
{
    //Initialisation de la réponse pour le Catch
    set pOutput = ##class(DatabaseManager.Messages.BusinessServices.CreateTableResponse).%New()
    Try{
         //Création des messages de requetes / reponses
        Set tResponse= ##class(DatabaseManager.Messages.BusinessOperations.CreateTableResponse).%New()
        Set tRequest = ##class(DatabaseManager.Messages.BusinessOperations.CreateTableRequest).%New()
        
        //Recupération de la notification
        set tRequest = pInput 


        //Appel du BP RecupererGains
        s tSC = ..SendRequestSync("DatabaseManager.BusinessOperation.TableOperation", tRequest, .tResponse)	

        set pOutput = tResponse
    }catch Exception{
        s pOutput.errorCode = 200
        s pOutput.errorLabel = "Erreur : "_Exception.DisplayString()
    } 
    Quit $$$OK
}

Method ModifyTable(pInput As DatabaseManager.Messages.BusinessServices.ModifyTableRequest, Output pOutput As DatabaseManager.Messages.BusinessServices.ModifyTableResponse) As %Status
{
    //Initialisation de la réponse pour le Catch
    set pOutput = ##class(DatabaseManager.Messages.BusinessServices.ModifyTableResponse).%New()
    Try{
         //Création des messages de requetes / reponses
        Set tResponse= ##class(DatabaseManager.Messages.BusinessOperations.ModifyTableResponse).%New()
        Set tRequest = ##class(DatabaseManager.Messages.BusinessOperations.ModifyTableRequest).%New()
        
        //Recupération de la notification
        set tRequest = pInput 


        //Appel du BP RecupererGains
        s tSC = ..SendRequestSync("DatabaseManager.BusinessOperation.TableOperation", tRequest, .tResponse)	

        set pOutput = tResponse
    }catch Exception{
        s pOutput.errorCode = 200
        s pOutput.errorLabel = "Erreur : "_Exception.DisplayString()
    } 
    Quit $$$OK
}

Method GetTable(pInput As DatabaseManager.Messages.BusinessServices.GetTableRequest, Output pOutput As DatabaseManager.Messages.BusinessServices.GetTableResponse) As %Status
{
    //Initialisation de la réponse pour le Catch
    set pOutput = ##class(DatabaseManager.Messages.BusinessServices.GetTableResponse).%New()
    Try{
         //Création des messages de requetes / reponses
        Set tResponse= ##class(DatabaseManager.Messages.BusinessOperations.GetTableResponse).%New()
        Set tRequest = ##class(DatabaseManager.Messages.BusinessOperations.GetTableRequest).%New()
        
        //Recupération de la notification
        set tRequest = pInput 


        //Appel du BP RecupererGains
        s tSC = ..SendRequestSync("DatabaseManager.BusinessOperation.TableOperation", tRequest, .tResponse)	

        set pOutput = tResponse
    }catch Exception{
        s pOutput.errorCode = 200
        s pOutput.errorLabel = "Erreur : "_Exception.DisplayString()
    } 
    Quit $$$OK
}

Method DeleteTable(pInput As DatabaseManager.Messages.BusinessServices.DeleteTableRequest, Output pOutput As DatabaseManager.Messages.BusinessServices.DeleteTableResponse) As %Status
{
    //Initialisation de la réponse pour le Catch
    set pOutput = ##class(DatabaseManager.Messages.BusinessServices.DeleteTableResponse).%New()
    Try{
         //Création des messages de requetes / reponses
        Set tResponse= ##class(DatabaseManager.Messages.BusinessOperations.DeleteTableResponse).%New()
        Set tRequest = ##class(DatabaseManager.Messages.BusinessOperations.DeleteTableRequest).%New()
        
        //Recupération de la notification
        set tRequest = pInput 


        //Appel du BP RecupererGains
        s tSC = ..SendRequestSync("DatabaseManager.BusinessOperation.TableOperation", tRequest, .tResponse)	

        set pOutput = tResponse
    }catch Exception{
        s pOutput.errorCode = 200
        s pOutput.errorLabel = "Erreur : "_Exception.DisplayString()
    } 
    Quit $$$OK
}

}
