
EXECUTE AS LOGIN = 'uboc-ad\rx95913';
SELECT left(entity_name, 50), left(permission_name, 50)
FROM fn_my_permissions(NULL, 'server') 
    ORDER BY subentity_name, permission_name ;  
REVERT;
GO