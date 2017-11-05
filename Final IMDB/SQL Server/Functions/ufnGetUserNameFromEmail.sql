CREATE FUNCTION PERSON.ufnGetUserName(@EmailAddress VARCHAR(50))  
RETURNS VARCHAR(10)   
AS   
-- Returns the USERNAME ON THE BASIS OF EMAIL ADDRESS  
BEGIN  
    DECLARE @ret VARCHAR(10); 
	 
	SET @ret = SUBSTRING(@EmailAddress,1,CHARINDEX('@',@EmailAddress)-1);
    
	IF(LEN(@ret) > 10)
		SET @ret = LEFT(@ret, 10);

	IF (@ret IS NULL)   
        SET @ret = 'dummy123';  
    
	RETURN @ret;  
END;

--select PERSON.ufnGetUserName('kalpesh.shewale@husky.neu.edu') from PERSON.Person WHERE PERSONID = 1;
















