----PALAK 1
SELECT * FROM (SELECT CFM1.MOVIENAME AS MOVIE,
		CFM1.CELEBRITYNAME AS DIRECTOR,
		CFM2.CELEBRITYNAME AS ACTORORACTRESS,
		SR.Status
	FROM (SELECT DISTINCT(CELEBRITYNAME), MOVIENAME, MOVIEID FROM v_CASTFORMOVIE WHERE TYPEID = 4 ) CFM1
LEFT JOIN (SELECT DISTINCT(CELEBRITYNAME), MOVIENAME, MOVIEID FROM v_CASTFORMOVIE WHERE TYPEID IN (1,2)) CFM2
	ON CFM2.MOVIEID = CFM1.MOVIEID
LEFT JOIN MOVIE M
	ON M.MovieID = CFM2.MOVIEID
LEFT JOIN MOVIETVStatusRef SR
	ON SR.StatusID = M.StatusID
	WHERE SR.Status NOT IN ('In-Theatre')
	GROUP BY ROLLUP (CFM1.MOVIENAME,CFM1.CELEBRITYNAME,CFM2.CELEBRITYNAME, SR.Status)) CFM
	WHERE CFM.ACTORORACTRESS IS NOT NULL
		AND CFM.Status IS NOT NULL
	ORDER BY CFM.MOVIE;
  

----PALAK 2

SELECT *
  FROM (SELECT VS.SHOWNAME,
		UB.ShowDate, 
		T.Name AS THEATRENAME, 
		UB.TotalPrice
	FROM v_SHOWS VS
INNER JOIN MOVIEShowInTheatre MST
	ON MST.SHOWTIMEID = VS.ShowTimeID
INNER JOIN USERBOOKING UB
	ON UB.ShowTimeID = MST.ShowTimeID
INNER JOIN THEATRE T
	ON T.TheatreID = MST.TheatreID
	WHERE UB.ShowDate <= SYSDATE) -- CHECK ABOUT DATE CONDITION
PIVOT (SUM(TotalPrice) FOR SHOWNAME IN('EARLYBIRDS','BIRDSOFDAY','BIRDSOFEVE','BIRDSOFNIGHT','LAZYBIRDS')
)
ORDER BY SHOWDATE;

-----PALAK 3



WITH HIGHESTRATEDGENRE_CTE(GENRE,MOVIENAME,Rating)
AS
	(
SELECT G.Genre,
M.Name AS MOVIENAME,
MAX(M.Rating)
	FROM MOVIE M
LEFT JOIN MOVIETVGenre MTG
	ON MTG.MovieID = M.MovieID
LEFT JOIN GENRE G
	ON G.GenreID = MTG.GenreID
GROUP BY M.Name, Genre
	) 
SELECT	HCTE.GENRE,
		HCTE1.MOVIENAME,
		HCTE.HIGHESTRATING
	FROM (SELECT MAX(RATING) AS HIGHESTRATING, GENRE 
			FROM HIGHESTRATEDGENRE_CTE
			GROUP BY GENRE) HCTE
INNER JOIN (SELECT * FROM HIGHESTRATEDGENRE_CTE) HCTE1
	ON HCTE.GENRE = HCTE1.GENRE
WHERE HCTE.HIGHESTRATING = HCTE1.RATING
	AND HCTE.GENRE = HCTE1.GENRE
	ORDER BY HCTE.HIGHESTRATING DESC,HCTE1.MOVIENAME;

----- PALAK 4

SELECT *
  FROM (SELECT  C.TOTALBOXOFFICECOLLECTION AS TotalBoxOfficeCollectionInMi,
                C.MOVIENAME,
                COUNT(DOC.COLLECTIONDAY) AS NumberOfWeeks
      FROM (SELECT TO_CHAR(BOCD.CollectionDate,'DY') AS COLLECTIONDAY, 
                	M.MovieID
            FROM MOVIE M
            LEFT JOIN BoxOfficeCollectionOfMovie BOCM
                ON BOCM.MovieID = M.MovieID
            LEFT JOIN BoxOfficeCollectionDATE BOCD
                ON BOCD.BoxOfficeCollectionID = BOCM.BoxOfficeCollectionID
            GROUP BY BOCD.CollectionDate,M.MovieID
            ORDER BY COLLECTIONDAY DESC ) DOC
      LEFT JOIN (SELECT M.MovieID,
                      M.Name AS MOVIENAME,
                      M.ReleaseDate,
                      TO_CHAR(M.ReleaseDate,'DY') AS RELEASEDDAY,
                      SUM(BOCM.CollectionAmount) AS TOTALBOXOFFICECOLLECTION
                  FROM MOVIE M
                  LEFT JOIN BoxOfficeCollectionOfMovie BOCM
                      ON BOCM.MovieID = M.MovieID
                  LEFT JOIN BoxOfficeCollectionDATE BOCD
                      ON BOCD.BoxOfficeCollectionID = BOCM.BoxOfficeCollectionID
                    GROUP BY M.MovieID,
                            M.Name,
                           M.ReleaseDate
                    ORDER BY TOTALBOXOFFICECOLLECTION DESC) C
          ON C.MovieID = DOC.MovieID
WHERE  C.RELEASEDDAY = DOC.COLLECTIONDAY
GROUP BY C.TOTALBOXOFFICECOLLECTION,
        C.MOVIENAME
        ORDER BY TotalBoxOfficeCollectionInMi DESC , 
        NumberOfWeeks DESC
) Q
WHERE ROWNUM<=10
      
