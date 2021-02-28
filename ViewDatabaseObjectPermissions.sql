use Provision
go


SELECT princ.name, princ.type_desc, perm.permission_name,  o.name ObjectName, perm.state_desc, s.name SchemaName
FROM sys.database_permissions perm
join sys.database_principals princ
on perm.grantee_principal_id = princ.principal_id
join sys.objects o
on o.object_id = perm.major_id
join sys.schemas s 
on o.schema_id = s.schema_id
WHERE perm.class = 1 --object or column
and s.name = 'LendingClub'
--o.name = 'vw_dim_cc_account'
--state_desc = 'Deny'
order by 1
GO