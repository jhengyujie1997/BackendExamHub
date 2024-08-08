USE BackendExamHub;
GO
IF EXISTS (SELECT * FROM dbo.sysobjects where id = OBJECT_ID(N'[dbo].[PR_Myoffice_ACPD_Add]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[PR_Myoffice_ACPD_Add]
GO
-- 
-- =============================================
-- Author:         youlin
-- Create date:    20190219
-- Description:    DB操作資料LOG檔
-- Modified By     Modification Date    Modification Description
-- youlin          20190219             Ini 
-- =============================================
CREATE PROCEDURE [dbo].[PR_Myoffice_ACPD_Add]
(
	@ModType VARCHAR(30) = '',	        --異動類型(INSERT)	
	@ApUser VARCHAR(100) = '',			--異動人員	 
	@IP VARCHAR(20),				    --IP
	@DES_IP VARCHAR(50) = '',			--目的端IP
	@AppName VARCHAR(20) = 'RE_SKB',	--系統代碼
	@ObjName VARCHAR(50),				--物件名   TABLE / VIEW / MQ  QM/ Q/ESP Web service
	@Acc VARCHAR(20),					--存取帳號
	@ActionName VARCHAR(50),			--程式/交易名稱
	@AppFun VARCHAR(max),				--SP + 參數
	@GUID NVARCHAR(36)='',              --異動參考號
	@StartDate VARCHAR(30) = null,	    --程式開始時間
	@ErrMsg NVARCHAR(200) = ''     	    --異動錯誤訊息
) 
as
--動作類別  A:新增 D:刪除 E:修改 Q:查詢 R:報表 O:匯出下載 P:列印
DECLARE	@ActionType VARCHAR(1), 
@ModType_ VARCHAR(30),
@ApUser_ INT,			        
@IP_ VARCHAR(20),				   
@DES_IP_ VARCHAR(50),			
@AppName_ VARCHAR(20),		
@ObjName_ VARCHAR(50),				
@Acc_ VARCHAR(20),					
@ActionName_ VARCHAR(50),			
@AppFun_ VARCHAR(max),				
@GUID_ NVARCHAR(36),              
@StartDate_ VARCHAR(30),	    
@ErrMsg_ NVARCHAR(200) 	   

SET @ModType_ = @ModType;
SET @ApUser_ = (SELECT Uno FROM AppUsers WHERE LOWER(UserId) = LOWER(@ApUser));
SET @IP_ = @IP;
SET @AppName_ = @AppName;
SET @ObjName_ = @ObjName;
SET @Acc_ = @Acc;
SET @ActionName_ = @ActionName;
SET @AppFun_ = @AppFun;
SET @GUID_ = @GUID;
SET @StartDate_ = @StartDate;
SET @ErrMsg_ = @ErrMsg;
 
BEGIN TRY 
	BEGIN
		SET NOCOUNT ON;   
		--程式邏輯寫在這
        IF(@ModType_ = '')
        BEGIN
             SELECT @ActionType = CASE SUBSTRING(UPPER(@ObjName_),1,6)
							WHEN 'PR_RPT' THEN 'R'
							ELSE 'Q'
							END
        END
        ELSE
        BEGIN
             SELECT @ActionType = CASE SUBSTRING(UPPER(@ModType_),1,3)
							WHEN 'INS' THEN 'A'
                            WHEN 'UPD' THEN 'U'
                            WHEN 'DEL' THEN 'D'
							ELSE 'Q'
							END
        END

		INSERT INTO AppAuditLog( [ApUser]
								  ,[StartDate]
								  ,[ApDate]
								  ,[IP]
								  ,[DES_IP]
								  ,[AppName]
								  ,[ObjName]
								  ,[Acc]
								  ,[ActionName]
								  ,[ActionType]
								  ,[AppFun]
								  ,[GID]
                                  ,[ErrMsg])
					VALUES(@ApUser_
							,@StartDate_
							,GETDATE()
							,@IP_
							,@@SERVERNAME
							,@AppName_
							,@ObjName_
							,@Acc_
							,@ActionName_
							,@ActionType
							,@AppFun_
							,@GUID_
                            ,@ErrMsg_)
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'LOG記錄檔' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'異動類型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@ModType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'異動人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@ApUser'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@IP'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'目的端IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@DES_IP'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系統代碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@AppName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物件名   TABLE / VIEW / MQ  QM/ Q/ESP Web service' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@ObjName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'存取帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@Acc'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'程式/交易名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@ActionName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SP + 參數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@AppFun'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'異動參考號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@GUID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'程式開始時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@StartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'異動錯誤訊息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@ErrMsg'
GO