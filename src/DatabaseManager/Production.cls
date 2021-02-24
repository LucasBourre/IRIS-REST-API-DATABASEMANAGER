Class DatabaseManager.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="DatabaseManager.Production" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="DatabaseManager.BusinessService.TableService" Category="" ClassName="DatabaseManager.BusinessService.TableService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
    <Item Name="DatabaseManager.BusinessOperation.TableOperation" Category="" ClassName="DatabaseManager.BusinessOperation.TableOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="DatabaseManager.BusinessService.DataService" Category="" ClassName="DatabaseManager.BusinessService.DataService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
    <Item Name="DatabaseManager.BusinessOperation.DataOperation" Category="" ClassName="DatabaseManager.BusinessOperation.DataOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
