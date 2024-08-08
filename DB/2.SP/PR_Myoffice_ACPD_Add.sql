USE BackendExamHub;
GO
IF EXISTS (SELECT * FROM dbo.sysobjects where id = OBJECT_ID(N'[dbo].[PR_Myoffice_ACPD_Add]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[PR_Myoffice_ACPD_Add]
GO
-- 
-- =============================================
-- Author:         Bevis
-- Create date:    20240808
-- Description:    �s�W�ϥΪ̰򥻸�T
-- Modified By     Modification Date    Modification Description
-- youlin          20240808             Ini 
-- =============================================
CREATE PROCEDURE [dbo].[PR_Myoffice_ACPD_Add]
(		
	@Json			NVARCHAR(MAX) = ''			--Json Data	 
) 
as

DECLARE	
	@Json_			NVARCHAR(MAX),	   
	@SID			NVARCHAR(20),
	@ReturnValue	NVARCHAR(Max),
	@NewID uniqueidentifier

-- �{�b @SID �ܼƱN�]�t�s�x�L�{��^����
SELECT @SID AS 'GeneratedSID';
SELECT @Json_ = @Json;
SELECT @NewID = NEWID();

BEGIN TRY 
	BEGIN
		SET NOCOUNT ON;   
		--�{���޿�g�b�o
        EXEC [dbo].[NEWSID] 
			@TableName = N'Myoffice_ACPD', -- �������A����W
			@ReturnSID = @SID OUTPUT;

		INSERT INTO Myoffice_ACPD
		SELECT 
			@SID AS acpd_sid,
			JSON_VALUE(value, '$.acpd_cname') AS acpd_cname,
			JSON_VALUE(value, '$.acpd_ename') AS acpd_ename,
			JSON_VALUE(value, '$.acpd_sname') AS acpd_sname,
			JSON_VALUE(value, '$.acpd_email') AS acpd_email,
			JSON_VALUE(value, '$.acpd_status') AS acpd_status,
			JSON_VALUE(value, '$.acpd_stop') AS acpd_stop,
			JSON_VALUE(value, '$.acpd_stopMemo') AS acpd_stopMemo,
			JSON_VALUE(value, '$.acpd_LoginID') AS acpd_LoginID,
			JSON_VALUE(value, '$.acpd_LoginPW') AS acpd_LoginPW,
			JSON_VALUE(value, '$.acpd_memo') AS acpd_memo,
			JSON_VALUE(value, '$.acpd_nowdatetime') AS acpd_nowdatetime,
			JSON_VALUE(value, '$.appd_nowid') AS appd_nowid,
			JSON_VALUE(value, '$.acpd_upddatetitme') AS acpd_upddatetitme,
			JSON_VALUE(value, '$.acpd_updid') AS acpd_updid
		FROM OPENJSON(@Json_) 

		-- �I�s usp_AddLog �x�s�{��
		EXEC [dbo].[usp_AddLog]�@@_InBox_ReadID = 0,@_InBox_SPNAME = 'PR_Myoffice_ACPD_Add',@_InBox_GroupID = @NewID,@_InBox_ExProgram = 'ADD',@_InBox_ActionJSON = @Json_,@_OutBox_ReturnValues = @ReturnValue OUTPUT;


	END
END TRY
BEGIN CATCH
	--IF @@TRANCOUNT > 0
	--ROLLBACK TRAN;
	--select @ErrMsg = ERROR_MESSAGE()
END CATCH
GO
GRANT EXEC ON [dbo].[PR_Myoffice_ACPD_Add] TO PUBLIC
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�s�W�ϥΪ̰򥻸�T' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Json Data' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@Json'
GO

