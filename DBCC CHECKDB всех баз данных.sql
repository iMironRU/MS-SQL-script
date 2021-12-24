declare cur cursor for
 select name  from sys.databases 
   where  
   --name not in ('master','msdb','model','tempdb') --фильтр БД
   --and 
   state_desc='Online' -- исключить зеркальные бд

declare @tbl nvarchar(35)
declare @sql nvarchar(55)
set @sql ='DBCC CHECKDB (['
open cur
FETCH NEXT FROM  cur into @tbl
while @@fetch_status=0 
begin
  set @sql=@sql+@tbl+'])'
  print '-------Check DB: '+@tbl
  print @sql
  exec( @sql )
  set @sql='DBCC CHECKDB (['
 FETCH NEXT FROM  cur into @tbl
end
close cur
deallocate cur;