Class DatabaseManager.Object.Property Extends (%SerialObject, %XML.Adaptor)
{

Property name As %String;

Property type As %String;

Property index As %Boolean [ InitialExpression = 0 ];

Property required As %Boolean [ InitialExpression = 0 ];

Property initialExpression As %String;

Storage Default
{
<Data name="PropertyState">
<Value name="1">
<Value>name</Value>
</Value>
<Value name="2">
<Value>type</Value>
</Value>
<Value name="3">
<Value>index</Value>
</Value>
<Value name="4">
<Value>required</Value>
</Value>
<Value name="5">
<Value>initialExpression</Value>
</Value>
</Data>
<State>PropertyState</State>
<StreamLocation>^DatabaseManager.Ob585.PropertyS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
