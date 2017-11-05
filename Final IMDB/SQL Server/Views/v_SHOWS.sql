-----------------------------------------------------------------------------
/*Databases		 : SQL Server
  Author		 : Group 3
  Creation Date  : 12-06-2016 
  View Definition: To retrieve each type movie show according to the show times*/
----------------------------------------------------------------------------------

CREATE VIEW MOVIES.v_SHOWS AS
		SELECT FORMAT(CAST(ShowTime AS DATETIME),'hh:mm tt') AS SHOWTIME,ShowTimeID, "SHOWNAME" =
			CASE 
				WHEN ShowTimeID BETWEEN 400 AND 432 THEN 'EARLYBIRDS'
				WHEN ShowTimeID BETWEEN 433 AND 505 THEN 'BIRDSOFDAY'
				WHEN ShowTimeID BETWEEN 506 AND 552 THEN 'BIRDSOFEVE'
				WHEN ShowTimeID BETWEEN 553 AND 587 THEN 'BIRDSOFNIGHT'
				ELSE 'LAZYBIRD'
			END
		FROM MOVIES.ShowTime;

--SELECT * FROM MOVIES.v_SHOWS;

--DROP VIEW MOVIES.v_SHOWS;




