CREATE VIEW v_MOVIECELEB AS 
SELECT DISTINCT MCT.CELEBRITYNAME,
      MCT.MOVIENAME,
      MCEL.MovieYear,
      MCEL.TOTALCOLLECTION,
      MCT.CELEBTYPE
FROM (SELECT CFM2.CELEBRITYNAME, 
                     MOVIENAME, 
                     M.MovieYear, 
                     SUM(BCM.CollectionAmount) TOTALCOLLECTION
                     FROM v_CASTFORMOVIE CFM2, 
                          MOVIE M, 
                          BoxOfficeCollectionOfMovie BCM
                      WHERE M.MOVIEID = CFM2.MOVIEID AND 
                         BCM.MovieID = CFM2.MovieID AND
                         CFM2.CELEBRITYNAME = CelebrityName 
                      GROUP BY CELEBRITYNAME, 
                             MOVIENAME, 
                           M.MOVIEYEAR
                      ORDER BY CELEBRITYNAME) MCEL , (SELECT CELEBRITYNAME,
                            MOVIENAME, 
                            LISTAGG(TYPE,';') 
                  WITHIN GROUP (ORDER BY MOVIENAME) 
                  OVER (PARTITION BY CELEBRITYNAME, MOVIENAME) AS CELEBTYPE
                  FROM V_CASTFORMOVIE) MCT
  WHERE MCEL.CELEBRITYNAME = MCT.CELEBRITYNAME
   AND MCEL.MOVIENAME = MCT.MOVIENAME
  ORDER BY MCEL.TOTALCOLLECTION DESC;
  
 -- DROP VIEW v_MOVIECELEB; 