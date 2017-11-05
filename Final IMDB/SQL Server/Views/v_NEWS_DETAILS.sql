------------------------------------------------------------------
/*Databases		 : SQL Server
  Author		 : Group 3
  Creation Date  : 12-06-2016 
  View Definition: To retrieve each type of news and its details*/
--------------------------------------------------------------------
CREATE VIEW NEWS.v_NEWS_DETAILS AS
SELECT
	NOC.NewsChannelID,
	NC.NewsChannelName,
	MN.MovieNewsID AS NewsID,
	MN.News,
	M.MovieID AS ID,
	M.Name AS NEWSTYPENAME,
	"NEWSTYPE" = 'MOVIENEWS'
FROM NEWS.NewsOnChannel NOC 
	INNER JOIN NEWS.NewsChannel NC 
		ON NOC.NewsChannelID = NC.NewsChannelID
	INNER JOIN NEWS.MovieNews MN
		ON NOC.MovieNewsID = MN.MovieNewsID
	INNER JOIN MOVIES.Movie M 
		ON MN.MovieID = M.MovieID 
 
UNION 

SELECT 
	NOC.NewsChannelID,
	NC.NewsChannelName,
	TN.TVShowNewsID AS NewsID,
	TN.News,
	T.TVShowID AS ID,
	T.Name,
	"NEWSTYPE" = 'TVNEWS'
FROM NEWS.NewsOnChannel NOC 
	INNER JOIN NEWS.NewsChannel NC 
		ON NOC.NewsChannelID = NC.NewsChannelID
	INNER JOIN NEWS.TVNews TN 
		ON NOC.TVShowNewsID = TN.TVShowNewsID
	INNER JOIN TELEVISION.TVShows T 
		ON TN.TVShowID = T.TVShowID
 UNION
 
SELECT 
	NOC.NewsChannelID,
	NC.NewsChannelName,
	CN.CelebrityNewsID,
	CN.News,
	C.CelebrityID AS ID,
	C.Name,
	"NEWSTYPE" = 'CELEBRITYNEWS'
FROM NEWS.NewsOnChannel NOC
	INNER JOIN NEWS.NewsChannel NC
		ON NOC.NewsChannelID = NC.NewsChannelID
	INNER JOIN NEWS.CelebrityNews CN 
		ON CN.CelebrityNewsID = NOC.CelebrityNewsID
	INNER JOIN PERSON.Celebrity C 
		ON C.CelebrityID = CN.CelebrityID;
