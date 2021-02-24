Class DatabaseManager.Messages.GetTableRequest Extends DatabaseManager.Messages.BasicRequest
{

Property tableName As %String;

Storage Default
{
<Data name="GetTableRequestDefaultData">
<Subscript>"GetTableRequest"</Subscript>
<Value name="1">
<Value>tableName</Value>
</Value>
</Data>
<DefaultData>GetTableRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
