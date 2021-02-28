SELECT sp.name AS LoginName,sp.type_desc AS LoginType, sp.default_database_name AS DefaultDBName,slog.sysadmin AS SysAdmin
,slog.securityadmin AS SecurityAdmin,slog.serveradmin AS ServerAdmin, slog.setupadmin AS SetupAdmin, slog.processadmin AS ProcessAdmin
, slog.diskadmin AS DiskAdmin, slog.dbcreator AS DBCreator,slog.bulkadmin AS BulkAdmin
FROM sys.server_principals sp  
JOIN master..syslogins slog
ON sp.sid=slog.sid 
WHERE sp.name NOT LIKE '##%' and sp.type  <> 'R' and sp.is_disabled = 0
and (slog.sysadmin > 0 or slog.sysadmin > 0 or slog.securityadmin >0 or slog.serveradmin >0 or	slog.setupadmin >0 or slog.processadmin >0 
		or slog.diskadmin >0 or slog.dbcreator>0 or slog.bulkadmin >0)
order by sp.Name
