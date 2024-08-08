USE BackendExamHub;
GO
IF EXISTS (SELECT * FROM dbo.sysobjects where id = OBJECT_ID(N'[dbo].[PR_Myoffice_ACPD_Update]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[PR_Myoffice_ACPD_Update]
GO
-- 
-- =============================================
-- Author:         Bevis
-- Create date:    20240808
-- Description:    更新使用者基本資訊
-- Modified By     Modification Date    Modification Description
-- youlin          20240808             Ini 
-- =============================================
CREATE PROCEDURE [dbo].[PR_Myoffice_ACPD_Update]
(		
	@Json			NVARCHAR(MAX) = ''			--Json Data	 
) 
as

DECLARE	
	@Json_			NVARCHAR(MAX),	   
	@ReturnValue	NVARCHAR(Max),
	@NewID uniqueidentifier

SELECT @Json_ = @Json;
SELECT @NewID = NEWID();

BEGIN TRY 
	BEGIN
		SET NOCOUNT ON;   
		--程式邏輯寫在這
		UPDATE Myoffice_ACPD
		SET
			acpd_cname = jsonData.acpd_cname,
			acpd_ename = jsonData.acpd_ename,
			acpd_sname = jsonData.acpd_sname,
			acpd_email = jsonData.acpd_email,
			acpd_status = jsonData.acpd_status,
			acpd_stop = jsonData.acpd_stop,
			acpd_stopMemo = jsonData.acpd_stopMemo,
			acpd_LoginID = jsonData.acpd_LoginID,
			acpd_LoginPW = jsonData.acpd_LoginPW,
			acpd_memo = jsonData.acpd_memo,
			acpd_nowdatetime = jsonData.acpd_nowdatetime,
			appd_nowid = jsonData.appd_nowid,
			acpd_upddatetitme = jsonData.acpd_upddatetitme,
			acpd_updid = jsonData.acpd_updid
		FROM OPENJSON(@Json_) WITH (
			acpd_sid CHAR(20) '$.acpd_sid',
			acpd_cname NVARCHAR(60) '$.acpd_cname',
			acpd_ename NVARCHAR(40) '$.acpd_ename',
			acpd_sname NVARCHAR(40) '$.acpd_sname',
			acpd_email NVARCHAR(60) '$.acpd_email',
			acpd_status TINYINT '$.acpd_status',
			acpd_stop BIT '$.acpd_stop',
			acpd_stopMemo NVARCHAR(600) '$.acpd_stopMemo',
			acpd_LoginID NVARCHAR(30) '$.acpd_LoginID',
			acpd_LoginPW NVARCHAR(60) '$.acpd_LoginPW',
			acpd_memo NVARCHAR(120) '$.acpd_memo',
			acpd_nowdatetime datetime '$.acpd_nowdatetime',
			appd_nowid NVARCHAR(20) '$.appd_nowid',
			acpd_upddatetitme datetime '$.acpd_upddatetitme',
			acpd_updid NVARCHAR(20) '$.acpd_updid'
		) AS jsonData 
	　　WHERE Myoffice_ACPD.acpd_sid = jsonData.acpd_sid;			

		-- 呼叫 usp_AddLog 儲存程序
		EXEC [dbo].[usp_AddLog]　@_InBox_ReadID = 0,@_InBox_SPNAME = 'PR_Myoffice_ACPD_Update',@_InBox_GroupID = @NewID,@_InBox_ExProgram = 'UPDATE',@_InBox_ActionJSON = @Json_,@_OutBox_ReturnValues = @ReturnValue OUTPUT;


	END
END TRY
BEGIN CATCH
	--IF @@TRANCOUNT > 0
	--ROLLBACK TRAN;
	--select @ErrMsg = ERROR_MESSAGE()
END CATCH
GO
GRANT EXEC ON [dbo].[PR_Myoffice_ACPD_Update] TO PUBLIC
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新使用者基本資訊' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Update'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Json Data' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Update', @level2type=N'PARAMETER',@level2name=N'@Json'
GO

