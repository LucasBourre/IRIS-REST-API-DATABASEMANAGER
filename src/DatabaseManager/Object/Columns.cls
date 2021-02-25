Class Object.Columns Extends (%SerialObject, %XML.Adaptor)
{

Property name As %String;

Property type As %String;

Property maxlen As %Integer [ InitialExpression = 50 ];

Property index As %Boolean [ InitialExpression = 0 ];

Property required As %Boolean [ InitialExpression = 0 ];

Storage Default
{
<Data name="ColumnsState">
<Value name="1">
<Value>name</Value>
</Value>
<Value name="2">
<Value>type</Value>
</Value>
<Value name="3">
<Value>maxlen</Value>
</Value>
<Value name="4">
<Value>index</Value>
</Value>
<Value name="5">
<Value>required</Value>
</Value>
</Data>
<State>ColumnsState</State>
<StreamLocation>^Object.ColumnsS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
