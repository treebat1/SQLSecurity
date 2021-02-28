
select execute_as_principal_id
from sys.sql_modules


select *, execute_as_principal_id
from sys.server_sql_modules


select definition
from sys.server_sql_modules


select *
from sys.server_principals

select object_name(365244356)