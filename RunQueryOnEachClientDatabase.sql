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
SELECT DISTINCT(d.name)
FROM sys.master_files mf
join sys.databases d on d.database_id = mf.database_id
where mf.physical_name like '%mdf'--only mdf
and d.name not in ('distribution','tempdb','msdb','master'
,'ASP_NET_Session_State','Monitor','DBA','Web_Logs','LiteSpeedLocal')
--AND d.name NOT LIKE '%old%'
--AND d.name NOT LIKE '%qa%'
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

				set @sql = N'use ' + @name + '; GRANT VIEW DEFINITION ON SCHEMA:: [dbo] TO [public];'
				--print @sql
				EXEC @Return = sp_executesql @sql
	END
	set @i = @i + 1
END   

drop table #tempDBName

/*
GRANT VIEW DEFINITION ON SCHEMA:: [dbo] TO [public]
*/


/*
create user [COLO\CORP Dev SQL Read Only] for login [COLO\CORP Dev SQL Read Only];
create user [COLO\Corp-CTG-SoftwareQualityAssurance] for login [COLO\Corp-CTG-SoftwareQualityAssurance];
alter role db_datareader add member [COLO\CORP Dev SQL Read Only];
alter role db_datareader add member [COLO\Corp-CTG-SoftwareQualityAssurance];
*/

/*
alter role db_datareader drop member [COLO\CORP Dev SQL Read Only];
alter role db_datareader drop member [COLO\Corp-CTG-SoftwareQualityAssurance];
*/
/*
create user [COLO\Corp BI Developer] for login [COLO\Corp BI Developer];
ALTER ROLE [db_datawriter] ADD MEMBER [COLO\Corp BI Developer];
*/

/*
create user Resonance FOR login Resonance;
EXEC sp_change_users_login 'update_one', 'resonance', 'resonance';
ALTER ROLE [db_owner] ADD MEMBER Resonance;
*/

/*
create user [CORP\CorpResonanceAgent] for login [CORP\CorpResonanceAgent];
ALTER ROLE [db_owner] ADD MEMBER [CORP\CorpResonanceAgent]
*/

/*
create user [COLO\ResonanceAgent] for login [COLO\ResonanceAgent];
ALTER ROLE [db_owner] ADD MEMBER [COLO\ResonanceAgent]
*/


/*
'CREATE USER [CORP\hdfsserviceaccount] FOR LOGIN [CORP\hdfsserviceaccount];
ALTER ROLE [db_datareader] ADD MEMBER [CORP\hdfsserviceaccount];
ALTER ROLE [db_datawriter] ADD MEMBER [CORP\hdfsserviceaccount];
GRANT EXECUTE TO [CORP\hdfsserviceaccount];
'
*/


