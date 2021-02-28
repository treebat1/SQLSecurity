sp_helplogins 

--select *
--from sys.server_permissions
--order by permission_name

--select *
--from sys.sql_logins


EXECUTE AS LOGIN = 'uboc-ad\svc_cl_dm';
SELECT * FROM fn_my_permissions(NULL, 'database') 
    ORDER BY subentity_name, permission_name ;  
REVERT;
GO


SELECT dp.name AS UserName,USER_NAME(drm.role_principal_id) AS AssociatedDBRole 
FROM sys.database_principals dp
LEFT OUTER JOIN sys.database_role_members drm
ON dp.principal_id=drm.member_principal_id 
WHERE dp.sid NOT IN (0x01) AND dp.sid IS NOT NULL AND dp.type NOT IN ('C') AND dp.is_fixed_role <> 1 
AND dp.name NOT LIKE '##%'
order by dp.name
