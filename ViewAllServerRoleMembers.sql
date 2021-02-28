select *
from sys.server_role_members


select srm.*, sp.name
from sys.server_principals sp
join sys.server_role_members srm on sp.principal_id = srm.member_principal_id
order by sp.name