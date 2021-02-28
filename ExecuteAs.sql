
use provision
go
SELECT top 100 * 
FROM [LendingClub].[Account_Activity]


EXECUTE AS LOGIN = 'UBOC-AD\RU85094';
SELECT top 100 * 
FROM [LendingClub].[Account_Activity]
REVERT;
GO




EXECUTE AS LOGIN = 'UBOC-AD\RU85094';
SELECT * FROM fn_my_permissions(NULL, 'server') 
    ORDER BY subentity_name, permission_name ;  
REVERT;
GO