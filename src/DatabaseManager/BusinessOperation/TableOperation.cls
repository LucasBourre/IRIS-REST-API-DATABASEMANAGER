Class DatabaseManager.BusinessOperation.TableOperation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Parameter SETTINGS = "generatedClass";

Property generatedClass As %String [ InitialExpression = "DatabaseManager.Datas" ];

Method createTable(pRequest As DatabaseManager.Messages.CreateTableRequest, pResponse As DatabaseManager.Messages.CreateTableResponse)
{
	set pResponse = ##class(DatabaseManager.Messages.CreateTableResponse).%New()
	Try{
		
		set tableName = ..generatedClass_"."_ pRequest.tableName

		// Check if Class already exists 
		if (##class(%Dictionary.CompiledClass).%ExistsId(tableName)){
			throw ##class(%Exception.General).%New("class "_tableName_" already exists")
		}

	//Create class definitionno
	Set cdef = ##class(%Dictionary.ClassDefinition).%New(tableName) 
	Set cdef.Super = "%Persistent"

	//Create class properties 
	for i=1:1:pRequest.columns.Count(){
		#Dim property As DatabaseManager.Object.Columns 
		set property = pRequest.columns.GetAt(i)
		set propertyName = property.name
		set propertyType = property.type 

		//classDefinition
		Set pdef = ##class(%Dictionary.PropertyDefinition).%New(tableName_":"_propertyName)  
		do ..getPropertyType(propertyType,.propertyObjectScript) 
		if ($L(propertyObjectScript)=0) Throw ##class(%Exception.General).%New("incorrect type "_propertyType_" .") 
		Set pdef.Type=propertyObjectScript
		
		//if required
		if (property.required) set pdef.Required =1 
		
		//insert property in the class Definition
		Do cdef.Properties.Insert(pdef)

	}
  

	// save the class definition object
	set tSC = cdef.%Save() 
	$$$TRACE(tSC)
	if (tSC){
		Do $system.OBJ.Compile(tableName) 
		set pResponse.response ="OK Table created."
	}else{
		Throw ##class(%Exception.General).%New("Error Compiling Class.")
	}

	}catch exception{
		set pResponse.response = exception.Name
	}
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
	Try{
		set tableName = ..generatedClass_"."_ pRequest.tableName
		
		// Check if Table already exists 
		if (##class(%Dictionary.CompiledClass).%ExistsId(tableName)) {
			set def=##class(%Dictionary.ClassDefinition).%OpenId(tableName)
			for i=1:1:def.Properties.Count() {
				set column = ##class(DatabaseManager.Object.Columns).%New()
				set column.name = def.Properties.GetAt(i).Parameters.GetNext()
				set column.type = "" 
				set column.index = ""
				set column.required = def.Properties.GetAt(i).Parameters.Required
				
				do pResponse.columns.Insert(column)
			} 
		} else {
			Throw ##class(%Exception.General).%New("Table does not exists.")
		}

		$$$TRACE(tableName)
		
		set pResponse.response ="OK"
	}catch Exception{
		set pResponse.response = Exception.Name 
	} 
   Quit $$$OK
}

Method deleteTable(pRequest As DatabaseManager.Messages.DeleteTableRequest, pResponse As DatabaseManager.Messages.DeleteTableResponse)
{
	set pResponse = ##class(DatabaseManager.Messages.DeleteTableResponse).%New()
	Try{

		set tableName = ..generatedClass_"."_ pRequest.tableName

		// Check if Table already exists 
		if (##class(%Dictionary.CompiledClass).%ExistsId(tableName)) {
			do ##class(%Dictionary.CompiledClass).%DeleteId(tableName)
			do ##class(%Dictionary.ClassDefinition).%DeleteId(tableName)
		} else {
			Throw ##class(%Exception.General).%New("Table does not exists.")
		}


	set pResponse.response ="OK table deleted."
	}catch Exception{
		set pResponse.response = Exception.Name 
	}
   Quit $$$OK
}

Method getPropertyType(propertyType As %String, Output objectScriptType As %String) As %Status
{
	set property = $ZCVT(propertyType,"U")  
	set objectScriptType = $CASE(property,
        "STRING":"%String",
        "TIMESTAMP": "%TimeStamp",
        "DATE": "%Date",
        "INTEGER": "%Integer",
        "INT": "%Integer",
        "DECIMAL": "%Decimal",
        "FLOAT": "%Float",
        "BOOLEAN": "%Boolean", 
        : ""
        ) 
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
