USE IMDB;  
--If there is no master key, create one now.   
IF NOT EXISTS   
    (SELECT * FROM sys.symmetric_keys WHERE symmetric_key_id = 101)  
    CREATE MASTER KEY ENCRYPTION BY   
    PASSWORD = '23987hxJKL95QYV4369#ghf0%lekjg5k3fd117r$$#1946kcj$n44ncjhdlj'  
GO  

CREATE CERTIFICATE UserPwd0912  
   WITH SUBJECT = 'User Password';  
GO  

CREATE SYMMETRIC KEY Password_Key0912  
    WITH ALGORITHM = AES_256  
    ENCRYPTION BY CERTIFICATE UserPwd0912;   
GO  

-- Open the symmetric key with which to encrypt the data.  
OPEN SYMMETRIC KEY Password_Key0912  
   DECRYPTION BY CERTIFICATE UserPwd0912;  

-- Encrypt the value in column PASSWORD using the  
-- symmetric key PasSword_Key09.  
-- Save the result in column PASSWORD.    

UPDATE PERSON.PersonAccount 
SET Password = EncryptByKey(Key_GUID('Password_Key0912')  
    , UserName, 1, HashBytes('SHA1', CONVERT( varchar  
    , UserName)));  
GO  

-- Verify the encryption.  
-- First, open the symmetric key with which to decrypt the data.  

OPEN SYMMETRIC KEY Password_Key0912 
   DECRYPTION BY CERTIFICATE UserPwd0912;  
GO  

-- Now list the original password, the encrypted password,  
-- and the decrypted ciphertext. If the decryption worked,  
-- the original password will match the decrypted password.  

SELECT UserName, Password   
    AS 'Encrypted PASSWORD', CONVERT(nvarchar,  
    DecryptByKey(Password, 1 ,   
    HashBytes('SHA1', CONVERT(varbinary, Password))))  
    AS 'Decrypted PASSWORD' 
FROM PERSON.PersonAccount 
	WHERE UserName = 'Palak';  
GO  

UPDATE PERSON.PersonAccount SET Password = (SELECT EncryptByKey(Key_GUID('Password_Key0912')  
    , UserName, 1, HashBytes('SHA1', CONVERT( varchar  
    , UserName))) FROM PERSON.PersonAccount WHERE UserName = 'Tejesh') WHERE UserName = 'Palak';

SELECT * FROM PERSON.PersonAccount WHERE UserName = '';

SELECT EncryptByKey(Key_GUID('Password_Key0912')  
    , 'PALAK', 1, HashBytes('SHA1', CONVERT( varchar  
    , 'PALAK'))) FROM PERSON.PersonAccount WHERE PersonID = 1;



