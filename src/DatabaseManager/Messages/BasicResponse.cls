Class DatabaseManager.Messages.BasicResponse Extends Ens.Response
{

Property response As %String(MAXLEN = 500);

Storage Default
{
<Data name="BasicResponseDefaultData">
<Subscript>"BasicResponse"</Subscript>
<Value name="1">
<Value>response</Value>
</Value>
</Data>
<DefaultData>BasicResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
