
CREATE OR REPLACE TRIGGER InsertInPersonAcc  
AFTER INSERT OR UPDATE ON PERSON   
FOR EACH ROW
DECLARE

   L_firstname VARCHAR(50);
	 L_lastname VARCHAR(50);
	 L_personId INT;
	 L_emailAddress VARCHAR(50);
	 L_accountNum VARCHAR(7);
	 L_ROWCOUNT INT;
	
  BEGIN
        L_personId:= :NEW.PersonID;
        L_firstname:= :NEW.FirstName;
        L_lastname:= :NEW.LastName;
        L_accountNum:= '0012' + UPPER(SUBSTR(L_firstname,1,3));
        SELECT EmailAddress INTO L_emailAddress
          FROM EMAILADDRESS 
        WHERE PersonID = L_personId;
      
        SELECT COUNT(*) INTO L_ROWCOUNT 
            FROM EMAILADDRESS 
        WHERE PersonID = L_personId;
	IF(L_ROWCOUNT = 0) THEN
		L_emailAddress:= LOWER(L_firstname) || '.' ||LOWER(L_lastname) + 'husky.neu.edu';
    INSERT INTO EMAILADDRESS (PersonID, EmailAddress,ModifiedDate,ModifiedBy) VALUES (L_personId,L_emailAddress, SYSDATE,'palak_a');		 
  END IF;  
    
      createPersonAccount(L_firstname,L_lastname,L_personId,L_accountNum,L_emailAddress);
END;
/
