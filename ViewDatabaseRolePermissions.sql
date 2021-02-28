
SELECT DISTINCT left(rp.name, 20) AS RoleName
				,rp.type_desc
				,PermissionType = left(pm.class_desc,20), 
                left(pm.permission_name,20) AS PermissionName,
                left(pm.state_desc,20) AS StateDesc,
                left(CASE 
                               WHEN obj.type_desc IS NULL 
                                     OR obj.type_desc = 'SYSTEM_TABLE' THEN 
                               pm.class_desc 
                               ELSE obj.type_desc 
                             END,20) AS ObjectType,
				left(ss2.name,20) AS SchemaName,
				[ObjectName] = Isnull(ss.name, Object_name(pm.major_id))
FROM   sys.database_principals rp 
       LEFT JOIN sys.database_permissions pm 
               ON pm.grantee_principal_id = rp.principal_id 
       LEFT JOIN sys.schemas ss 
              ON pm.major_id = ss.schema_id 
       LEFT JOIN sys.objects obj 
              ON pm.[major_id] = obj.[object_id] 
	LEFT JOIN sys.schemas ss2
			ON obj.schema_id = ss2.schema_id
WHERE rp.type_desc = 'DATABASE_ROLE' 
--and Isnull(ss.name, Object_name(pm.major_id)) like 'cc'
and rp.name like 'DataReader_NotWherescape%'
--and pm.class_desc = 'schema'   
--and left(pm.state_desc,20) = 'Deny'         
ORDER  BY 7