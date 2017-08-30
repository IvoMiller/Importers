IF (DB_ID(N'$(DatabaseName)') IS NULL)
BEGIN
	PRINT N'Creating $(DatabaseName)...';
END
GO
IF (DB_ID(N'$(DatabaseName)') IS NULL)
BEGIN
	CREATE DATABASE [$(DatabaseName)]; -- MODIFY THIS STATEMENT TO SPECIFY A COLLATION FOR YOUR DATABASE

	ALTER DATABASE [$(DatabaseName)] ADD FILEGROUP whatever CONTAINS MEMORY_OPTIMIZED_DATA
	ALTER DATABASE [$(DatabaseName)] ADD FILE (name='whatever', filename='C:\Program Files\Microsoft SQL Server\MSSQL13.SQL2016\MSSQL\DATA\$(DatabaseName)') TO FILEGROUP whatever
END
