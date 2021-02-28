--Everyone
 SELECT left(DP1.name,25) AS DatabaseRoleName,   
   left(isnull (DP2.name, 'No members'),50) AS DatabaseUserName   
 FROM sys.database_role_members AS DRM  
 RIGHT OUTER JOIN sys.database_principals AS DP1  
   ON DRM.role_principal_id = DP1.principal_id  
 LEFT OUTER JOIN sys.database_principals AS DP2  
   ON DRM.member_principal_id = DP2.principal_id  
WHERE DP1.type = 'R'
and DP1.name like '%db_datareader%'
and dp2.name not like '%Dev%'
and dp2.name not like 'uboc-ad\ub%'
and dp2.name not like 'uboc-ad\ru%'
ORDER BY 1, 2


/*
--Checking role within a role
select *
from sys.database_role_members
where role_principal_id = 196 or member_principal_id = 196
order by 1,2

select *
from sys.database_role_members
where role_principal_id = 200 or member_principal_id = 200
order by 1,2

select *
from sys.database_principals
order by 2
*/

 SELECT dp1.principal_id, left(DP1.name,50) AS DatabaseRoleName,   
   left(isnull (DP2.name, 'No members'),50) AS DatabaseUserName   
 FROM sys.database_role_members AS DRM  
 RIGHT OUTER JOIN sys.database_principals AS DP1  
   ON DRM.role_principal_id = DP1.principal_id  
 LEFT OUTER JOIN sys.database_principals AS DP2  
   ON DRM.member_principal_id = DP2.principal_id  
WHERE --DP1.type = 'R'
--and 
DP1.name like '%datareader_NotWherescape%'
ORDER BY 1, 2

