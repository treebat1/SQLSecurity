--SOURCE SERVER:

select db_name(database_id) DBName
, case encryption_state 
when 1 then 'unencrypted'
when 3 then 'encrypted'
end AS EncryptionStatus
, create_date, regenerate_date, modify_date, set_date, opened_date, key_algorithm
, key_length, encryptor_thumbprint, percent_complete
from sys.dm_database_encryption_keys


use master;
GO
select * FROM [master].[sys].[certificates]

select * from sys.symmetric_keys

select * from sys.key_encryptions

backup master key to file = 'D:\TDE\MasterKey'  
encryption by password = 'xxxxx'  


/* Next time, consider using BACKUP Service Master Key 

https://docs.microsoft.com/en-us/sql/relational-databases/security/encryption/back-up-the-service-master-key?view=sql-server-2016

Example:  
	USE master;
	GO
	BACKUP SERVICE MASTER KEY TO FILE = 'c:\temp_backups\keys\service_master_ key'
		ENCRYPTION BY PASSWORD = 'xxxxxxxxxxxxxxxxxxxxxx';
	GO

*/



BACKUP CERTIFICATE TDE_Cert
TO FILE = 'd:\TDE\TDE_Certificate'  
WITH PRIVATE KEY   
(  
    FILE = 'd:\TDE\TDE_Certificate_PrivateKeyFile',  
    ENCRYPTION BY PASSWORD = 'xxxx'  
);  
GO  


-------------------------------------------------------------------------

--DESTINATION SERVER: 

use master;
GO
select * FROM [master].[sys].[certificates]

select * from sys.symmetric_keys

select * from sys.key_encryptions

-- Restore database master key on the destination instance of SQL Server.   
USE master
go
RESTORE MASTER KEY   
    FROM FILE = 'D:\TDE\MasterKey'   
    DECRYPTION BY PASSWORD = 'xxxx'
       Encryption by password = 'yyyy';-- 'New Password'.  If this is set as New password, you will need to use
	   --: use master go OPEN MASTER KEY DECRYPTION BY PASSWORD = 'xxxx'    before each RESTORE OPERATION.

select * from sys.symmetric_keys

use master
go
OPEN MASTER KEY DECRYPTION BY PASSWORD = 'yyyy'   


/* Next time, consider using RESTORE Service Master Key 

https://docs.microsoft.com/en-us/sql/t-sql/statements/restore-service-master-key-transact-sql?view=sql-server-2016

Example:  
	RESTORE SERVICE MASTER KEY FROM FILE = 'path_to_file'   
		DECRYPTION BY PASSWORD = 'password' [FORCE]  
*/

use master
go
CREATE CERTIFICATE TDE_Cert 
FROM FILE = 'd:\TDE\TDE_Certificate'  
WITH PRIVATE KEY   
(  
    FILE = 'd:\TDE\TDE_Certificate_PrivateKeyFile',
    DECRYPTION BY PASSWORD = 'xxxx'  
);  
GO  


use master;
GO
select * FROM [master].[sys].[certificates]
