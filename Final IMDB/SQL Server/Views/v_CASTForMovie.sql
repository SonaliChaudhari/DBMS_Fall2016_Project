---------------------------------------------------------------------------------
/*Databases		 : SQL Server
  Author		 : Group 3
  Creation Date  : 12-06-2016 
  View Definition: To retrieve the each type of celebrity casted in each movie*/
----------------------------------------------------------------------------------a

CREATE VIEW MOVIES.v_CASTFORMOVIE AS 
SELECT DISTINCT cel.Name AS CELEBRITYNAME,
		CEL.CelebrityID,
		m.Name AS MOVIENAME,
		M.MovieID,
		TC.Type,
		TC.TypeID
	FROM PERSON.TypeOfCelebrity tc
LEFT JOIN PERSON.CelebrityType ct
	ON ct.TypeID = tc.TypeID
left join PERSON.Celebrity cel
	ON cel.CelebrityID = ct.CelebrityID
LEFT JOIN MOVIES.MovieCelebrity mcel
	ON mcel.CelebrityID = cel.CelebrityID AND CT.TypeID = MCEL.TypeID
LEFT JOIN MOVIES.Movie m 
	ON m.MovieID = mcel.MovieID
WHERE M.MovieID IS NOT NULL;


SELECT * FROM MOVIES.v_CASTFORMOVIE;

