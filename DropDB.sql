USE master;
GO
ALTER DATABASE FDB
SET SINGLE_USER --or RESTRICTED_USER
WITH ROLLBACK IMMEDIATE;
GO 
DROP DATABASE FDB
GO