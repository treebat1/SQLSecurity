




--DATABASE LEVEL
GRANT VIEW DEFINITION
TO [COLO\Corp BI Developer]


REVOKE VIEW DEFINITION
TO [COLO\Corp BI Developer]




--SERVER LEVEL
GRANT VIEW ANY DEFINITION
TO [COLO\Corp BI Developer]




--Use this for one database
use test 
go 
CREATE ROLE [ddl_viewer] 
GO 
GRANT VIEW DEFINITION TO ddl_viewer 
GO


--Use this for one schema
use test 
go 
CREATE ROLE [ddl_viewer] 
GO 
GRANT VIEW DEFINITION ON SCHEMA ::dbo TO ddl_viewer 
GO

USE [Test] 
GO 
EXEC sp_addrolemember N'ddl_viewer', N'Test' 
GO
-----------------------------
--Use this for one server.

use master
go
GRANT VIEW ANY DEFINITION TO Test ;
GO 


use master
go
GRANT VIEW ANY DEFINITION TO [corp\dev sql read only];
GO 


use master
go
GRANT VIEW ANY DEFINITION TO [COLO\CORP BI Developer];
GO 


use Template
go
create user test for login test

EXEC sp_addrolemember N'db_datareader', N'Test' 
GO

--Let see if I can elevate my permissions or someone else.  I wasn't able to .
/*
grant execute on dbo.Activity_Log_Insert to test

grant execute on dbo.Activity_Log_Insert to Resonance

*/