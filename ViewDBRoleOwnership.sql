select db_name(), name, type_desc, owning_principal_id
from sys.database_principals 
where type_desc = 'DATABASE_ROLE'

select db_name(), name, type_desc, owning_principal_id
from sys.database_principals 
where type_desc = 'DATABASE_ROLE'
and owning_principal_id = (select principal_id from sys.database_principals where name = 'corp\dluke')




EXEC sp_msforeachdb 
'use ? select db_name(), name, type_desc
from sys.database_principals 
where type_desc = ''DATABASE_ROLE'' 
and owning_principal_id = (select principal_id 
from sys.database_principals 
where name = ''corp\dluke'')'