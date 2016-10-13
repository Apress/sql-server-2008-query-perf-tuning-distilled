DECLARE @retry AS TINYINT = 1
   ,@retrymax AS TINYINT = 2
   ,@retrycount AS TINYINT = 0 ;

WHILE @retry = 1
    AND @retrycount <= @retrymax
    BEGIN
        SET @retry = 0 ;
        BEGIN TRY
            UPDATE  HumanResources.Employee
            SET     LoginID = '54321'
            WHERE   BusinessEntityID = 100 ;
        END TRY
        BEGIN CATCH
            IF (ERROR_NUMBER() = 1205) 
                BEGIN
                    SET @retrycount = @retrycount + 1 ;
                    SET @retry = 1 ;
                END
        END CATCH
    END

