--使用者基本資訊
USE BackendExamHub
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[Myoffice_ACPD]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Myoffice_ACPD]
GO

-- 
-- =============================================
-- Author:         bevis
-- Create date:    20240808
-- Description:    使用者基本資訊
-- Modified By     Modification Date    Modification Description
-- bevis           20240808             Ini 
-- =============================================
CREATE TABLE [dbo].[Myoffice_ACPD](
	[acpd_sid] [CHAR](20) NULL,					--使用者主鍵	
	[acpd_cname] [NVARCHAR](60) NULL,			--中文名稱
	[acpd_ename] [NVARCHAR](40) NULL,			--英文名稱
	[acpd_sname] [NVARCHAR](40) NULL,			--簡稱
	[acpd_email] [NVARCHAR](60) NULL,			--開始時間	 
	[acpd_status] [tinyint] NULL,				--狀況 0=正常 , 99=不正常
	[acpd_stop] [bit] NULL,						--是否停用/不可登入
	[acpd_stopMemo] [NVARCHAR](600) NULL,		--停用原因
	[acpd_LoginID] [NVARCHAR](30) NULL,			--登入帳號
	[acpd_LoginPW] [NVARCHAR](60) NULL,			--登入密碼
	[acpd_memo] [NVARCHAR](120) NULL,			--登入密碼
	[acpd_nowdatetime] [datetime] NULL,			--新增日期	 
	[appd_nowid] [NVARCHAR](20) NULL,			--新增人員代碼
	[acpd_upddatetitme] [datetime] NULL,		--修改日期
	[acpd_updid] [NVARCHAR](20) NULL,			--修改人員代碼
) ON [PRIMARY]

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者基本資訊' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者主鍵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_sid'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'中文名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_cname'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'英文名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_ename'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'簡稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_sname'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者信箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_email'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'狀況 0=正常 , 99=不正常' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_status'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否停用/不可登入' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_stop'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'停用原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_stopMemo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登入帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_LoginID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登入密碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_LoginPW'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備註' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_memo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新增日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_nowdatetime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新增人員代碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'appd_nowid'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_upddatetitme'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人員代碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Myoffice_ACPD', @level2type=N'COLUMN',@level2name=N'acpd_updid'
GO