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

	//Create class definition
	Set cdef = ##class(%Dictionary.ClassDefinition).%New(tableName) 
	Set cdef.Super = "%Persistent"

	//Create class properties 
	for i=1:1:pRequest.properties.Count(){
		#Dim property As DatabaseManager.Object.Property 
		set property = pRequest.properties.GetAt(i)
		set propertyName = property.name
		set propertyType = property.type 

		//classDefinition
		Set pdef = ##class(%Dictionary.PropertyDefinition).%New(tableName_":"_propertyName)  
		do ..getPropertyType(propertyType,.propertyObjectScript) 
		if ($L(propertyObjectScript)=0) Throw ##class(%Exception.General).%New("incorrect type "_propertyType_" .") 
		Set pdef.Type=propertyObjectScript
		
		//if required
		if (property.required) set pdef.Required =1 
		
		// if initialExpression
		if ($L(property.initialExpression)) set pdef.InitialExpression = """"_property.initialExpression_""""

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
	Try{
		set tableName = ..generatedClass_"."_ pRequest.tableName
		
		// Check if Table already exists  
		if (##class(%Dictionary.CompiledClass).%ExistsId(tableName)) {
			set def=##class(%Dictionary.ClassDefinition).%OpenId(tableName) 
			

			for i=1:1:pRequest.properties.Count(){
				#Dim property As DatabaseManager.Object.Property
				set property = pRequest.properties.GetAt(i)

				set foundPropertyIndex = 0
				for j=1:1:def.Properties.Count(){
					#Dim currentProperty As %Dictionary.PropertyDefinition
					set currentProperty = def.Properties.GetAt(j)
					if (property.name = currentProperty.Name){
						set foundPropertyIndex =1
						Quit
					} 
				}

				if (foundPropertyIndex =0){
 					throw ##class(%Exception.General).%New("The property "_property.name_" does not exist.")
				}else{
					// found property , we try to modify it
					do ..getPropertyType(property.type,.propertyObjectScript) 
					if ($L(propertyObjectScript)=0) Throw ##class(%Exception.General).%New("incorrect type "_property.type_" .") 
					$$$TRACE(propertyObjectScript)
					set currentProperty.Type = propertyObjectScript
					set currentProperty.Required = property.required 
					if ($L(property.initialExpression)) set currentProperty.InitialExpression = """"_property.initialExpression_""""
					//try to save the data
					set tSC = currentProperty.%Save() 
					$$$TRACE(tSC)
					if $$$ISERR(tSC) throw ##class(%Exception.General).%New("cannot save property : "_tSC)
				}
			}
 
			
			set tSC = def.%Save() 
			
			Do $system.OBJ.Compile(tableName) 
		} else {
			Throw ##class(%Exception.General).%New("Table does not exists.")
		}

		
		set pResponse.response ="OK"
	}catch Exception{
		set pResponse.response = Exception.DisplayString() 
	} 
	
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
			//For each properties, create a property 
			for i=1:1:def.Properties.Count() {
				set property = ##class(DatabaseManager.Object.Property).%New()
				set property.name = def.Properties.GetAt(i).Name
				set property.type =  def.Properties.GetAt(i).Type
				set property.required = def.Properties.GetAt(i).Required
				if (def.Properties.GetAt(i).InitialExpression '= """""") set property.initialExpression = def.Properties.GetAt(i).InitialExpression
				do pResponse.Properties.Insert(property)
			}
			set pResponse.tableName = pRequest.tableName
		} else {
			Throw ##class(%Exception.General).%New("Table does not exists.")
		}
 
		
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
			// we truncate the table
			do $SYSTEM.SQL.Execute("TRUNCATE TABLE "_tableName)

			//we delete the class and the definition
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
		"%STRING":"%String",
        "TIMESTAMP": "%TimeStamp",
		"%TimeStamp":"%TimeStamp",
		"%Date":"%Date",
        "DATE": "%Date",
		"%Integer":"%Integer",
        "INTEGER": "%Integer",
        "INT": "%Integer",
		"%Decimal":"%Decimal",
        "DECIMAL": "%Decimal",
        "FLOAT": "%Float",
		"%Float":"%Float",
        "BOOLEAN": "%Boolean", 
		"%Boolean":"%Boolean",
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
