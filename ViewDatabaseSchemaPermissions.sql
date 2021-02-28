


SELECT princ.name, princ.type_desc, perm.permission_name,  perm.state_desc, s.name SchemaName
FROM sys.database_permissions perm
join sys.database_principals princ
on perm.grantee_principal_id = princ.principal_id
join sys.schemas s 
on perm.major_id = s.schema_id
WHERE perm.class = 3 --schema
--and princ.name like '%origination%'
--o.name = 'vw_dim_cc_account'
--state_desc = 'Deny'
and type_desc in ('database_role')
order by 5
GO



SELECT princ.name, princ.type_desc, perm.permission_name,  perm.state_desc, s.name SchemaName
FROM sys.database_permissions perm
join sys.database_principals princ
on perm.grantee_principal_id = princ.principal_id
join sys.schemas s 
on perm.major_id = s.schema_id
WHERE perm.class = 3 --schema
and princ.name not like '%svc%'
--o.name = 'vw_dim_cc_account'
--state_desc = 'Deny'
and type_desc not in ('database_role', 'windows_group')
and perm.permission_name = 'Select'
order by 1,2,3,4
GO




--Distribution by Principal Name
SELECT princ.name, count(1) as PrincipalPermissionCount
FROM sys.database_permissions perm
join sys.database_principals princ
on perm.grantee_principal_id = princ.principal_id
join sys.schemas s 
on perm.major_id = s.schema_id
WHERE perm.class = 3 --schema
and princ.name not like '%svc%'
--and s.name = 'LendingClub'
--o.name = 'vw_dim_cc_account'
--state_desc = 'Deny'
and type_desc not in ('database_role', 'windows_group')
and perm.permission_name = 'Select'
group by princ.name
order by 2
GO




--MEDIAN
select DISTINCT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY s1.Number)
						OVER () 
						as MedianCount
from (
		SELECT princ.name as Name, count(1) as Number
		FROM sys.database_permissions perm
		join sys.database_principals princ
		on perm.grantee_principal_id = princ.principal_id
		join sys.schemas s 
		on perm.major_id = s.schema_id
		WHERE perm.class = 3 --schema
		and princ.name not like '%svc%'
		--and s.name = 'LendingClub'
		--o.name = 'vw_dim_cc_account'
		--state_desc = 'Deny'
		and type_desc not in ('database_role', 'windows_group')
		and perm.permission_name = 'Select'
		group by princ.name
		) s1


--Distribution by Schema
SELECT s.name AS Name, count(1) as Number
FROM sys.database_permissions perm
join sys.database_principals princ
on perm.grantee_principal_id = princ.principal_id
join sys.schemas s 
on perm.major_id = s.schema_id
WHERE perm.class = 3 --schema
and princ.name not like '%svc%'
--and s.name = 'LendingClub'
--o.name = 'vw_dim_cc_account'
--state_desc = 'Deny'
and type_desc not in ('database_role', 'windows_group')
and perm.permission_name = 'Select'
group by s.name
order by 2


--Median
select DISTINCT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY s1.Number)
						OVER () 
						as MedianCount
from
(
	SELECT s.name AS Name, count(1) as Number
	FROM sys.database_permissions perm
	join sys.database_principals princ
	on perm.grantee_principal_id = princ.principal_id
	join sys.schemas s 
	on perm.major_id = s.schema_id
	WHERE perm.class = 3 --schema
	and princ.name not like '%svc%'
	--and s.name = 'LendingClub'
	--o.name = 'vw_dim_cc_account'
	--state_desc = 'Deny'
	and type_desc not in ('database_role', 'windows_group')
	and perm.permission_name = 'Select'
	group by s.name
) S1
GO