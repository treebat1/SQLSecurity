
/*  Sample Script for Database */



select db_name(database_id) DBName
, case encryption_state 
when 1 then 'unencrypted'
when 3 then 'encrypted'
end AS EncryptionStatus
, create_date, regenerate_date, modify_date, set_date, opened_date, key_algorithm
, key_length, encryptor_thumbprint, percent_complete
from sys.dm_database_encryption_keys



/*
USE master ;  
GO  
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '*rt@40(FL&dasl1';  
GO  
CREATE CERTIFICATE TestSQLServerCert   
WITH SUBJECT = 'Certificate to protect TDE key'  
GO  
-- Create a backup of the server certificate in the master database.  
-- The following code stores the backup of the certificate and the private key file in the default data location 
for this instance of SQL Server   
-- (C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA).  

BACKUP CERTIFICATE TestSQLServerCert   
TO FILE = 'TestSQLServerCert'  
WITH PRIVATE KEY   
(  
    FILE = 'SQLPrivateKeyFile',  
    ENCRYPTION BY PASSWORD = 'xxxxx'  
);  
GO  
-- Create a database to be protected by TDE.  
CREATE DATABASE CustRecords ;  
GO  
-- Switch to the new database.  
-- Create a database encryption key, that is protected by the server certificate in the master database.   
-- Alter the new database to encrypt the database using TDE.  
USE CustRecords;  
GO  
CREATE DATABASE ENCRYPTION KEY  
WITH ALGORITHM = AES_128  
ENCRYPTION BY SERVER CERTIFICATE TestSQLServerCert;  
GO  
ALTER DATABASE CustRecords  
SET ENCRYPTION ON;  
GO  




USE master ;  
GO  
EXEC master.dbo.sp_detach_db @dbname = N'CustRecords';  
GO  
-- Move or copy the database files from the source server to the same location on the destination server.   
-- Move or copy the backup of the server certificate and the private key file from the source server to the same location 
-- on the destination server.   
-- Create a database master key on the destination instance of SQL Server.   
USE master;  
GO  
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'xxxx';  
GO  
-- Recreate the server certificate by using the original server certificate backup file.   
-- The password must be the same as the password that was used when the backup was created.  

CREATE CERTIFICATE TestSQLServerCert   
FROM FILE = 'TestSQLServerCert'  
WITH PRIVATE KEY   
(  
    FILE = 'SQLPrivateKeyFile',  
    DECRYPTION BY PASSWORD = 'xxxxx'  
);  
GO  
-- Attach the database that is being moved.   
-- The path of the database files must be the location where you have stored the database files.  
CREATE DATABASE [CustRecords] ON   
( FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\CustRecords.mdf' ),  
( FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\CustRecords_log.LDF' )  
FOR ATTACH ;  
GO  
*/

/*
use master;
GO
select * FROM [master].[sys].[certificates]
*/


/*
DROP CERTIFICATE TestSQLServerCert  
*/
