USE [IMDB]
GO
/****** Object:  StoredProcedure [dbo].[PrintCelebrityDetails]    Script Date: 12/8/2016 1:03:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Get the celebrity details and history given his name

 ALTER PROCEDURE [dbo].[PrintCelebrityDetails] 
		@CelebrityName varchar(50)
 AS 
 BEGIN
	DECLARE @MovieName varchar(50);
	DECLARE @CelebrityType varchar(100);
	DECLARE @MovieYear date;
	DECLARE @CollectionAmount integer;
	IF EXISTS(SELECT @CelebrityName 
		      FROM PERSON.Celebrity C 
		      WHERE C.Name = @CelebrityName)
	BEGIN 
		DECLARE Cursor1 cursor for 

		SELECT CFM2.CELEBRITYNAME, 
			   MOVIENAME, 
			   M.MovieYear, 
		       SUM(BCM.CollectionAmount) TOTALCOLLECTION,
		       STUFF((SELECT DISTINCT ', ' + CFM1.Type
				      FROM MOVIES.v_CASTFORMOVIE CFM1
		              WHERE CFM1.CELEBRITYNAME = CFM2.CELEBRITYNAME FOR XML PATH('')),1,1,'') AS CELEBTYPE
		FROM MOVIES.v_CASTFORMOVIE CFM2, 
			 MOVIES.Movie M, 
			 MOVIES.BoxOfficeCollectionOfMovie BCM
		WHERE M.MOVIEID = CFM2.MOVIEID AND 
			 BCM.MovieID = CFM2.MovieID AND
			 CFM2.CELEBRITYNAME = @CelebrityName 
		GROUP BY CELEBRITYNAME, 
			     MOVIENAME, 
				 M.MOVIEYEAR
		ORDER BY CELEBRITYNAME
		Open cursor1;
		FETCH NEXT FROM cursor1 INTO @CelebrityName, @MovieName, @MovieYear, @CollectionAmount, @CelebrityType

		WHILE @@FETCH_STATUS = 0
		BEGIN
			PRINT '--------------------------------------------------------------------------------------------'
			PRINT @CelebrityName + ' has been a part as '+@CelebrityType 
			PRINT 'For Movie: '+ @MovieName
			PRINT 'In the year: ' + CAST(@MovieYear AS VARCHAR(4))
			PRINT 'It has a Gross Box Office Collection of ' +CAST(@CollectionAmount AS VARCHAR(5)) + ' millions'
			PRINT '---------------------------------------------------------------------------------------------'

			FETCH NEXT FROM cursor1 INTO @CelebrityName, @MovieName, @MovieYear, @CollectionAmount, @CelebrityType
		END
		CLOSE cursor1
		DEALLOCATE cursor1
		
	END
	ELSE
	BEGIN
		Print 'The Celebrity does not exist in our Database. Please enter another celebrity to get the Details'
		RAISERROR('Celebrity does not match with our Database',16,0);
	END
END



--EXEC PrintCelebrityDetails 'Aaron Putnam'
