--�ϥΪ̰򥻸�T
USE BackendExamHub
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[Myoffice_ACPD]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Myoffice_ACPD]
GO

-- 
-- =============================================
-- Author:         bevis
-- Create date:    20240808
-- Description:    �ϥΪ̰򥻸�T
-- Modified By     Modification Date    Modification Description
-- bevis           20240808             Ini 
-- =============================================
CREATE TABLE [dbo].[Myoffice_ACPD](
	[acpd_sid] [CHAR](20) NULL,					--�ϥΪ̥D��	
	[acpd_cname] [NVARCHAR](60) NULL,			--����W��
	[acpd_ename] [NVARCHAR](40) NULL,			--�^��W��
	[acpd_sname] [NVARCHAR](40) NULL,			--²��
	[acpd_email] [NVARCHAR](60) NULL,			--�}�l�ɶ�	 
	[acpd_status] [tinyint] NULL,				--���p 0=���` , 99=�����`
	[acpd_stop] [bit] NULL,						--�O�_����/���i�n�J
	[acpd_stopMemo] [NVARCHAR](600) NULL,		--���έ�]
	[acpd_LoginID] [NVARCHAR](30) NULL,			--�n�J�b��
	[acpd_LoginPW] [NVARCHAR](60) NULL,			--�n�J�K�X
	[acpd_memo] [NVARCHAR](120) NULL,			--�n�J�K�X
	[acpd_nowdatetime] [datetime] NULL,			--�s�W���	 
	[appd_nowid] [NVARCHAR](20) NULL,			--�s�W�H���N�X
	[acpd_upddatetitme] [datetime] NULL,		--�ק���
	[acpd_updid] [NVARCHAR](20) NULL,			--�ק�H���N�X
) ON [PRIMARY]

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϥΪ̰򥻸�T' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϥΪ̥D��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_sid'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����W��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_cname'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�^��W��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_ename'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'²��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_sname'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϥΪ̫H�c' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_email'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���p 0=���` , 99=�����`' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_status'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�O�_����/���i�n�J' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_stop'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���έ�]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_stopMemo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�n�J�b��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_LoginID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�n�J�K�X' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_LoginPW'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƶ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_memo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�s�W���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_nowdatetime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�s�W�H���N�X' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'appd_nowid'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ק���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_upddatetitme'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ק�H���N�X' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_updid'
GO