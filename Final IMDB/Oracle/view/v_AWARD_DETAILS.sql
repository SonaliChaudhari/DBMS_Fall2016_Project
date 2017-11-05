
CREATE VIEW v_AWARD_DETAILS AS
SELECT
	A.AwardID,
	A.AwardTypeCategoryID,
	ATC.AwardTypeCategoryName,
	A.AwardTypeID,
	A.MovieID,
	M.Name AS MOVIE_NAME,	
	'MOVIE'AS "AWARDED_TO"
FROM AWARD A
 INNER JOIN AWARDTypeCategory ATC 
	ON ATC.AwardTypeCategoryID = A.AwardTypeCategoryID
 INNER JOIN AWARDType AT 
	ON AT.AwardTypeID = ATC.AwardTypeID
 INNER JOIN MOVIE M 
	ON A.MovieID = M.MovieID

 UNION

SELECT
	A.AwardID,
	A.AwardTypeCategoryID,
	ATC.AwardTypeCategoryName,
	A.AwardTypeID,
	A.CelebrityID,
	C.Name AS CELEBRITY_NAME,
	'CELEBRITY' AS "AWARDED_TO"
FROM AWARD A
 INNER JOIN AWARDTypeCategory ATC 
	ON ATC.AwardTypeCategoryID = A.AwardTypeCategoryID
 INNER JOIN AWARDType AT 
	ON AT.AwardTypeID = ATC.AwardTypeID
 INNER JOIN CELEBRITY C 
	ON C.CelebrityID = A.CelebrityID;

-- SELECT * FROM v_AWARD_DETAILS
 -- DROP VIEW v_AWARD_DETAILS;
 
 
 IF(LENGTH(RET) > 10) THEN
		 RET:= SUBSTR(RET, 1, 9);
  END IF;
  
  DBMS_OUTPUT.PUT_LINE (RET);
	
  IF (RET IS NULL)  THEN 
     RET:= 'dummy123';
  END IF;
