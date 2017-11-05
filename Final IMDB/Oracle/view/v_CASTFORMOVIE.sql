
CREATE VIEW v_CASTFORMOVIE AS 
SELECT DISTINCT cel.Name AS CELEBRITYNAME,
		CEL.CelebrityID,
		m.Name AS MOVIENAME,
		M.MovieID,
		TC.Type,
		TC.TypeID
	FROM TYPEOFCELEBRITY tc
LEFT JOIN CELEBRITYTYPE ct
	ON ct.TypeID = tc.TypeID
left join CELEBRITY cel
	ON cel.CelebrityID = ct.CelebrityID
LEFT JOIN MOVIECELEBRITY mcel
	ON mcel.CelebrityID = cel.CelebrityID AND CT.TypeID = MCEL.TypeID
LEFT JOIN MOVIE m 
	ON m.MovieID = mcel.MovieID
WHERE M.MovieID IS NOT NULL;


SELECT * FROM v_CASTFORMOVIE;

