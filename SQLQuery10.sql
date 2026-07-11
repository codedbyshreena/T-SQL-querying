--Math functions 

--Part – A: 

--1. Display the result of 5 multiply by 30. 
SELECT (5*30)

--2. Find out the absolute value of -25, 25, -50 and 50. 
SELECT ABS(-25)
SELECT ABS(25)
SELECT ABS(50)
SELECT ABS(-50)

--3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.
SELECT CEILING(25.2)
SELECT CEILING(25.7)
SELECT CEILING(-25.2)

--4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2.
SELECT FLOOR(25.2)
SELECT FLOOR(25.7)
SELECT FLOOR(-25.2)

--5. Find out remainder of 5 divided 2 and 5 divided by 3.
SELECT 5 % 2
SELECT 5 % 3

--6. Find out value of 3 raised to 2nd power and 4 raised 3rd power. 
SELECT POWER(3,2)
SELECT POWER(4,3)

--7. Find out the square root of 25, 30 and 50.
SELECT SQRT(25)
SELECT SQRT(30)
SELECT SQRT(50)

--8. Find out the square of 5, 15, and 25. 
SELECT SQUARE(5)
SELECT SQUARE(15)
SELECT SQUARE(25)

--9. Find out the value of PI.
SELECT PI()

--10. Find out round value of 157.732 for 2, 0 and -2 decimal points.
SELECT ROUND(157.732,0)
SELECT ROUND(0,-2)

--11. Find out exponential value of 2 and 3. 
SELECT EXP(2)
SELECT EXP(3)

--12. Find out logarithm having base e of 10 and 2.
SELECT LOG(10)
SELECT LOG(2)

--13. Find logarithm base 10 of 5 and 100
SELECT LOG10(5)
SELECT LOG10(100)

--14. Find sine, cosine and tangent of 3.1415.
SELECT SIN(3.1415)
SELECT COS(3.1415)
SELECT TAN(3.1415)

--15. Find sign of -25, 0 and 25.
SELECT SIGN(-25)
SELECT SIGN(0)
SELECT SIGN(25)

--16. Generate random number using function.
SELECT RAND()

--String functions 

--Part – A: 

--1. Find the length of following. (I) NULL    (II) ‘   hello     ’   (III)  Blank 
SELECT LEN(NULL)
SELECT LEN('   hello     ')
--SELECT LEN() ERROR

--2. Display your name in lower & upper case. 
SELECT UPPER('shreena')
SELECT LOWER('SHREENA')

--3. Display first three characters of your name. 
SELECT SUBSTRING('SHREENA',1,3)

--4. Display 3rd to 10th character of your name.
SELECT SUBSTRING('SHREENA SOLIA',3,8)

--5. Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE.
SELECT REPLACE('abc123egf','abc123egf','abcXYZefg')
SELECT REPLACE('abcabcabc','abcabcabc','ab5ab5ab5')

--6. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9. 
SELECT ASCII('a')
SELECT ASCII('A')
SELECT ASCII('z')
SELECT ASCII('Z')
SELECT ASCII(0)
SELECT ASCII(9)

--7. Write a query to display character based on number 97,65,122,90,48,57. 
SELECT ASCII(97)
SELECT ASCII(65)
SELECT ASCII(122)
SELECT ASCII(90)
SELECT ASCII(48)
SELECT ASCII(57)

--8. Write a query to remove spaces from left of a given string ‘ hello world  ‘.
SELECT LTRIM(' hello world  ')

--9. Write a query to remove spaces from right of a given string ‘ hello world  ‘.
SELECT RTRIM(' hello world  ')

--10. Write a query to display first 4 & Last 5 characters of ‘SQL Server’. 
SELECT LEFT('SQL Server', 4)
SELECT RIGHT('SQL Server', 5)

--11. Write a query to convert a string ‘1234.56’ to number (Use cast and convert function). 
SELECT CAST('1234.56' AS INT)
SELECT CONVERT(INT, '1234.56')

--12. Write a query to convert a float 10.58 to integer (Use cast and convert function). 
SELECT CAST(10.58 AS INT)
SELECT CONVERT(FLOAT, 10.58)

--13. Put 10 space before your name using function. 
SELECT SPACE(10)+ 'SHREENA'

--14. Combine two strings using + sign as well as CONCAT ().
SELECT CONCAT('SHREENA', ' ', 'SOLIA')

--15. Find reverse of “Darshan”. 
SELECT REVERSE('DARSHAN')

--16. Repeat your name 3 times. 
SELECT REPLICATE('SHREENA', 3)
 
--Part – B: Perform following queries on EMPLOYEE table. 
SELECT * FROM EMPLOYEE
--17. Display FIRSTNAME and LASTNAME in lowercase and uppercase. 
SELECT UPPER(FIRSTNAME) 
FROM EMPLOYEE
SELECT UPPER(LASTNAME) 
FROM EMPLOYEE
SELECT LOWER(FIRSTNAME) 
FROM EMPLOYEE
SELECT LOWER(LASTNAME)
FROM EMPLOYEE

--18. Display full name by combining FIRSTNAME and LASTNAME.
SELECT CONCAT(FIRSTNAME, ' ', LASTNAME)
FROM EMPLOYEE

--19. Display FIRSTNAME with first 3 characters only.
SELECT SUBSTRING(FIRSTNAME, 1, 3)
FROM EMPLOYEE

--20. Display LASTNAME with last 2 characters only.
SELECT RIGHT(LASTNAME, 2)
FROM EMPLOYEE

--21. Display length of each employee’s FIRSTNAME.
SELECT LEN(FIRSTNAME)
FROM EMPLOYEE

--22. Display FIRSTNAME after replacing ‘A’ with ‘@’.
SELECT REPLACE(FIRSTNAME, 'A', '@')
FROM EMPLOYEE

--23. Display FIRSTNAME and LASTNAME with - between them using CONCAT.
SELECT CONCAT(FIRSTNAME, '-', LASTNAME)
FROM EMPLOYEE

--Part – C: Perform following queries on EMPLOYEE table.

--24. Display FIRSTNAME without first and last character. 
SELECT SUBSTRING(FIRSTNAME, 2, LEN(FIRSTNAME) - 2) 
FROM EMPLOYEE

--25. Display FIRSTNAME after replacing vowels with '*'. 
--25. REMOVED

--26. Display employees where combined length of FIRSTNAME and LASTNAME is greater than 10. 
SELECT *
FROM EMPLOYEE
WHERE LEN(FIRSTNAME) + LEN(LASTNAME) > 10

--27. Display FIRSTNAME and its reverse. 
SELECT FIRSTNAME, REVERSE(FIRSTNAME) AS ReverseName
FROM EMPLOYEE

--28. Display employees whose FIRSTNAME and LASTNAME start with same character using LEFT().
SELECT EID, FIRSTNAME, LASTNAME
FROM EMPLOYEE
WHERE LEFT(FIRSTNAME, 1) = LEFT(LASTNAME, 1)