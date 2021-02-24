Class DatabaseManager.Messages.CreateDataRequest Extends DatabaseManager.Messages.BasicRequest
{

Property tableName As %String;

Property data As list Of Object.Data;

Storage Default
{
<Data name="CreateDataRequestDefaultData">
<Subscript>"CreateDataRequest"</Subscript>
<Value name="1">
<Value>data</Value>
</Value>
<Value name="2">
<Value>tableName</Value>
</Value>
</Data>
<DefaultData>CreateDataRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
