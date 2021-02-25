Class DatabaseManager.BusinessOperation.TableOperation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Parameter SETTINGS = "generatedClass";

Property generatedClass As %String [ InitialExpression = "DatabaseManager.Datas" ];

Method createTable(pRequest As DatabaseManager.Messages.CreateTableRequest, pResponse As DatabaseManager.Messages.CreateTableResponse)
{
	set pResponse = ##class(DatabaseManager.Messages.CreateTableResponse).%New()
	set tableName = ..generatedClass_"."_ pRequest.tableName

	//TODO Check if Class already exists


	// If not , create class definition
	Set cdef = ##class(%Dictionary.ClassDefinition).%New(tableName)
	
	//Super of the class , to be persistent
	Set cdef.Super = "%Persistent,%Populate"

	// create class properties 
	for i=1:1:pRequest.columns.Count(){
		set propertyName = pRequest.columns.GetAt(i).name


		Set pdef = ##class(%Dictionary.PropertyDefinition).%New(tableName_":"_propertyName) 
		
		//TODO  : Determine the type of the property
		Set pdef.Type="%String"
		
		//insert property in the class Definition
		Do cdef.Properties.Insert(pdef)

	}
  

	// save the class definition object
	set tSC = cdef.%Save()
	$$$TRACE(tSC)
	Do $system.OBJ.Compile(tableName) 
	
	set pResponse.response ="OK"
   Quit $$$OK
}

Method modifyTable(pRequest As DatabaseManager.Messages.ModifyTableRequest, pResponse As DatabaseManager.Messages.ModifyTableResponse)
{
	set pResponse = ##class(DatabaseManager.Messages.ModifyTableResponse).%New()
	set pResponse.response ="OK"
   Quit $$$OK
}

Method getTable(pRequest As DatabaseManager.Messages.GetTableRequest, pResponse As DatabaseManager.Messages.GetTableResponse)
{
	set pResponse = ##class(DatabaseManager.Messages.GetTableResponse).%New()
	set pResponse.response ="OK"
   Quit $$$OK
}

Method deleteTable(pRequest As DatabaseManager.Messages.DeleteTableRequest, pResponse As DatabaseManager.Messages.DeleteTableResponse)
{
	set pResponse = ##class(DatabaseManager.Messages.DeleteTableResponse).%New()
	set pResponse.response ="OK"
   Quit $$$OK
}

XData MessageMap
{
<MapItems>
 	<MapItem MessageType="DatabaseManager.Messages.CreateTableRequest">
		<Method>createTable</Method>
 	</MapItem>
 	<MapItem MessageType="DatabaseManager.Messages.ModifyTableRequest">
		<Method>modifyTable</Method>
 	</MapItem>
 	<MapItem MessageType="DatabaseManager.Messages.GetTableRequest">
		<Method>getTable</Method>
 	</MapItem>
 	<MapItem MessageType="DatabaseManager.Messages.DeleteTableRequest">
		<Method>deleteTable</Method>
 	</MapItem>
</MapItems>
}

}
