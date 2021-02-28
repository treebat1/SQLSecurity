USE [Ws_DATAMART]
GO


DECLARE @OldRoleName sysname
DECLARE @NewRoleName sysname
set @OldRoleName = N'db_datareader'
set @NewRoleName = N'DataReader_NotWherescape'

IF @OldRoleName <> N'public'
BEGIN
    DECLARE @RoleMemberName sysname
    DECLARE Member_Cursor CURSOR FOR
    select [name]
    from sys.database_principals 
    where principal_id in ( 
        select member_principal_id
        from sys.database_role_members
        where role_principal_id in (
            select principal_id
            FROM sys.database_principals where [name] = @OldRoleName AND type = 'R'
									)
							)
	and [name] not like '%app%' 
	and [name] not like '%svc%' 
	and [name] not like '%ReadOnly%'
	and [name] not like '%admin%'
	and [name] not like '%Dev%'
	and [name] not like '%SQL%'
	order by 1

    OPEN Member_Cursor;

    FETCH NEXT FROM Member_Cursor
    into @RoleMemberName
    
    DECLARE @SQL NVARCHAR(4000)

    WHILE @@FETCH_STATUS = 0
    BEGIN

		SET @SQL = 'ALTER ROLE '+ QUOTENAME(@NewRoleName,'[') +' ADD MEMBER '+ QUOTENAME(@RoleMemberName,'[')
        print @SQL
		--EXEC(@SQL)
        
        SET @SQL = 'ALTER ROLE '+ QUOTENAME(@OldRoleName,'[') +' DROP MEMBER '+ QUOTENAME(@RoleMemberName,'[')
        print @SQL
		--EXEC(@SQL)
        
        FETCH NEXT FROM Member_Cursor
        into @RoleMemberName
    END;

    CLOSE Member_Cursor;
    DEALLOCATE Member_Cursor;
END


