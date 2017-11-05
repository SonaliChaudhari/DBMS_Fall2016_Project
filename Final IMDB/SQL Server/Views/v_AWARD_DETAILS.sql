-----------------------------------------------------------------------------------------------------------------------------------------
/*Databases		 : SQL Server
  Author		 : Group 3
  Creation Date  : 12-06-2016 
  View Definition: To retrieve each category of award awarded and its details*/
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW AWARD.v_AWARD_DETAILS AS
SELECT
	A.AwardID,
	A.AwardTypeCategoryID,
	ATC.AwardTypeCategoryName,
	A.AwardTypeID,
	A.MovieID,
	M.Name AS MOVIE_NAME,	
	"AWARDED_TO" = 'MOVIE'
FROM AWARD.Award A
 INNER JOIN AWARD.AwardTypeCategory ATC 
	ON ATC.AwardTypeCategoryID = A.AwardTypeCategoryID
 INNER JOIN AWARD.AwardType AT 
	ON AT.AwardTypeID = ATC.AwardTypeID
 INNER JOIN MOVIES.Movie M 
	ON A.MovieID = M.MovieID

 UNION 

SELECT
	A.AwardID,
	A.AwardTypeCategoryID,
	ATC.AwardTypeCategoryName,
	A.AwardTypeID,
	A.CelebrityID,
	C.Name AS CELEBRITY_NAME,
	"AWARDED_TO" = 'CELEBRITY'
FROM AWARD.Award A
 INNER JOIN AWARD.AwardTypeCategory ATC 
	ON ATC.AwardTypeCategoryID = A.AwardTypeCategoryID
 INNER JOIN AWARD.AwardType AT 
	ON AT.AwardTypeID = ATC.AwardTypeID
 INNER JOIN PERSON.Celebrity C 
	ON C.CelebrityID = A.CelebrityID;