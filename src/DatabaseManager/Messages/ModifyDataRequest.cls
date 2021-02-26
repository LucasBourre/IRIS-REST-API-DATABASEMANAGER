Class DatabaseManager.Messages.ModifyDataRequest Extends DatabaseManager.Messages.BasicRequest
{

Property tableName As %String;

Property dataId As %Integer;

Property data As list Of DatabaseManager.Object.Data;

Storage Default
{
<Data name="ModifyDataRequestDefaultData">
<Subscript>"ModifyDataRequest"</Subscript>
<Value name="1">
<Value>tableName</Value>
</Value>
<Value name="2">
<Value>dataId</Value>
</Value>
<Value name="3">
<Value>data</Value>
</Value>
</Data>
<DefaultData>ModifyDataRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
