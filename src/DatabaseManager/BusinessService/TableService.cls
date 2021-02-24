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
        Set tResponse= ##class(DatabaseManager.Messages.BusinessProcesses.CreateTableResponse).%New()
        Set tRequest = ##class(DatabaseManager.Messages.BusinessProcesses.CreateTableRequest).%New()
        
        //Recupération de la notification
        set tRequest = pInput 


        //Appel du BP RecupererGains
        s tSC = ..SendRequestSync("DatabaseManager.BusinessProcess.CreateTable", tRequest, .tResponse)	

        set pOutput = tResponse
    }catch Exception{
        s pOutput.errorCode = 200
        s pOutput.errorLabel = "Erreur : "_Exception.DisplayString()
    } 
    Quit $$$OK
}

}
