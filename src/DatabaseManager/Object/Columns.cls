Class Object.Columns Extends (%SerialObject, %XML.Adaptor)
{

Property name As %String;

Property type As %String;

Property maxlen As %Integer;

Property index As %Boolean;

Property required As %Boolean;

Property relationTable As %String;

Property relationColumn As %String;

Property dataTable As %String;

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
<Value name="6">
<Value>relationTable</Value>
</Value>
<Value name="7">
<Value>relationColumn</Value>
</Value>
<Value name="8">
<Value>dataTable</Value>
</Value>
</Data>
<State>ColumnsState</State>
<StreamLocation>^Object.ColumnsS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
