--View Login Information

select *
from sys.server_principals
where type = 'S'

--This will show the password policy
SELECT LOGINPROPERTY('target', 'HistoryLength');
GO

SELECT LOGINPROPERTY('target', 'IsMustChange');
GO

SELECT LOGINPROPERTY('target', 'BadPasswordCount');
GO

SELECT LOGINPROPERTY('target', 'BadPasswordTime');
GO

SELECT LOGINPROPERTY('target', 'LockoutTime');
GO

SELECT LOGINPROPERTY('target', 'PasswordLastSetTime');
GO

SELECT LOGINPROPERTY('target', 'DaysUntilExpiration');
GO