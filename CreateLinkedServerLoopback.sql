-----------------------------------------------------------------------
-------------------------------------------------------------------------
--Loopback linked server example.


EXEC sys.sp_addlinkedserver @server = 'RESADMINDB', -- sysname
    @srvproduct = N'', -- nvarchar(128)
    @provider = N'SQLNCLI', -- nvarchar(128)
    @datasrc = N'colo0-db2', -- nvarchar(4000)
    @location = NULL, -- nvarchar(4000)
    @provstr = NULL, -- nvarchar(4000)
    @catalog = NULL -- sysname

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RESADMINDB',@useself=N'False',@locallogin=NULL,@rmtuser=N'Resonance',@rmtpassword=''
go
    
EXEC master.dbo.sp_serveroption @server=N'RESADMINDB', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'RESADMINDB', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'RESADMINDB', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'RESADMINDB', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'RESADMINDB', @optname=N'rpc', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'RESADMINDB', @optname=N'rpc out', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'RESADMINDB', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'RESADMINDB', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'RESADMINDB', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'RESADMINDB', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'RESADMINDB', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'RESADMINDB', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'RESADMINDB', @optname=N'remote proc transaction promotion', @optvalue=N'true'



-----------------------------------------------------------------------------------------------------------------------------



EXEC sys.sp_addlinkedserver @server = 'RESCONFIG', -- sysname
    @srvproduct = N'', -- nvarchar(128)
    @provider = N'SQLNCLI', -- nvarchar(128)
    @datasrc = N'colo0-db2', -- nvarchar(4000)
    @location = NULL, -- nvarchar(4000)
    @provstr = NULL, -- nvarchar(4000)
    @catalog = NULL -- sysname

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RESCONFIG',@useself=N'False',@locallogin=NULL,@rmtuser=N'Resonance',@rmtpassword=''
go
EXEC master.dbo.sp_serveroption @server=N'RESCONFIG', @optname=N'collation compatible', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RESCONFIG', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RESCONFIG', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RESCONFIG', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RESCONFIG', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RESCONFIG', @optname=N'rpc out', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RESCONFIG', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RESCONFIG', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RESCONFIG', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'RESCONFIG', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RESCONFIG', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RESCONFIG', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RESCONFIG', @optname=N'remote proc transaction promotion', @optvalue=N'true'

-----------------------------------------------------------------------------------------



EXEC sys.sp_addlinkedserver @server = 'RESLOG', -- sysname
    @srvproduct = N'', -- nvarchar(128)
    @provider = N'SQLNCLI', -- nvarchar(128)
    @datasrc = N'colo0-db2', -- nvarchar(4000)
    @location = NULL, -- nvarchar(4000)
    @provstr = NULL, -- nvarchar(4000)
    @catalog = NULL -- sysname

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RESLOG',@useself=N'False',@locallogin=NULL,@rmtuser=N'Resonance',@rmtpassword=''
go
EXEC master.dbo.sp_serveroption @server=N'RESLOG', @optname=N'collation compatible', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RESLOG', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RESLOG', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RESLOG', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RESLOG', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RESLOG', @optname=N'rpc out', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RESLOG', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RESLOG', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RESLOG', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'RESLOG', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RESLOG', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RESLOG', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RESLOG', @optname=N'remote proc transaction promotion', @optvalue=N'true'
   
