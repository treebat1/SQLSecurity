/* 
9/9/2019
Created by Christopher Riley
sp_ShowUserPermissions created by Thomas Hull, MUFG Union Bank
*/


use ws_datamart
go

declare @UserName1 as varchar(100)
declare @UserName2 as varchar(100)

set @UserName1 = 'UBOC-AD\cl_datamart_developers'
set @UserName2 = 'UBOC-AD\71313_CreditCard_Risk'

create table #Users (
column1 varchar(100)
,column2 varchar(100)
,column3 varchar(100)
,column4 varchar(100)
,column5 varchar(100)
,column6 varchar(100)
,column7 varchar(100)
,DBPrincipalName varchar(100)
,column9 varchar(100)
,Command varchar(200)
,column11 varchar(100)
,column12 varchar(100)
,column13 varchar(100)
,column14 varchar(100)
)

insert into #Users
exec sp_ShowUserPermissions @UserName1

insert into #Users
exec sp_ShowUserPermissions @UserName2

select 'BOTH ' + @UserName1 + ' AND ' + @UserName2 AS [UserID]
, replace(Command,DBPrincipalName,'Both') AS [Permissions]
from #Users
group by replace(Command,DBPrincipalName,'Both')
having count(1) > 1
UNION
select 'ONLY ' + DBPrincipalName, u1.Command
from #Users u1
where replace(u1.Command,u1.DBPrincipalName,'User') 
			not in (select replace(u2.Command,u2. DBPrincipalName,'User')
					from #Users u2
					group by replace(u2.Command,u2. DBPrincipalName,'User')
					having count(1) > 1)
order by 1,2

drop table #Users
