sp_helplogins 'uboc-ad\cl_datamart_developers'

--select *
--from sys.server_permissions
--order by permission_name

--select *
--from sys.sql_logins


EXECUTE AS LOGIN = 'uboc-ad\ub67101';
SELECT * FROM fn_my_permissions(NULL, 'database') 
    ORDER BY subentity_name, permission_name ;  
REVERT;
GO

