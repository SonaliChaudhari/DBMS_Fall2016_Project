CREATE FUNCTION MOVIES.ufnPopularMoviesByGenre()
RETURNS TABLE
AS
RETURN (
	SELECT MG.Genre AS GENRE, SUM(BOC.CollectionAmount) AS BOX_OFFICE_COLLECTION
	FROM MOVIES.BoxOfficeCollectionOfMovie BOC, 
		 MOVIES.Movie MM,
		 MOVIES.Genre MG,
		 MOVIES.MovieTVGenre MTG
	WHERE MM.MovieID = MTG.MovieID AND
		  MG.GenreID = MTG.GenreID AND
		  BOC.MovieID = MM.MovieID
	GROUP BY MG.Genre
);
