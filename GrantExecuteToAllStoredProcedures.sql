--Grant Execute to All Stored Procedures in a Database
use DBA
go

/* CREATE A NEW ROLE */
CREATE ROLE db_executor

/* GRANT EXECUTE TO THE ROLE */
GRANT EXECUTE TO db_executor

--drop role db_exec

--------------------------


--Grant Execute to All Stored Procedures in One Database

GRANT EXECUTE TO Resonance

GRANT EXECUTE TO PUBLIC

