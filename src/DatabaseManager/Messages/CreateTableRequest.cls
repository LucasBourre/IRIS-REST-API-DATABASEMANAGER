Class DatabaseManager.Messages.CreateTableRequest Extends DatabaseManager.Messages.BasicRequest
{

Property tableName As %String;

Property properties As list Of DatabaseManager.Object.Property;

Storage Default
{
<Data name="CreateTableRequestDefaultData">
<Subscript>"CreateTableRequest"</Subscript>
<Value name="1">
<Value>tableName</Value>
</Value>
<Value name="2">
<Value>properties</Value>
</Value>
</Data>
<DefaultData>CreateTableRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
