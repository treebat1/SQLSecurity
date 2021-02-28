select d.name Database_Name, p.name Database_Owner
from sys.databases d
join master.sys.server_principals p
on d.owner_sid = p.sid
order by 1