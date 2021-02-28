SELECT sp.name AS LoginName,sp.type_desc AS LoginType, sp.default_database_name AS DefaultDBName
FROM sys.server_principals sp  
WHERE sp.name = 'UBOC-AD\app_car_sql_admin'

