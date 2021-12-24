USE ÈìÿÁàçûSQL 

UPDATE SchemaStorage SET Status = 100
SELECT Status FROM SchemaStorage WHERE SchemaID = 0

select * from Config WHERE FileName = 'commit' 
delete from config where FileName = 'commit' 
select * from Config WHERE FileName = 'dbStruFinal' 
delete from config where FileName = 'dbStruFinal'
