USE [IMDB]
GO
/****** Object:  StoredProcedure [IMDBCOMMUNITY].[ADDMESSAGEBOARDS]    Script Date: 12/8/2016 6:52:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [IMDBCOMMUNITY].[ADDMESSAGEBOARDS]
		@CategoryName varchar(100), @TopicName varchar(100), @DiscussionContent varchar(1000)
AS
BEGIN
DECLARE @CategoryID Int;
DECLARE @TopicStartDate date;
DECLARE @TopicID Int;
DECLARE @UserID Int;

SET @CategoryID = (SELECT CategoryID 
				   FROM IMDBCOMMUNITY.MESSAGEBOARDCATEGORY 
				   WHERE CategoryName = @CategoryName);
SET @TopicID = (SELECT TopicID 
				FROM IMDBCOMMUNITY.MESSAGEBOARDTOPIC 
				WHERE TopicName = @TopicName);

IF EXISTS(SELECT @CategoryID 
		  FROM IMDBCOMMUNITY.MESSAGEBOARDCATEGORY 
		  WHERE CategoryName = @CategoryName)
	BEGIN
	IF EXISTS(SELECT @TopicID 
			  FROM IMDBCOMMUNITY.MESSAGEBOARDTOPIC 
			  WHERE TopicName = @TopicName)
		BEGIN
			INSERT INTO IMDBCOMMUNITY.MESSAGEBOARD (TopicID,DiscussionContent,ModifiedDate,ModifiedBy,UserID) VALUES (@TopicID, @DiscussionContent,current_timestamp,'Tejesh',1);
		END
	ELSE
		BEGIN
			RAISERROR ('Cannot insert the given discussion on the Message Board. Invalid TopicID',16,1);
			Print 'TopicID does not exists. Please enter a valid TopicName..!!'
		END
	END
ELSE
	BEGIN
		RAISERROR ('Cannot insert the given discussion on the Message Board. Invalid CategoryID',16,1);
		Print 'CategoryID does not exists. Please enter a valid CategoryName..!!'
	END
END

---EXEC IMDBCOMMUNITY.ADDMESSAGEBOARDS 'Film Talk', 'Hello', 'Best "screwball" comedies of the 1930s'
