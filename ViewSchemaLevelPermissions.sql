

EXECUTE AS LOGIN = 'EC2\husain.lokhandwala';
SELECT * FROM fn_my_permissions('dbo', 'schema') 
    ORDER BY subentity_name, permission_name ;  
REVERT;
GO