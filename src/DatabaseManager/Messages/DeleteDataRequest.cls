Class DatabaseManager.Messages.DeleteDataRequest Extends DatabaseManager.Messages.BasicRequest
{

Property tableName As %String;

Property dataId As %String;

Storage Default
{
<Data name="DeleteDataRequestDefaultData">
<Subscript>"DeleteDataRequest"</Subscript>
<Value name="1">
<Value>tableName</Value>
</Value>
<Value name="2">
<Value>dataId</Value>
</Value>
</Data>
<DefaultData>DeleteDataRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
