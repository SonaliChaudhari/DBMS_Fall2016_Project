-- Get the celebrity details and history given his name

 CREATE OR REPLACE PROCEDURE PrintCelebrityDetails (CelebName VARCHAR)
 AS 
    MovieName VARCHAR(50);
    CelebrityType VARCHAR(100);
    CelebrityName VARCHAR(50);
    MovieYear VARCHAR(4);
    CollectionAmount INT;
    ROWCOUNT INT;
    
    CURSOR cur1 IS (SELECT * FROM v_MOVIECELEB WHERE CELEBRITYNAME = CelebName);
                  
	BEGIN
  dbms_output.enable();
  SELECT COUNT(*) INTO ROWCOUNT 
		      FROM Celebrity 
		      WHERE Name = CelebName;
    IF (ROWCOUNT >0) THEN
    Open cur1;
    LOOP
      FETCH cur1 INTO CelebrityName, MovieName, MovieYear, CollectionAmount, CelebrityType;
          DBMS_OUTPUT.PUT_LINE (CelebrityName || ' has been a part as ' || CelebrityType || ' in the movie ' || MovieName ||
          ' which came in the year ' || MovieYear || ' and has a Gross Box Office Collection of ' || CollectionAmount || ' millions');
      EXIT WHEN cur1%NOTFOUND;
    END LOOP;
    CLOSE cur1;
    ELSE
        DBMS_OUTPUT.PUT_LINE ( 'The Celebrity does not exist in our Database. Please enter another celebrity to get the Details');
    END IF;	
END;

--EXEC PrintCelebrityDetails('Brad Pitt');

