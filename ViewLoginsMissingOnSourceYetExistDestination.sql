select s.name SourceName, s.sid SourceSID, d.name DestinationName, d.sid DestinationSID
from [\DATAMARTDEV].master.sys.server_principals s 
right join [\datamartdev].master.sys.server_principals d
on s.sid = d.sid
where d.name not like 'NT Service%'
and d.name not like '##%'
and d.name not like '%test%'
and d.name not like 'uboc-ad\svc_car%'
and d.name not in ('DataMart_ReadOnly')
and s.sid is null


--Opposite.  Exist on Source but not Destination.
select s.name SourceName, s.sid SourceSID, d.name DestinationName, d.sid DestinationSID
from [\DATAMARTDEV].master.sys.server_principals s 
left join [\datamartdev].master.sys.server_principals d
on s.sid = d.sid
where s.name not like 'NT Service%'
and s.name not like '##%'
and s.name not like '%test%'
and s.name not in ('DataMart_ReadOnly')
and d.sid is null
