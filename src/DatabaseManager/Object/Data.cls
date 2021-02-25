Class DatabaseManager.Object.Data Extends (%SerialObject, %XML.Adaptor)
{

Property name As %String;

Property value As %String;

Storage Default
{
<Data name="DataState">
<Value name="1">
<Value>name</Value>
</Value>
<Value name="2">
<Value>value</Value>
</Value>
</Data>
<State>DataState</State>
<StreamLocation>^DatabaseManager.Object.DataS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
