--From the table EMPLOYEE perform the following queries:  

--Part – A:  
SELECT * FROM EMPLOYEE 
--1. Create a stored procedure to generate department-wise salary statistics like total salary, average 
--salary, minimum salary, and maximum salary. (User enter only department name) 
GO

CREATE PROCEDURE PR_STATISTICS_EMP
@DEPARTMENT VARCHAR(30)
AS 
BEGIN 
	SELECT SUM(SALARY) AS TOTAL_SAL, 
	AVG(SALARY) AS AVG_SAL, MAX(SALARY) AS MAX_SAL, MIN(SALARY) AS MIN_SALARY
	FROM EMPLOYEE
	WHERE DEPARTMENT = @DEPARTMENT
END

EXEC PR_STATISTICS_EMP 'IT'

--2. Create a stored procedure that accepts a joining year and displays employees who joined that year.
GO

CREATE PROCEDURE PR_DISPLAY_YEAR
@JOININGYEAR INT
AS
BEGIN 
	SELECT * FROM EMPLOYEE
	WHERE JOININGYEAR = @JOININGYEAR
END

EXEC PR_DISPLAY_YEAR 2025

--3. Create a stored procedure for dynamic employee search using parameters (User may enter partial city 
--name). 
GO

CREATE PROCEDURE PR_EMP_SEARCH
@CITY VARCHAR(50) 
AS
BEGIN
	SELECT * FROM EMPLOYEE
	WHERE CITY LIKE '%' +@CITY+ '%'
END 

EXEC PR_EMP_SEARCH 'RAJ'

--4. Create a stored procedure that accepts a salary amount and displays employees earning more than the 
--entered salary. 
GO

CREATE PROCEDURE PR_EMP_SALARY_ABOVE
    @SALARY DECIMAL(10,2)
AS
BEGIN
    SELECT * FROM EMPLOYEE
    WHERE SALARY > @SALARY;
END;

EXEC PR_EMP_SALARY_ABOVE 50000;

--5. Create a stored procedure to display top N highest paid employees from each department (Value of N 
--is entered by user).
GO

CREATE PROCEDURE PR_TOPN_EMP_BY_DEPT
    @N INT
