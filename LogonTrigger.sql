USE DBA
GO


-- Create table to hold valid IP values
CREATE TABLE RestrictedIPAddress (IP NVARCHAR(15)
CONSTRAINT PK_RestrictedAddress PRIMARY KEY)

-- Declare machine as invalid one
INSERT INTO dbo.RestrictedIPAddress
SELECT '10.10.10.22'

select *
from dbo.RestrictedIPAddress

--select 1/0

select *
from sys.triggers



-- Create Logon Trigger to stop logins from invalid IPs
CREATE TRIGGER tr_LogOn_CheckIP ON ALL SERVER
    FOR LOGON
AS
    BEGIN
        DECLARE @IPAddress NVARCHAR(50) ;
        SET @IPAddress = EVENTDATA().value('(/EVENT_INSTANCE/ClientHost)[1]',
                                           'NVARCHAR(50)') ;
		--print @IPAddress
		--print ORIGINAL_LOGIN()
		--select 1/0  --DANGER:  This throws an error that will lock everyone out!

        IF  EXISTS ( SELECT  1
                       FROM    DBA.dbo.RestrictedIPAddress
                       WHERE   IP = @IPAddress)
			AND ORIGINAL_LOGIN() = 'Resonance'
            BEGIN
            --If login is not a valid one, then undo login process
                ROLLBACK --Undo login process
            END

    END


drop trigger tr_LogOn_CheckIP ON ALL SERVER


---------------------------------------------

/* 


select eventdata().value('(/EVENT_INSTANCE/ClientHost)[1]',
                                           'NVARCHAR(50)')

DECLARE @data XML
SET @data = EVENTDATA()
 
DECLARE @AppName sysname
       ,@LoginName sysname
       ,@LoginType sysname
       ,@LoginDomain sysname
       ,@HostName sysname

SELECT @AppName = [program_name]
FROM sys.dm_exec_sessions
WHERE session_id = @data.value('(/EVENT_INSTANCE/SPID)[1]', 'int')

SELECT @LoginName = @data.value('(/EVENT_INSTANCE/LoginName)[1]', 'sysname')
      --,@LoginDomain = @data.value('(/EVENT_INSTANCE/LoginDomain', 'sysname')
      ,@LoginType = @data.value('(/EVENT_INSTANCE/LoginType)[1]', 'sysname')
      ,@HostName = @data.value('(/EVENT_INSTANCE/ClientHost)[1]', 'sysname')

select @LoginType

select *
from sys.dm_exec_sessions



select EVENTDATA().value('(/EVENT_INSTANCE/ClientHost)[1]',
                                           'NVARCHAR(50)') ;

*/

