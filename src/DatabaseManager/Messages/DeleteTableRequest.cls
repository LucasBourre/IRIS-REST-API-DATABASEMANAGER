Class DatabaseManager.Messages.DeleteTableRequest Extends DatabaseManager.Messages.BasicRequest
{

Property tableName As %String;

Storage Default
{
<Data name="DeleteTableRequestDefaultData">
<Subscript>"DeleteTableRequest"</Subscript>
<Value name="1">
<Value>tableName</Value>
</Value>
</Data>
<DefaultData>DeleteTableRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
