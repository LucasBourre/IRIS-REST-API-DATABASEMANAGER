Class DatabaseManager.Messages.BasicResponse Extends Ens.Response
{

Property errorCode As %Integer;

Property errorLabel As %String(MAXLEN = 300);

Storage Default
{
<Data name="BasicResponseDefaultData">
<Subscript>"BasicResponse"</Subscript>
<Value name="1">
<Value>errorCode</Value>
</Value>
<Value name="2">
<Value>errorLabel</Value>
</Value>
</Data>
<DefaultData>BasicResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
