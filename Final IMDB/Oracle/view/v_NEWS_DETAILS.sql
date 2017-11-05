
CREATE VIEW v_NEWS_DETAILS AS
SELECT
	NOC.NewsChannelID,
	NC.NewsChannelName,
	MN.MovieNewsID AS NewsID,
	MN.News,
	M.MovieID AS ID,
	M.Name AS NEWSTYPENAME,
	'MOVIENEWS' AS "NEWSTYPE"
FROM NEWSOnChannel NOC 
	INNER JOIN NEWSCHANNEL NC 
		ON NOC.NewsChannelID = NC.NewsChannelID
	INNER JOIN MOVIENEWS MN
		ON NOC.MovieNewsID = MN.MovieNewsID
	INNER JOIN MOVIE M 
		ON MN.MovieID = M.MovieID 
 
UNION 

SELECT 
	NOC.NewsChannelID,
	NC.NewsChannelName,
	TN.TVShowNewsID AS NewsID,
	TN.News,
	T.TVShowID AS ID,
	T.Name,
	'TVNEWS' AS "NEWSTYPE" 
FROM NEWSOnChannel NOC 
	INNER JOIN NEWSCHANNEL NC 
		ON NOC.NewsChannelID = NC.NewsChannelID
	INNER JOIN TVNews TN 
		ON NOC.TVShowNewsID = TN.TVShowNewsID
	INNER JOIN TVShows T 
		ON TN.TVShowID = T.TVShowID
 UNION
 
SELECT 
	NOC.NewsChannelID,
	NC.NewsChannelName,
	CN.CelebrityNewsID,
	CN.News,
	C.CelebrityID AS ID,
	C.Name,
	'CELEBRITYNEWS' AS "NEWSTYPE"
FROM NEWSOnChannel NOC
	INNER JOIN NEWSCHANNEL NC
		ON NOC.NewsChannelID = NC.NewsChannelID
	INNER JOIN CELEBRITYNEWS CN 
		ON CN.CelebrityNewsID = NOC.CelebrityNewsID
	INNER JOIN CELEBRITY C 
		ON C.CelebrityID = CN.CelebrityID;

--SELECT * FROM v_NEWS_DETAILS;

--DROP VIEW v_NEWS_DETAILS