AS
BEGIN
    SELECT *
    FROM (
        SELECT E.*, 
               ROW_NUMBER() OVER (PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS RN
        FROM EMPLOYEE E
    ) T
    WHERE RN <= @N;
END;

EXEC PR_TOPN_EMP_BY_DEPT 3;

--6. Create a stored procedure to increase salary department-wise by a given percentage. (User Enter 
--Department Name and %, e.g. Computer 10).
GO

CREATE PROCEDURE PR_UPDATE_SALARY_DEPT
    @DEPT VARCHAR(30),
    @PERCENT DECIMAL(5,2)
AS
BEGIN
    UPDATE EMPLOYEE
    SET SALARY = SALARY + (SALARY * @PERCENT / 100)
    WHERE DEPARTMENT = @DEPT;
END;

EXEC PR_UPDATE_SALARY_DEPT 'IT', 10;

--7. Create a stored procedure to display employees having experience greater than or equal to the entered 
--years. 
GO

CREATE PROCEDURE PR_EMP_EXPERIENCE
    @YEARS INT
AS
BEGIN
    SELECT * FROM EMPLOYEE
    WHERE DATEDIFF(YEAR, JOININGYEAR, GETDATE()) >= @YEARS;
END;

EXEC PR_EMP_EXPERIENCE 5;

--8. Create a stored procedure that accepts a number as input and displays details of the last N employees 
--who joined the organization. 
GO

CREATE PROCEDURE PR_LASTN_EMP
    @N INT
AS
BEGIN
    SELECT TOP (@N) *
    FROM EMPLOYEE
    ORDER BY JOININGYEAR DESC;
END;

EXEC PR_LASTN_EMP 5;

--From the table AUTHOR, PUBLISHER and BOOK perform the following queries:  

--Part – B:  
SELECT * FROM AUTHOR
SELECT * FROM PUBLISHER
SELECT * FROM BOOK
--9. Create a stored procedure that accepts an author name and displays all books written by that author. 
GO

CREATE PROCEDURE PR_BOOKS_BY_AUTHOR
    @AUTHORNAME VARCHAR(50)
AS
BEGIN
    SELECT B.*, A.AUTHORNAME
    FROM BOOK B
    JOIN AUTHOR A ON B.AUTHORID = A.AUTHORID
    WHERE A.AUTHORNAME = @AUTHORNAME;
END;

EXEC PR_BOOKS_BY_AUTHOR 'CHETAN BHAGAT';

--10. Create a stored procedure that accepts a publication year and displays books published after that year. 
GO

CREATE PROCEDURE PR_BOOKS_AFTER_YEAR
    @YEAR INT
AS
BEGIN
    SELECT * FROM BOOK
    WHERE PUBLICATIONYEAR > @YEAR;
END;

EXEC PR_BOOKS_AFTER_YEAR 2020;

--11. Create a stored procedure that accepts a country name and displays all authors from that country with 
--their books. 
GO

CREATE PROCEDURE PR_AUTHOR_BOOKS_BY_COUNTRY
    @COUNTRY VARCHAR(50)
AS
BEGIN
    SELECT A.AUTHORNAME, B.TITLE
    FROM AUTHOR A
    JOIN BOOK B ON A.AUTHORID = B.AUTHORID
    WHERE A.COUNTRY = @COUNTRY;
END;

EXEC PR_AUTHOR_BOOKS_BY_COUNTRY 'NEW DELHI';

--12. Create a stored procedure that accepts a number as input and displays the top N most expensive books 
--with author and publisher details. 
GO

CREATE PROCEDURE PR_TOPN_EXPENSIVE_BOOKS
    @N INT
AS
BEGIN
    SELECT TOP (@N) B.TITLE, B.PRICE, A.AUTHORNAME, P.PUBLISHERNAME
    FROM BOOK B
    JOIN AUTHOR A ON B.AUTHORID = A.AUTHORID
    JOIN PUBLISHER P ON B.PUBLISHERID = P.PUBLISHERID
    ORDER BY B.PRICE DESC;
END;

EXEC PR_TOPN_EXPENSIVE_BOOKS 5;
 
--Part – C:  

--13. Create a stored procedure that accepts a publisher name and displays the total number of books 
--published by that publisher. 
GO

CREATE PROCEDURE PR_BOOKCOUNT_BY_PUBLISHER
    @PUBNAME VARCHAR(50)
AS
BEGIN
    SELECT P.PUBLISHERNAME, COUNT(*) AS TOTAL_BOOKS
    FROM BOOK B
    JOIN PUBLISHER P ON B.PUBLISHERID = P.PUBLISHERID
    WHERE P.PUBLISHERNAME = @PUBNAME
    GROUP BY P.PUBLISHERNAME;
END;

EXEC PR_BOOKCOUNT_BY_PUBLISHER 'PENGUIN INDIA';

--14. Create a stored procedure that accepts a price range (Min Price Max Price) and displays books whose 
--prices fall within that range. 
GO

CREATE PROCEDURE PR_BOOKS_BY_PRICE_RANGE
    @MINPRICE DECIMAL(10,2),
    @MAXPRICE DECIMAL(10,2)
AS
BEGIN
    SELECT * FROM BOOK
    WHERE PRICE BETWEEN @MINPRICE AND @MAXPRICE;
END;

EXEC PR_BOOKS_BY_PRICE_RANGE 200, 500;

--15. Create a stored procedure that accepts an author ID and deletes all books written by that author. 
GO

CREATE PROCEDURE PR_DELETE_BOOKS_BY_AUTHOR
    @AUTHORID INT
AS
BEGIN
    DELETE FROM BOOK
    WHERE AUTHORID = @AUTHORID;
END;

EXEC PR_DELETE_BOOKS_BY_AUTHOR 101;