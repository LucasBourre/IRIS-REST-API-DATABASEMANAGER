Class DatabaseManager.Messages.GetDataResponse Extends DatabaseManager.Messages.BasicResponse
{

Property tableName As %String;

Property data As list Of DatabaseManager.Object.Data;

Storage Default
{
<Data name="GetDataResponseDefaultData">
<Subscript>"GetDataResponse"</Subscript>
<Value name="1">
<Value>tableName</Value>
</Value>
<Value name="2">
<Value>data</Value>
</Value>
</Data>
<DefaultData>GetDataResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
