CREATE SCHEMA Utility;
GO
CREATE OR ALTER VIEW Utility.EffectiveSecurity
AS
WITH objects AS (
	SELECT objects.name AS object_name,
		   schemas.name AS schema_name,
		   object_id, objects.type_desc AS object_type
	FROM   sys.objects
	         JOIN sys.schemas
		    ON objects.schema_id = schemas.SCHEMA_ID
	WHERE objects.parent_object_id = 0 
     --no constraints that have the parent_object_id reference
     --or triggers
		)
	SELECT object_type,
		   schema_name, 
		   object_name,
		   permissions.permission_name
	FROM   objects
	         CROSS APPLY fn_my_permissions(schema_name + 
                                     '.' +  OBJECT_NAME, 'Object') AS permissions   
        --I am ignoring column level permissions. 
	WHERE  permissions.subentity_name = '' 
	--hide this object from view
	  AND NOT (objects.schema_name = 'Utility' 
               AND objects.object_name = 'EffectiveSecurity');
GO
--let every user check their permissions
GRANT SELECT ON Utility.EffectiveSecurity TO PUBLIC; 



--select *
--from sys.database_principals


EXECUTE AS USER = 'UBOC-AD\ru89368';
GO
SELECT SUSER_NAME() AS server_principal, 
       USER_NAME() AS database_principal;
 
SELECT *
FROM   Utility.EffectiveSecurity
where permission_name = 'insert';
 
REVERT;