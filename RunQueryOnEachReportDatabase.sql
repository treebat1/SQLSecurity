DECLARE @name VARCHAR(100) -- database name  
declare @i int --counter for while loop
declare @maxIdid int  --for while loop
declare @sql nvarchar(1000) --for dynamic sql
DECLARE @Return INT  --for error handling

set nocount on

create table #tempDBName
(idid int not null identity(1,1)
, DBName varchar(100))

insert into #tempDBName
(DBName)
SELECT d.name 
FROM sys.master_files mf
join sys.databases d on d.database_id = mf.database_id
where mf.physical_name like '%mdf'--only mdf
and d.name not in ('distribution','tempdb','model','master','msdb')
--and d.name in ('abercrombie','gillyhicks','hollister','cotswold','farfetch','adidasglobal','forever21','reebokglobal','gamestop','toysrus','nike','audioeditions','emarketer','ruelala'
--,'zooplus','lyreco','staples','victoriassecret')
and d.name not like '%restore%' and d.name not like '%test%'
and mf.state = 0  -- only online
order by d.name


select @maxIdid = MAX(idid) from #tempDBName

set @i = 1

WHILE @i <= @maxIdid   
BEGIN   
	select @name = DBName from #tempDBName where idid = @i
	--print @name
	IF exists (select 1 from master.dbo.sysdatabases where name = @name)  --make sure the db is still there
		BEGIN	
				set @sql = N'use ' + @Name + '; SELECT db_name() AS DatabaseName, dp.name AS UserName,USER_NAME(drm.role_principal_id) AS AssociatedDBRole 
													FROM sys.database_principals dp
													LEFT OUTER JOIN sys.database_role_members drm
													ON dp.principal_id=drm.member_principal_id 
													WHERE dp.sid NOT IN (0x01) AND dp.sid IS NOT NULL AND dp.type NOT IN (''C'') AND dp.is_fixed_role <> 1 
													AND dp.name NOT LIKE ''##%''
													and USER_NAME(drm.role_principal_id) is NULL
													and dp.name = ''COLO\Corp BI Admins''
													order by dp.name'
				--print @sql
				EXEC @Return = sp_executesql @sql
		END
	set @i = @i + 1
END   

drop table #tempDBName



--SELECT dp.name AS UserName,USER_NAME(drm.role_principal_id) AS AssociatedDBRole 
--FROM sys.database_principals dp
--LEFT OUTER JOIN sys.database_role_members drm
--ON dp.principal_id=drm.member_principal_id 
--WHERE dp.sid NOT IN (0x01) AND dp.sid IS NOT NULL AND dp.type NOT IN ('C') AND dp.is_fixed_role <> 1 
--AND dp.name NOT LIKE '##%'
--and USER_NAME(drm.role_principal_id) is NULL
--and dp.name = 'COLO\Corp BI Admins'
--order by dp.name

