SELECT sp.name AS LoginName,sp.type_desc AS LoginType, sp.default_database_name AS DefaultDBName,slog.sysadmin AS SysAdmin
,slog.securityadmin AS SecurityAdmin,slog.serveradmin AS ServerAdmin, slog.setupadmin AS SetupAdmin, slog.processadmin AS ProcessAdmin
, slog.diskadmin AS DiskAdmin, slog.dbcreator AS DBCreator,slog.bulkadmin AS BulkAdmin
FROM sys.server_principals sp  
JOIN master..syslogins slog
ON sp.sid=slog.sid 
WHERE sp.type  <> 'R' AND sp.name NOT LIKE '##%'
order by sp.Name



EXEC master.sys.sp_helpsrvrolemember 'sysadmin'





SELECT pr.name, pr.type_desc, pe.state_desc, pe.permission_name 
FROM sys.server_principals AS pr 
JOIN sys.server_permissions AS pe 
ON pe.grantee_principal_id = pr.principal_id
where pe.permission_name = 'View Any Definition'
order by pr.name;


SELECT pr.name, pr.type_desc, pe.state_desc, pe.permission_name 
FROM sys.server_principals AS pr 
JOIN sys.server_permissions AS pe 
ON pe.grantee_principal_id = pr.principal_id
where pe.permission_name = 'View Server State'
order by pr.name;


SELECT pe.class_desc, pr.name, pr.type_desc, pe.state_desc, pe.permission_name, ep.name
FROM sys.server_principals AS pr 
JOIN sys.server_permissions AS pe 
ON pe.grantee_principal_id = pr.principal_id
LEFT OUTER JOIN sys.endpoints ep ON ep.endpoint_id = pe.major_id
where (pe.permission_name = 'CONNECT SQL' AND pe.class_desc = 'Server')
OR (pe.permission_name = 'CONNECT' AND pe.class_desc = 'ENDPOINT')
order by pe.class_desc, pr.name;



EXECUTE AS LOGIN = 'Target';
SELECT * FROM fn_my_permissions(NULL, 'server') 
    ORDER BY subentity_name, permission_name ;  
REVERT;
GO






