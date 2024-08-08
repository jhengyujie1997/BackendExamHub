USE BackendExamHub;
GO
IF EXISTS (SELECT * FROM dbo.sysobjects where id = OBJECT_ID(N'[dbo].[PR_Myoffice_ACPD_Add]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[PR_Myoffice_ACPD_Add]
GO
-- 
-- =============================================
-- Author:         youlin
-- Create date:    20190219
-- Description:    DB�ާ@���LOG��
-- Modified By     Modification Date    Modification Description
-- youlin          20190219             Ini 
-- =============================================
CREATE PROCEDURE [dbo].[PR_Myoffice_ACPD_Add]
(
	@ModType VARCHAR(30) = '',	        --��������(INSERT)	
	@ApUser VARCHAR(100) = '',			--���ʤH��	 
	@IP VARCHAR(20),				    --IP
	@DES_IP VARCHAR(50) = '',			--�ت���IP
	@AppName VARCHAR(20) = 'RE_SKB',	--�t�ΥN�X
	@ObjName VARCHAR(50),				--����W   TABLE / VIEW / MQ  QM/ Q/ESP Web service
	@Acc VARCHAR(20),					--�s���b��
	@ActionName VARCHAR(50),			--�{��/����W��
	@AppFun VARCHAR(max),				--SP + �Ѽ�
	@GUID NVARCHAR(36)='',              --���ʰѦҸ�
	@StartDate VARCHAR(30) = null,	    --�{���}�l�ɶ�
	@ErrMsg NVARCHAR(200) = ''     	    --���ʿ��~�T��
) 
as
--�ʧ@���O  A:�s�W D:�R�� E:�ק� Q:�d�� R:���� O:�ץX�U�� P:�C�L
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
		--�{���޿�g�b�o
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'LOG�O����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@ModType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ʤH��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@ApUser'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@IP'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ت���IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@DES_IP'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�t�ΥN�X' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@AppName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����W   TABLE / VIEW / MQ  QM/ Q/ESP Web service' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@ObjName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�s���b��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@Acc'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�{��/����W��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@ActionName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SP + �Ѽ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@AppFun'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ʰѦҸ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@GUID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�{���}�l�ɶ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@StartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ʿ��~�T��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'PR_Myoffice_ACPD_Add', @level2type=N'PARAMETER',@level2name=N'@ErrMsg'
GO