select left(name,50) AS RoleName, type_desc, owning_principal_id
from sys.database_principals 
where type_desc = 'DATABASE_ROLE'
and is_fixed_role = 0
order by 1