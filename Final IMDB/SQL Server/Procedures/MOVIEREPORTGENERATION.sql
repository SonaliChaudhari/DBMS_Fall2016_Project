
CREATE PROCEDURE generateMovieReport
	AS 
BEGIN
		SET NOCOUNT ON;
		DECLARE 

		@MovieID INT,
		@MovieName VARCHAR(50),
		@LANGUAGE VARCHAR(50),
		@CERTIFICATE VARCHAR(50),
		@MESSAGE VARCHAR(100),
		@DISKTYPE VARCHAR(50),
		@LOCATION VARCHAR(50),
		@TRAILERNAME VARCHAR(50),
		@SOUNDMIXNAME VARCHAR(50),
		@PRODUCTIONAME VARCHAR(50);

		PRINT '--------TECHNICAL DETIALS OF MOVIE REPORT FOR 2016 --------';  

		DECLARE MOVIE_CURSOR CURSOR FOR

		SELECT M.MovieID, M.Name  FROM MOVIES.Movie M WHERE M.MovieYear = 2016 ORDER BY M.MovieID;

		OPEN MOVIE_CURSOR
		FETCH NEXT FROM MOVIE_CURSOR INTO @MovieID,@MovieName

		WHILE @@FETCH_STATUS = 0
		BEGIN
		 PRINT ' '
			PRINT 'MOVIE:'+@MovieName  
		--LANGUAGE
			SELECT @message = '-- LANGUAGES: ' +   
				@MovieName  
  
			PRINT @message   


			DECLARE LANGUAGE_CURSOR CURSOR FOR   
			SELECT L.Language  FROM MOVIES.Language L, MOVIES.ReleaseLanguage RL, MOVIES.Movie M
			WHERE L.LanguageID =RL.LanguageID AND RL.MovieID = M.MovieID AND M.Name=@MovieName;
 
		 OPEN LANGUAGE_CURSOR
		 FETCH NEXT FROM LANGUAGE_CURSOR INTO @LANGUAGE

		 IF @@FETCH_STATUS <> 0   
				PRINT '         <<None>>'       
  
			WHILE @@FETCH_STATUS = 0  
			BEGIN  
  
				SELECT @message = '         ' + @LANGUAGE  
				PRINT @message  
				FETCH NEXT FROM LANGUAGE_CURSOR INTO @LANGUAGE  
				END  
		--CERTIFICATE
			PRINT '-- CERTIFICATE: '    

			DECLARE CERTIFICATE_CURSOR CURSOR FOR 
	
				SELECT C.CertificateName 
				FROM MOVIES.Certificate C, MOVIES.Movie M 
				WHERE C.CertificateID = M.CertificateID AND M.Name = @MovieName
		
					OPEN CERTIFICATE_CURSOR 
					FETCH NEXT FROM CERTIFICATE_CURSOR INTO @CERTIFICATE

						IF @@FETCH_STATUS <> 0
						PRINT '         <<None>>'       
  
				 WHILE @@FETCH_STATUS = 0  
				 BEGIN  
  
				SELECT @message = '         ' + @CERTIFICATE  
				PRINT @message  
				FETCH NEXT FROM CERTIFICATE_CURSOR INTO @CERTIFICATE  
				END   
		 --MOIVIEDISKTYPE

				PRINT '-- MOVIE DISK TYPE: '    

			DECLARE MOVIEDISKTYPE_CURSOR CURSOR FOR 
	
						 SELECT DISTINCT DR.DiskType FROM 
						 MOVIES.DiskTypeRef DR RIGHT OUTER JOIN MOVIES.MovieOrTVDiskType MTR ON DR.DiskTypeID = MTR.DiskTypeID 
						 RIGHT OUTER JOIN MOVIES.Movie M ON M.MovieID = MTR.MovieID AND M.Name = @MovieName WHERE DR.DiskType IS NOT NULL		
			
					OPEN MOVIEDISKTYPE_CURSOR 
					FETCH NEXT FROM MOVIEDISKTYPE_CURSOR INTO @DISKTYPE

						IF @@FETCH_STATUS <> 0
						PRINT '         <<None>>'       
  
				 WHILE @@FETCH_STATUS = 0  
				 BEGIN  
  
				SELECT @message = '         ' + @DISKTYPE  
				PRINT @message  
				FETCH NEXT FROM MOVIEDISKTYPE_CURSOR INTO @DISKTYPE  
				END   
		--LOCATION
				PRINT '-- FILMING LOCATIONS: '    

			DECLARE LOCATION_CURSOR CURSOR FOR 
	
				SELECT DISTINCT FL.Location FROM 
				MOVIES.FilmingLocation FL RIGHT OUTER JOIN MOVIES.MovieFilmingLocation ML ON FL.LocationID= ML.LocationID 
				RIGHT OUTER JOIN MOVIES.Movie M ON M.MovieID = ML.MovieID AND M.Name = @MovieName WHERE LocATION IS NOT NULL
		
					OPEN LOCATION_CURSOR 
					FETCH NEXT FROM MOVIEDISKTYPE_CURSOR INTO @DISKTYPE

						IF @@FETCH_STATUS <> 0
						PRINT '         <<None>>'       
  
				 WHILE @@FETCH_STATUS = 0  
				 BEGIN  
  
				SELECT @message = '         ' + @LOCATION  
				PRINT @message  
				FETCH NEXT FROM LOCATION_CURSOR INTO @LOCATION  
				END   
		--TRAILER
		PRINT '-- TRAILER: '    

			DECLARE TRAILER_CURSOR CURSOR FOR 
	
						 SELECT DISTINCT MT.Name FROM 
						 MOVIES.MovieTrailer MT RIGHT OUTER JOIN MOVIES.Movie M 
						 ON MT.MovieID = M.MovieID AND M.Name = @MovieName WHERE MT.Name IS NOT NULL		
			
					OPEN TRAILER_CURSOR 
					FETCH NEXT FROM TRAILER_CURSOR INTO @TRAILERNAME

						IF @@FETCH_STATUS <> 0
						PRINT '         <<None>>'       
  
				 WHILE @@FETCH_STATUS = 0  
				 BEGIN  
  
				SELECT @message = '         ' + @TRAILERNAME  
				PRINT @message  
				FETCH NEXT FROM TRAILER_CURSOR INTO @TRAILERNAME 
				END  
		--SOUNDMIX 
			PRINT '-- SOUND MIX: '    

			DECLARE SOUNDMIX_CURSOR CURSOR FOR 
	
						  SELECT DISTINCT SM.SoundMixName FROM
						  MOVIES.SoundMixRef SM RIGHT OUTER JOIN MOVIES.MovieTVSoundMix MTSM
								 ON MTSM.SoundMixID = SM.SoundMixID RIGHT OUTER JOIN MOVIES.Movie M
									 ON M.MovieID = MTSM.MovieID 
										AND M.Name = @MovieName
							 WHERE SM.SoundMixName IS NOT NULL	
			
					OPEN SOUNDMIX_CURSOR 
					FETCH NEXT FROM SOUNDMIX_CURSOR INTO @SOUNDMIXNAME

						IF @@FETCH_STATUS <> 0
						PRINT '         <<None>>'       
  
				 WHILE @@FETCH_STATUS = 0  
				 BEGIN  
  
				SELECT @message = '         ' + @SOUNDMIXNAME  
				PRINT @message  
				FETCH NEXT FROM SOUNDMIX_CURSOR INTO @SOUNDMIXNAME
				END  
		--PRODUCTION
			PRINT '-- PRODUCTION HOUSE: '    

			DECLARE PRODUCTION_CURSOR CURSOR FOR 
	
						   SELECT DISTINCT P.ProductioName FROM
							MOVIES.ProductionHouse P RIGHT OUTER JOIN MOVIES.ProductionForMovieOrTV PM 
								ON P.ProductionID= PM.ProductionID
									RIGHT OUTER JOIN MOVIES.Movie M 
										ON M.MovieID = PM.MovieID 
											AND M.Name = 'Arrival'
						 WHERE P.ProductioName IS NOT NULL
			
					OPEN PRODUCTION_CURSOR 
					FETCH NEXT FROM PRODUCTION_CURSOR INTO @PRODUCTIONAME

						IF @@FETCH_STATUS <> 0
						PRINT '         <<None>>'       
  
				 WHILE @@FETCH_STATUS = 0  
				 BEGIN  
  
				SELECT @message = '         ' +@PRODUCTIONAME 
				PRINT @message  
				FETCH NEXT FROM PRODUCTION_CURSOR INTO  @PRODUCTIONAME
				END  


				 CLOSE PRODUCTION_CURSOR  
			DEALLOCATE PRODUCTION_CURSOR 
		
				 CLOSE SOUNDMIX_CURSOR  
			DEALLOCATE SOUNDMIX_CURSOR 
 

				 CLOSE TRAILER_CURSOR  
			DEALLOCATE TRAILER_CURSOR 
 
		   CLOSE LOCATION_CURSOR  
			DEALLOCATE LOCATION_CURSOR  
  
  
		  CLOSE MOVIEDISKTYPE_CURSOR  
			DEALLOCATE MOVIEDISKTYPE_CURSOR 
	
			 CLOSE CERTIFICATE_CURSOR  
			DEALLOCATE CERTIFICATE_CURSOR 
	
  
		  CLOSE LANGUAGE_CURSOR  
			DEALLOCATE LANGUAGE_CURSOR  
				-- Get the next vendor.  
			FETCH NEXT FROM MOVIE_CURSOR   
			INTO @MovieID,@MovieName
  
		END   
		CLOSE MOVIE_CURSOR;  
		DEALLOCATE MOVIE_CURSOR;  
END;