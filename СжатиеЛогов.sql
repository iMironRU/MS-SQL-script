----------------------------------------------------------
-- —Ћ”∆≈ЅЌџ≈ ѕ≈–≈ћ≈ЌЌџ≈
declare @db_name nvarchar(100) --им€ базы данных
declare cursor_size_srv cursor for

--выбираем все базы кроме системных
SELECT  name AS DBName 
FROM    sys.databases
where name not in ('master','msdb','model','tempdb') 
ORDER BY Name; 

-- ÷икл по всем базам, попавшим в выборку
OPEN cursor_size_srv
FETCH NEXT FROM cursor_size_srv INTO @db_name

WHILE (@@FETCH_STATUS=0)
	BEGIN	
		-- Ѕаза данных из цикла
		exec ('declare @logname nvarchar(100)
				USE [' + @db_name + ']
				SELECT @logname = name   FROM sys.database_files where type = 1
				ALTER DATABASE ' + @db_name + ' SET RECOVERY SIMPLE 
				DBCC SHRINKFILE (@logname , 10, TRUNCATEONLY)')
		-- —ледующа€ база данных
		FETCH NEXT FROM cursor_size_srv INTO @db_name
	END
CLOSE cursor_size_srv
DEALLOCATE cursor_size_srv
----------------------------------------------------------