USE BackendExamHub;
GO
IF EXISTS (SELECT * FROM dbo.sysobjects where id = OBJECT_ID(N'[dbo].[PR_Myoffice_ACPD_Read]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[PR_Myoffice_ACPD_Read]
GO
-- 
-- =============================================
-- Author:         Bevis
-- Create date:    20240808
-- Description:    尋找使用者基本資訊
-- Modified By     Modification Date    Modification Description
-- youlin          20240808             Ini 
-- =============================================
CREATE PROCEDURE [dbo].[PR_Myoffice_ACPD_Read]
(		
	@acpd_sid		CHAR(20) = ''			--使用者主鍵
) 
as

DECLARE	
	@acpd_sid_		CHAR(20),  
	@ReturnValue	NVARCHAR(Max),
	@NewID uniqueidentifier

SELECT @acpd_sid_ = @acpd_sid;
SELECT @NewID = NEWID();

BEGIN TRY 
	BEGIN
		SET NOCOUNT ON;   
		--程式邏輯寫在這

		SELECT 
			*
		FROM Myoffice_ACPD WITH(NOLOCK)
		WHERE acpd_sid = @acpd_sid_

		-- 呼叫 usp_AddLog 儲存程序
		EXEC [dbo].[usp_AddLog]　@_InBox_ReadID = 0,@_InBox_SPNAME = 'PR_Myoffice_ACPD_Read',@_InBox_GroupID = @NewID,@_InBox_ExProgram = 'Read',@_InBox_ActionJSON = '',@_OutBox_ReturnValues = @ReturnValue OUTPUT;


	END
END TRY
BEGIN CATCH
	--IF @@TRANCOUNT > 0
	--ROLLBACK TRAN;
	--select @ErrMsg = ERROR_MESSAGE()
END CATCH
GO
GRANT EXEC ON [dbo].[PR_Myoffice_ACPD_Read] TO PUBLIC
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'尋找使用者基本資訊' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Read'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者主鍵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Read', @level2type=N'PARAMETER',@level2name=N'@acpd_sid'
GO

