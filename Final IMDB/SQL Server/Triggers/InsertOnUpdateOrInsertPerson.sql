USE [IMDB]
GO
/****** Object:  Trigger [PERSON].[InsertOnUpdateOrInsertPerson]    Script Date: 12/8/2016 2:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER [PERSON].[InsertOnUpdateOrInsertPerson]  
ON  [PERSON].[Person]
AFTER INSERT,UPDATE   
AS  
	BEGIN TRY
		DECLARE @firstname VARCHAR(50);
		DECLARE @lastname VARCHAR(50);
		DECLARE @personId INT;
		DECLARE @emailAddress VARCHAR(50);
		DECLARE @accountNum VARCHAR(7);
		DECLARE @ROWCOUNT INT;
	
		SELECT @personId = PersonID, @firstname = FirstName, @lastname = LastName FROM inserted;
		SET @accountNum = '0012' + UPPER(LEFT(@firstname,3));
		SET @emailAddress = (SELECT EmailAddress 
								FROM PERSON.EmailAddress 
								WHERE PersonID = @personId);
		SET @ROWCOUNT = (SELECT COUNT(EmailAddress) 
								FROM PERSON.EmailAddress 
								WHERE PersonID = @personId);
		BEGIN TRANSACTION
		IF(@ROWCOUNT = 0) 
			BEGIN
				SET @emailAddress = LOWER(@firstname) + '.' +LOWER(@lastname) + '@husky.neu.edu';
				INSERT INTO PERSON.EmailAddress (PersonID, EmailAddress,ModifiedDate,ModifiedBy) VALUES (@personId,@emailAddress, CURRENT_TIMESTAMP,'palak_a');
			END	
		EXEC PERSON.createPersonAccountOnInsertOrUpdate @I_FIRSTNAME = @firstname,
													@I_LASTNAME = @lastname,
													@I_PERSONID = @personId,
													@I_ACCOUNTNUM = @accountNum,
													@I_EMAILADDRESS = @emailAddress
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT>0
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR ('Due to some error while insertion, transaction is being rolledback',16,1);
			END
	END CATCH;
