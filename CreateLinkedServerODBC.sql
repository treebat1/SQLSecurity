USE [master]
GO


EXEC master.dbo.sp_addlinkedserver @server = N'\DATAMARTDEV', @srvproduct=N'', @provider=N'MSDASQL', @datasrc=N'DataMartDev_LinkedServer'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'\DATAMARTDEV',@useself=N'True',@locallogin=NULL,@rmtuser=NULL,@rmtpassword=NULL
GO

EXEC master.dbo.sp_serveroption @server=N'chdc--thsql2\DATAMARTDEV', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'chdc--thsql2\DATAMARTDEV', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'chdc--thsql2\DATAMARTDEV', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'chdc--thsql2\DATAMARTDEV', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'chdc--thsql2\DATAMARTDEV', @optname=N'rpc', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'chdc--thsql2\DATAMARTDEV', @optname=N'rpc out', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'chdc--thsql2\DATAMARTDEV', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'chdc--thsql2\DATAMARTDEV', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'chdc--thsql2\DATAMARTDEV', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'chdc--thsql2\DATAMARTDEV', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'chdc--thsql2\DATAMARTDEV', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'chdc--thsql2\DATAMARTDEV', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'chdc--thsql2\DATAMARTDEV', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO


