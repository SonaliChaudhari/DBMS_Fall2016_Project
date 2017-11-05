----------------------------------------------------------------------------
/*Databases		: SQL Server
  Author		: Group 3
  Creation Date : 12-06-2016
  Query Number	: 1
  Query			: View for Award Details*/
------------------------------------------------------------------------------

SELECT * FROM AWARD.v_AWARD_DETAILS;

--------------------------------------------------------------------------------
/*Databases		: SQL Server
  Author		: Group 3
  Creation Date : 12-06-2016
  Query Number	: 2
  Query			: View for News Details*/
---------------------------------------------------------------------------------

SELECT * FROM NEWS.v_NEWS_DETAILS;

--------------------------------------------------------------------------------
/*Databases		: SQL Server
  Author		: Group 3
  Creation Date : 12-06-2016
  Query Number	: 3
  Query			: View for retrieving show names as per the range of Showtimes*/
---------------------------------------------------------------------------------

SELECT * FROM MOVIES.v_SHOWS;

--------------------------------------------------------------------------------
/*Databases		: SQL Server
  Author		: Group 3
  Creation Date : 12-06-2016
  Query Number	: 4
  Query			: View for retrieving celebrity name and their type for each movie*/
---------------------------------------------------------------------------------

SELECT * FROM MOVIES.v_CASTFORMOVIE;