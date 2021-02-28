use ws_datamart
go
sp_helpuser 'uboc-ad\ub67101'

select dp.*, sp.*
from sys.database_principals dp
left join sys.server_principals sp
on dp.sid = sp.sid
where dp.type not in ('r') and (sp.is_disabled = 0  or sp.is_disabled is null)
and dp.name = 'uboc-ad\ub67101'
order by dp.create_date desc