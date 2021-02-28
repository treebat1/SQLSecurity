
--Old file
SELECT * --top 100 statement
FROM sys.fn_get_audit_file ('d:\PHI_Audit\PHI_Audit_9FADC5EC-33CD-4283-A706-CD17DB6CF457_0_130707917149880000.sqlaudit',default,default)
where server_principal_name = 'EC2\admincr'
GO


--d:\PHI_Audit\PHI_Audit_9FADC5EC-33CD-4283-A706-CD17DB6CF457_0_130710007403600000.sqlaudit

--New File
SELECT  top 100 statement
FROM sys.fn_get_audit_file ('d:\PHI_Audit\PHI_Audit_9FADC5EC-33CD-4283-A706-CD17DB6CF457_0_130710007403600000.sqlaudit',default,default)
--where server_principal_name = 'EC2\admincr'
where statement like '%name%'
order by event_time desc
GO





--Newest File
SELECT  *--, top 100 statement
FROM sys.fn_get_audit_file ('d:\PHI_Audit\PHI_Audit_9FADC5EC-33CD-4283-A706-CD17DB6CF457_0_130710196901880000.sqlaudit',default,default)
--where server_principal_name = 'EC2\adminsv'
order by event_time desc
GO


select top 1 *
from dbo.patient