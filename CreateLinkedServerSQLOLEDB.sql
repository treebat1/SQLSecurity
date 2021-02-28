USE [master]
GO

/****** Object:  LinkedServer [DATAMARTDEVOLEDB]    Script Date: 6/17/2019 12:10:25 PM ******/
EXEC master.dbo.sp_addlinkedserver @server = N'DATAMARTDEVOLEDB', @srvproduct=N'', @provider=N'sqloledb', @datasrc=N'chdc\'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'DATAMARTDEVOLEDB',@useself=N'False',@locallogin=NULL,@rmtuser=NULL,@rmtpassword=NULL
GO

EXEC master.dbo.sp_serveroption @server=N'DATAMARTDEVOLEDB', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'DATAMARTDEVOLEDB', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'DATAMARTDEVOLEDB', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'DATAMARTDEVOLEDB', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'DATAMARTDEVOLEDB', @optname=N'rpc', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'DATAMARTDEVOLEDB', @optname=N'rpc out', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'DATAMARTDEVOLEDB', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'DATAMARTDEVOLEDB', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'DATAMARTDEVOLEDB', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'DATAMARTDEVOLEDB', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'DATAMARTDEVOLEDB', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'DATAMARTDEVOLEDB', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'DATAMARTDEVOLEDB', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO


