Class DatabaseManager.Messages.GetDataRequest Extends DatabaseManager.Messages.BasicRequest
{

Property tableName As %String;

Property dataId As %String;

Storage Default
{
<Data name="GetDataRequestDefaultData">
<Subscript>"GetDataRequest"</Subscript>
<Value name="1">
<Value>tableName</Value>
</Value>
<Value name="2">
<Value>dataId</Value>
</Value>
</Data>
<DefaultData>GetDataRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
