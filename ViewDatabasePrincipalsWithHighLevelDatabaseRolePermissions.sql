
SELECT db_name() AS DatabaseName, dp.name AS UserName,USER_NAME(drm.role_principal_id) AS MemberOfDBRole 
FROM sys.database_principals dp
INNER JOIN sys.database_role_members drm
ON dp.principal_id=drm.member_principal_id 
WHERE dp.sid NOT IN (0x01) AND dp.sid IS NOT NULL AND dp.type NOT IN ('C','R') AND dp.is_fixed_role <> 1 
AND dp.name NOT LIKE '##%' and USER_NAME(drm.role_principal_id) not like '%reader%'
order by dp.name