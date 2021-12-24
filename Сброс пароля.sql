-- этап 1
USE [smk_buh_smk]
SELECT * into [v8users_copy] FROM [v8users]
GO
SELECT * into [Params_copy] FROM [Params]
GO
DELETE FROM [v8users]
GO
DELETE FROM [Params] WHERE [FileName] = 'users.usr'
GO

-- открываем конфигуратор
-- этап 2
USE [smk_buh_smk]
DROP TABLE [v8users]
GO
DROP TABLE [Params]
GO
SELECT * into [v8users] FROM [v8users_copy]
GO
SELECT * into [Params] FROM [Params_copy]
GO
DROP TABLE [v8users_copy]
GO
DROP TABLE [Params_copy]
GO