--Highest voted poll option for every poll question SONALI 1 ----- TO BE SEEN LATER
SELECT POP.PollQuestionID ,
        POP.Options,
        POP.UserVotes,
        POP.OptionID 
  FROM PollOption POP 
  WHERE POP.UserVotes IN(SELECT MAX(PO.UserVotes) AS USERVOTES
                          FROM PollOption PO 
                        GROUP BY PO.PollQuestionID);
                        
                        

--NUMBER OF REVIEWS FOR TOP 5 MOVIES BY RATING BY USERS AND CRITICS SONALI 2

SELECT COUNT(R.ReviewID) AS "TOTAL_REVIEWS",
        M.MovieID,
        M.Name AS MOVIE_NAME 
   FROM MOVIE M 
INNER JOIN REVIEW R 
  ON R.MovieID = M.MovieID 
WHERE M.MovieID IN (SELECT * FROM (SELECT M.MovieID 
                        FROM MOVIE M 
                      ORDER BY M.Rating DESC)
                      WHERE ROWNUM <= 5) 
  GROUP BY M.MovieID, M.Name
  ORDER BY TOTAL_REVIEWS DESC;
  
-----TEJESH 1
SELECT SHOW.Name, GENRE.Genre,
	   SEASON.SeasonNumber, COUNT(EPISODE.EpisodeNumber) AS TOTAL_EPISODES, 
	   CHANNEL.Channel, ST.ShowTime
FROM TVSHOWs SHOW, TVSeasonShow SEASON, TVSHOWEpisode EPISODE,
	 CHANNEL CHANNEL, TVSHOWOnChannel SOC, TVSHOWTime ST,
	 MovieTVGenre MTG, Genre GENRE
WHERE SHOW.TVShowID = SEASON.TVShowID AND SOC.TVShowID = SHOW.TVShowID AND
	  SEASON.SeasonID = EPISODE.SeasonID AND SOC.ShowTimeID = ST.ShowTimeID AND
	  CHANNEL.ChannelID = SOC.ChannelID AND GENRE.GenreID = MTG.GenreID AND
	  SHOW.TVShowID = MTG.TVShowID
GROUP BY SHOW.Name,GENRE.Genre, SEASON.SeasonNumber, CHANNEL.Channel, ST.ShowTime


--How many message board has a user started TEJESH 2

SELECT UD.UserID, 
      P.FirstName ||' '|| P.LastNamE AS "NAME", 
      MBC.CategoryName, 
      MBT.TopicName, 
      MB.DiscussionContent
FROM MESSAGEBOARD MB, 
    MESSAGEBOARDCategory MBC,
    MESSAGEBOARDTopic MBT, 
    USERDETAILS UD, 
    PERSON P
WHERE UD.UserID = MB.UserID 
  AND MB.TopicID = MBT.TopicID 
  AND MBC.CategoryID = MBT.CategoryID
  AND P.PersonID = UD.UserID
ORDER  BY NAME

--Number of celebrities based on their type TEJESH 3

SELECT * 
FROM 
(SELECT C.NAME, 
        TC.TYPE 
      FROM CELEBRITY C, 
            CELEBRITYType CT, 
            TYPEOFCELEBRITY TC 
 WHERE C.CelebrityID = CT.CelebrityID 
    AND CT.TypeID = TC.TypeID)
 PIVOT(COUNT(NAME) FOR TYPE IN ('Actor','Actress','Producer','Director','Singer','Writer','Model'));


--Cheapest ticket for movie, in each theatre for different screens TEJESH 5

SELECT M.Name AS "MOVIENAME", 
      T.Name AS "THEATRENAME", 
      S.Name AS "SCREEN", 
      MIN(MSIT.ShowPrice) AS "MINIMUMPRICE"
FROM MOVIEShowInTheatre MSIT, 
      MOVIE M, 
      THEATRE T, 
      SCREEN S, 
      SHOWTIME ST,
      SHOWDATE SD
WHERE MSIT.MovieID = M.MovieID 
    AND T.TheatreID = MSIT.TheatreID
	  AND S.ScreenID = MSIT.ScreenID 
    AND ST.ShowTimeID = MSIT.ShowTimeID 
	  AND SD.ShowDate = MSIT.ShowDate
  GROUP BY M.Name, T.NAME, S.NAME
ORDER BY M.Name DESC, T.Name DESC, S.Name DESC;



-----------------------------------------------------------------------------------------------

EXEC createPersonAccount('Kalpesh','Shewale',15,'123456','kalpesh.shewale@husky.neu.edu');

SELECT * FROM PERSONACCOUNT WHERE PERSONID = 15;

--DROP PROCEDURE PERSON.createPersonAccountOnInsertOrUpdate;

SELECT PERSON.ufnGetUserName('TEJESH.RATHI123@husky.neu.edu');

SELECT UTL_RAW.CAST_TO_RAW(CONVERT('PALAK','AL32UTF8','US7ASCII')) FROM DUAL;
