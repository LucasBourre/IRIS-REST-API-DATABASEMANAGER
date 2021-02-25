Class DatabaseManager.Messages.CreateDataRequest Extends DatabaseManager.Messages.BasicRequest
{

Property tableName As %String;

Property data As list Of DatabaseManager.Object.Data;

Storage Default
{
<Data name="CreateDataRequestDefaultData">
<Subscript>"CreateDataRequest"</Subscript>
<Value name="1">
<Value>tableName</Value>
</Value>
<Value name="2">
<Value>data</Value>
</Value>
</Data>
<DefaultData>CreateDataRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
