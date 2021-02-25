Class DatabaseManager.Messages.ModifyTableRequest Extends DatabaseManager.Messages.BasicRequest
{

Property tableName As %String;

Property Properties As list Of DatabaseManager.Object.Property;

Storage Default
{
<Data name="ModifyTableRequestDefaultData">
<Subscript>"ModifyTableRequest"</Subscript>
<Value name="1">
<Value>tableName</Value>
</Value>
<Value name="2">
<Value>Properties</Value>
</Value>
</Data>
<DefaultData>ModifyTableRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
