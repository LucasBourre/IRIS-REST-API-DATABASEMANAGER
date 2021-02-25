Class DatabaseManager.Messages.SearchDataRequest Extends DatabaseManager.Messages.BasicRequest
{

Property tableName As %String;

Property data As list Of DatabaseManager.Object.Data;

Storage Default
{
<Data name="SearchDataRequestDefaultData">
<Subscript>"SearchDataRequest"</Subscript>
<Value name="1">
<Value>tableName</Value>
</Value>
<Value name="2">
<Value>data</Value>
</Value>
</Data>
<DefaultData>SearchDataRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
