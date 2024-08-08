--�t�ΰ���O��
USE BackendExamHub
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[Myoffice_ExcuteionLog]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Myoffice_ExcuteionLog]
GO

-- 
-- =============================================
-- Author:         bevis
-- Create date:    20240808
-- Description:    �t�ΰ���O��
-- Modified By     Modification Date    Modification Description
-- bevis           20240808             Ini 
-- =============================================
CREATE TABLE [dbo].[Myoffice_ExcuteionLog](
	[DeLog_AuthID] [INT] NULL,						--�ۭq���޽X	
	[DeLog_StoredPrograms] [NVARCHAR](120) NULL,	--�w�s�{�ǦW��
	[DeLog_GroupID] [UNIQUEIDENTIFIER] NULL,		--���檺�s�եN�X
	[DeLog_isCustomDebug] [BIT] NULL,				--�O�_�{�w�� Bug
	[DeLog_ExecutionProgram] [NVARCHAR](120) NULL,	--���檺����	 
	[DeLog_ExecuteionInfo] [NVARCHAR](MAX) NULL,	--���檺���e�άO����
	[DeLog_VerifyNeeded] [BIT] NULL,				--�����~�O�_�n�i���ˬd
	[exelog_nowdatetime] [DATETIME] NULL,			--�s�W���

) ON [PRIMARY]

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�t�ΰ���O��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ExcuteionLog'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۭq���޽X' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ExcuteionLog', @level2type=N'COLUMN',@level2name=N'DeLog_AuthID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�w�s�{�ǦW��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ExcuteionLog', @level2type=N'COLUMN',@level2name=N'DeLog_StoredPrograms'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���檺�s�եN�X' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ExcuteionLog', @level2type=N'COLUMN',@level2name=N'DeLog_GroupID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�O�_�{�w�� Bug' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ExcuteionLog', @level2type=N'COLUMN',@level2name=N'DeLog_isCustomDebug'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���檺����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ExcuteionLog', @level2type=N'COLUMN',@level2name=N'DeLog_ExecutionProgram'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���檺���e�άO����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ExcuteionLog', @level2type=N'COLUMN',@level2name=N'DeLog_ExecuteionInfo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����~�O�_�n�i���ˬd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ExcuteionLog', @level2type=N'COLUMN',@level2name=N'DeLog_VerifyNeeded'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�s�W���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ExcuteionLog', @level2type=N'COLUMN',@level2name=N'exelog_nowdatetime'
GO
