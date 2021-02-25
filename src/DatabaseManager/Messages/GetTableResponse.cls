Class DatabaseManager.Messages.GetTableResponse Extends DatabaseManager.Messages.BasicResponse
{

Property tableName As %String;

Property Properties As list Of DatabaseManager.Object.Property;

Storage Default
{
<Data name="GetTableResponseDefaultData">
<Subscript>"GetTableResponse"</Subscript>
<Value name="1">
<Value>tableName</Value>
</Value>
<Value name="2">
<Value>Properties</Value>
</Value>
</Data>
<DefaultData>GetTableResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
