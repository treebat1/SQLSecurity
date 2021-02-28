select *
from sys.database_principals
--12 UBOC-AD\CL_Datamart_Developers
--13 SSIS_ReadOnly

select *
from ssisdb.catalog.explicit_object_permissions 
where principal_id = 13
and object_type = 3 -- environments
order by 1,2

--3 and 6 are missing

/*
select *
from ssisdb.catalog.explicit_object_permissions 
order by principal_id
*/

SELECT e.environment_id, e.name As EnvironmentName, f.name As FolderName, f.folder_id
FROM catalog.environments e
join catalog.folders f 
on e.folder_id = f.folder_id
where e.environment_id in (3,6)
ORDER BY e.environment_id;
go


select p.*, pr.Name As PrincipalName, e.environment_id, e.name As EnvironmentName, f.folder_id, f.name As FolderName
from ssisdb.catalog.explicit_object_permissions p
join sys.database_principals pr on pr.principal_id = p.principal_id
join catalog.environments e on e.environment_id = p.object_id 
join catalog.folders f on f.folder_id = e.folder_id
where p.principal_id = 13
and p.object_type = 3 -- environments
order by 1,2


/*
EXECUTE AS LOGIN = 'uboc-ad\cl_datamart_developers';
select *
from ssisdb.catalog.effective_object_permissions
order by 1,2,3
REVERT;
GO
*/





