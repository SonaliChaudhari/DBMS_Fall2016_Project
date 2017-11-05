CREATE PROCEDURE createPersonAccount (I_FIRSTNAME VARCHAR
, I_LASTNAME VARCHAR
, I_PERSONID INT
, I_ACCOUNTNUM VARCHAR
, I_EMAILADDRESS VARCHAR)
	AS
		BEGIN 
    DECLARE 
      L_USERNAME VARCHAR(20);
      L_PASSWORD RAW(128);
			ROWCOUNT INT;
		BEGIN	
			SELECT ufnGetUserNameFFROMEMAIL(I_EMAILADDRESS) INTO L_USERNAME FROM DUAL; 

    	SELECT UTL_RAW.CAST_TO_RAW(CONVERT(L_USERNAME,'AL32UTF8','US7ASCII')) INTO L_PASSWORD FROM DUAL;
      
      DBMS_OUTPUT.PUT_LINE (L_PASSWORD);
			SELECT COUNT(*) INTO ROWCOUNT
								FROM PersonAccount
									WHERE PersonID = I_PERSONID;
      SAVEPOINT sp_savestate;
      
			IF(ROWCOUNT = 0) THEN
				INSERT INTO PersonAccount (PersonID,UserName,AccountNumber,CreateDate,ModifiedDate,ModifiedBy,Password) VALUES (I_PERSONID,L_USERNAME,I_ACCOUNTNUM,SYSDATE,SYSDATE,'palak_a',L_PASSWORD);
			ELSE
				UPDATE PersonAccount 
					SET UserName = L_USERNAME, Password = L_PASSWORD
				WHERE PersonID = I_PERSONID;
      END IF;
      
			EXCEPTION
       WHEN OTHERS THEN
    -- We roll back to the savepoint.
          DBMS_OUTPUT.PUT_LINE ('Due to some error while insertion, transaction is being rolledback');
					DBMS_OUTPUT.PUT_LINE (SQLCODE);
          ROLLBACK TO sp_savestate;
    -- And of course we raise again,
    -- since we don't want to hide the error.
    -- Not raising here is an error!
    RAISE; 
  END;
END;
/


