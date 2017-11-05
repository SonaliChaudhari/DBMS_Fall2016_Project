sp_configure 'show advanced options', 1;  
GO  
RECONFIGURE;  
GO  
sp_configure 'Database Mail XPs', 1;  
GO  
RECONFIGURE;  
GO 
sp_configure 'Database Mail XPs', 1; 
GO
RECONFIGURE;
GO
EXECUTE dbo.sysmail_stop_sp ;  
GO  
EXECUTE dbo.sysmail_start_sp
GO 
select * from msdb.dbo.sysmail_event_log;
GO
SELECT is_broker_enabled FROM sys.databases WHERE name = 'msdb' ;

EXEC msdb.dbo.sysmail_help_queue_sp @queue_type = 'mail';

-----------------------------To confirm the Database Mail activation is started or not------------------------------------

EXEC msdb.dbo.sysmail_help_status_sp;

SELECT * FROM msdb.dbo.sysmail_allitems;

SELECT sent_account_id, sent_date FROM msdb.dbo.sysmail_sentitems;

--------------------------------------------------------------------------------------------------------------------------
/*Executing InsertOnPerson trigger which in turn calls createPersonAccount proc in which ufnGetUserNameFromEmail() function
  is called and password is encrypted using key*/
--------------------------------------------------------------------------------------------------------------------------

INSERT INTO PERSON.PERSON VALUES (28,106,1112,'Sarla','Agrawal','Female','Individual',45,CURRENT_TIMESTAMP,'palak_a');

select * from PERSON.Person where PersonID = 28;

select * from PERSON.EmailAddress where PersonID = 28;

select * from PERSON.PersonAccount where PersonID = 28;

UPDATE PERSON.Person SET FirstName = 'Sunita', LastName = 'Agrawal' WHERE PersonID = 28;

--------------------------------------------------------------------------------------------------------------------------
/*Executing ufnGetUserName()*/
--------------------------------------------------------------------------------------------------------------------------

SELECT PERSON.ufnGetUserName('agrawal.pala@husky.neu.edu');

--------------------------------------------------------------------------------------------------------------------------
/*Executing createPersonAccount()*/
--------------------------------------------------------------------------------------------------------------------------
EXEC PERSON.createPersonAccountOnInsertOrUpdate 'Sneha','Kashyap',18,'9876ASD','sneha.kp@gmail.com';

SELECT * FROM PERSON.Person WHERE PersonID = 18;

select * from PERSON.EmailAddress where PersonID = 18;

select * from PERSON.PersonAccount where PersonID = 18;
--------------------------------------------------------------------------------------------------------------------------
/*Executing deleteUserpoll trigger*/
--------------------------------------------------------------------------------------------------------------------------
----Unsuccessful case
DELETE FROM IMDBCOMMUNITY.PollQuestion WHERE PollQuestionID = 55;

---- Successful case
DELETE FROM IMDBCOMMUNITY.PollQuestion WHERE PollQuestionID = 1;

INSERT INTO IMDBCOMMUNITY.POLLQUESTION VALUES (1,'ElMaruecan82.','14-Nov-2016',45000,'If you could only watch one category of movies for the rest of your life, which one would you choose?',current_timestamp,'Chaudhari_S');

INSERT INTO IMDBCOMMUNITY.POLLOPTION VALUES (1,1,'Hindi',2121,current_timestamp,'Chaudhari_S');
INSERT INTO IMDBCOMMUNITY.POLLOPTION VALUES (2,1,'Indy',14124,current_timestamp,'Chaudhari_S');
INSERT INTO IMDBCOMMUNITY.POLLOPTION VALUES (3,1,'Indie',141421,current_timestamp,'Chaudhari_S');


INSERT INTO IMDBCOMMUNITY.USERPOLL VALUES (1,1,1,current_timestamp,'Chaudhari_S');
INSERT INTO IMDBCOMMUNITY.USERPOLL VALUES (1,2,3,current_timestamp,'Chaudhari_S');
INSERT INTO IMDBCOMMUNITY.USERPOLL VALUES (1,3,6,current_timestamp,'Chaudhari_S');

SELECT * FROM IMDBCOMMUNITY.PollQuestion;
SELECT * FROM IMDBCOMMUNITY.PollOption;
SELECT * FROM IMDBCOMMUNITY.UserPoll;
--------------------------------------------------------------------------------------------------------------------------
/*Executing addmessageboard*/
--------------------------------------------------------------------------------------------------------------------------
----Unsuccessful case
EXEC IMDBCOMMUNITY.ADDMESSAGEBOARDS 'Film Talk', 'Hello', 'Best "screwball" comedies of the 1930s';

---- Successful case
EXEC IMDBCOMMUNITY.ADDMESSAGEBOARDS 'Film Talk', 'Film General', 'Best "screwball" comedies of the 1930s';

select * from IMDBCOMMUNITY.MessageBoard order by discussionid desc;

--------------------------------------------------------------------------------------------------------------------------
/*Executing printCelebrityDetails*/
--------------------------------------------------------------------------------------------------------------------------

exec PrintCelebrityDetails 'Aaron Putnam';

--------------------------------------------------------------------------------------------------------------------------
/*Executing ufnPopularMoviesByGenre()*/
--------------------------------------------------------------------------------------------------------------------------

SELECT * from MOVIES.ufnPopularMoviesByGenre();

--------------------------------------------------------------------------------------------------------------------------
/*Executing generateMovieReport*/
--------------------------------------------------------------------------------------------------------------------------

EXEC generateMovieReport;

--------------------------------------------------------------------------------------------------------------------------
/*Executing ufnDECODE()*/
--------------------------------------------------------------------------------------------------------------------------
SELECT Movies.ufnDECODE(-66) AS RESULT;

SELECT Movies.ufnDECODE(12) AS RESULT;

