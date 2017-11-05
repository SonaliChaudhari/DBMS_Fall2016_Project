
CREATE TRIGGER DELETEUSERPOLL ON IMDBCOMMUNITY.POLLQUESTION
INSTEAD OF DELETE
AS
BEGIN

DECLARE @QuestionID int;
DECLARE @PostedUser varchar(30);
DECLARE @PostedDate date;

SELECT @QuestionID = PollQuestionID, @PostedUser = PostedBy, @PostedDate = PostedOn
FROM DELETED;
	BEGIN TRY
		IF EXISTS (SELECT @QuestionID 
				   FROM IMDBCOMMUNITY.PollQuestion 
				   WHERE PollQuestionID = @QuestionID
				   )
		BEGIN 
		BEGIN TRANSACTION
			DELETE FROM IMDBCOMMUNITY.UserPoll WHERE PollQuestionID = @QuestionID;
			DELETE FROM IMDBCOMMUNITY.PollOption WHERE PollQuestionID = @QuestionID;
			DELETE FROM IMDBCOMMUNITY.PollQuestion WHERE PollQuestionID = @QuestionID;
		COMMIT TRANSACTION
		PRINT 'The Poll question Posted by '+ @PostedUser +' on '+CAST(@PostedDate as Varchar(10))+ ' is deleted.'
		END
		ELSE
			BEGIN
				PRINT 'QuestionID does not exist';
				THROW 50001,'Please enter a valid question to be deleted',1;
			END
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT>0
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR ('The DELETE was unsuccessful due to invalid QuestionID',16,1);
			END
	END CATCH;
END		
