  SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER DELETEUSERPOLL
BEFORE DELETE ON POLLQUESTION
FOR EACH ROW
DECLARE
  L_QuestionID int;
  L_PostedUser varchar(30);
  L_PostedDate date;
  ROWCOUNT INT;

BEGIN
    L_QuestionID:= :OLD.PollQuestionID;
    L_PostedUser:= :OLD.PostedBy;
    L_PostedDate:= TO_DATE(:OLD.PostedOn,'DD-MM-YYYY');
    
      SELECT COUNT(*) INTO ROWCOUNT
				   FROM PollQuestion 
      WHERE PollQuestionID = L_QuestionID;
		IF (ROWCOUNT>0) THEN
      DELETE FROM UserPoll WHERE PollQuestionID = L_QuestionID;
			DELETE FROM PollOption WHERE PollQuestionID = L_QuestionID;
			DELETE FROM PollQuestion WHERE PollQuestionID = L_QuestionID;
      DBMS_OUTPUT.PUT_LINE('The Poll question Posted by '+ L_PostedUser +' on '+ L_PostedDate + ' is deleted.');

		ELSE
			DBMS_OUTPUT.PUT_LINE('QuestionID does not exist');
      ROLLBACK;
    END IF;
END;