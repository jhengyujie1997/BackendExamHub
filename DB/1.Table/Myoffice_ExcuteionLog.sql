--系統執行記錄
USE BackendExamHub
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[Myoffice_ExcuteionLog]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Myoffice_ExcuteionLog]
GO

-- 
-- =============================================
-- Author:         bevis
-- Create date:    20240808
-- Description:    系統執行記錄
-- Modified By     Modification Date    Modification Description
-- bevis           20240808             Ini 
-- =============================================
CREATE TABLE [dbo].[Myoffice_ExcuteionLog](
	[DeLog_AuthID] [INT] NULL,						--自訂索引碼	
	[DeLog_StoredPrograms] [NVARCHAR](120) NULL,	--預存程序名稱
	[DeLog_GroupID] [UNIQUEIDENTIFIER] NULL,		--執行的群組代碼
	[DeLog_isCustomDebug] [BIT] NULL,				--是否認定為 Bug
	[DeLog_ExecutionProgram] [NVARCHAR](120) NULL,	--執行的項目	 
	[DeLog_ExecuteionInfo] [NVARCHAR](MAX) NULL,	--執行的內容或是說明
	[DeLog_VerifyNeeded] [BIT] NULL,				--此錯誤是否要進行檢查
	[exelog_nowdatetime] [DATETIME] NULL,			--新增日期

) ON [PRIMARY]

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系統執行記錄' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ExcuteionLog'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自訂索引碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ExcuteionLog', @level2type=N'COLUMN',@level2name=N'DeLog_AuthID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'預存程序名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ExcuteionLog', @level2type=N'COLUMN',@level2name=N'DeLog_StoredPrograms'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'執行的群組代碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ExcuteionLog', @level2type=N'COLUMN',@level2name=N'DeLog_GroupID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否認定為 Bug' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ExcuteionLog', @level2type=N'COLUMN',@level2name=N'DeLog_isCustomDebug'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'執行的項目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ExcuteionLog', @level2type=N'COLUMN',@level2name=N'DeLog_ExecutionProgram'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'執行的內容或是說明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ExcuteionLog', @level2type=N'COLUMN',@level2name=N'DeLog_ExecuteionInfo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'此錯誤是否要進行檢查' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ExcuteionLog', @level2type=N'COLUMN',@level2name=N'DeLog_VerifyNeeded'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新增日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ExcuteionLog', @level2type=N'COLUMN',@level2name=N'exelog_nowdatetime'
GO
