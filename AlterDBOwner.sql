select d.name, sp.name
from sys.databases d
join sys.server_principals sp on d.owner_sid = sp.sid

sp_helpdb coldwater

alter authorization on database::ColdWater to sa;

--Old Method
--EXEC dbo.sp_changedbowner @loginame=N'sa', @map=false
--GO
