USE [IMDB]
GO
/****** Object:  StoredProcedure [PERSON].[createPersonAccountOnInsertOrUpdate]    Script Date: 12/8/2016 2:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [PERSON].[createPersonAccountOnInsertOrUpdate] @I_FIRSTNAME VARCHAR(50)
, @I_LASTNAME VARCHAR(50)
, @I_PERSONID INT
, @I_ACCOUNTNUM VARCHAR(7)
, @I_EMAILADDRESS VARCHAR(50)
	AS
		BEGIN
			
			DECLARE @L_PASSWORD VARBINARY(128);
			DECLARE @L_USERNAME VARCHAR(10);
			DECLARE @L_MESSAGEBODY VARCHAR(100);
			DECLARE @ERR_MSG VARCHAR(200);
			DECLARE @ERR_STA SMALLINT;
			DECLARE @ROWCOUNT INT;

				-- SETTING AN INITIAL VALUES OF @ERR_MSG AND @ERR_STA
			SELECT @ERR_MSG = ERROR_MESSAGE(),
				@ERR_STA = ERROR_STATE();

			SET @ERR_MSG= 'Error occurred while deleting from SalesOrderDetails' + @ERR_MSG;

			SET @L_USERNAME = (SELECT PERSON.ufnGetUserName(@I_EMAILADDRESS)); 
			
			OPEN SYMMETRIC KEY Password_Key0912 
			DECRYPTION BY CERTIFICATE UserPwd0912;  
			
			
			SET @L_PASSWORD = (SELECT EncryptByKey(Key_GUID('Password_Key0912'), 
										@L_USERNAME, 1, HashBytes('SHA1', CONVERT( varchar, @L_USERNAME))));
			
			SET @L_MESSAGEBODY = 'Hi, Please remember your username: ' + @L_USERNAME +' and password: ' + @L_USERNAME;

			BEGIN TRY
			BEGIN TRANSACTION;
			SET @ROWCOUNT = (SELECT COUNT(*)
								FROM PERSON.PersonAccount
									WHERE PersonID = @I_PERSONID);
			IF(@ROWCOUNT = 0)
				
				INSERT INTO PERSON.PersonAccount (PersonID,UserName,AccountNumber,CreateDate,ModifiedDate,ModifiedBy,Password) VALUES (@I_PERSONID,@L_USERNAME,@I_ACCOUNTNUM,CAST(GETDATE() AS DATE),CURRENT_TIMESTAMP,'palak_a',@L_PASSWORD);
			
			ELSE
				
				UPDATE PERSON.PersonAccount 
					SET UserName = @L_USERNAME, Password = @L_PASSWORD
				WHERE PersonID = @I_PERSONID;

			EXEC msdb.dbo.sp_send_dbmail  @profile_name = 'IMDBAdministrator',  
												@recipients = @I_EMAILADDRESS,  
												@body = @L_MESSAGEBODY,  
												@subject = 'Congratulations - IMDB Account Created'; 

			COMMIT TRANSACTION;
			END TRY
			BEGIN CATCH
				BEGIN
					PRINT ERROR_MESSAGE();
					RAISERROR ('Due to some error while insertion, transaction is being rolledback',16,0);
				END
			ROLLBACK TRANSACTION;
			END CATCH;
END