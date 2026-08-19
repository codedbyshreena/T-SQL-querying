--From the table STUDENT perform the following queries:  

--Part – A: 
SELECT * FROM STUDENT
--1. Display rank of students based on SPI. 
SELECT STDID, SNAME, CITY, SPI, BRANCH,
RANK() OVER (ORDER BY SPI DESC) AS RANKS
FROM STUDENT

--2. Display dense rank of students based on SPI. 
SELECT STDID, SNAME, CITY, SPI, BRANCH,
DENSE_RANK() OVER (ORDER BY SPI DESC) AS RANKS
FROM STUDENT

--3. Display sequential number for each student record. 
SELECT STDID, SNAME, CITY, SPI, BRANCH,
ROW_NUMBER() OVER (ORDER BY SPI DESC) AS RANKS
FROM STUDENT

--4. Display branch-wise rank of students. 
SELECT STDID, SNAME, CITY, SPI, BRANCH,
RANK() OVER (PARTITION BY BRANCH
			 ORDER BY SPI DESC) AS RANKS
FROM STUDENT

--5. Display branch-wise dense ranking of students. 
SELECT STDID, SNAME, CITY, SPI, BRANCH,
DENSE_RANK() OVER (PARTITION BY BRANCH
			       ORDER BY SPI DESC) AS RANKS
FROM STUDENT

--6. Display branch-wise sequential numbering of students. 
SELECT STDID, SNAME, CITY, SPI, BRANCH,
ROW_NUMBER() OVER (PARTITION BY BRANCH
			       ORDER BY SPI DESC) AS RANKS
FROM STUDENT

--7. Display SNAME, Current SPI, Previous SPI and SPI Difference with previous student in ascending order of 
--SPI. 
SELECT SNAME, SPI, 
LAG(SPI) OVER (ORDER BY SPI ASC) AS SPI_PREV, 
SPI - LAG(SPI) OVER (ORDER BY SPI ASC) AS SPI_DIFF
FROM STUDENT

--8. Display SNAME, Current SPI, Next SPI and SPI Difference with next student in descending order of SPI.  
SELECT SNAME, SPI, 
LEAD(SPI) OVER (ORDER BY SPI DESC) AS SPI_NEXT, 
SPI - LEAD(SPI) OVER (ORDER BY SPI DESC) AS SPI_DIFF
FROM STUDENT

--9. Display top 3 students based on SPI. 
SELECT * FROM (SELECT STDID, SNAME, CITY, SPI, BRANCH,
			   ROW_NUMBER() OVER (ORDER BY SPI DESC) AS RANKS
               FROM STUDENT) AS XYZ
WHERE RANKS <= 3

--10. Display top 2 students from each branch. 
SELECT * FROM (SELECT STDID, SNAME, CITY, SPI, BRANCH,
			   ROW_NUMBER() OVER (PARTITION BY BRANCH
								  ORDER BY SPI DESC) AS RANKS
               FROM STUDENT) AS XYZ
WHERE RANKS <= 2
 
--Part – B: 

--11. Display 5th highest SPI. 
SELECT * FROM (SELECT STDID, SNAME, CITY, SPI, BRANCH,
			   ROW_NUMBER() OVER (ORDER BY SPI DESC) AS RANKS
               FROM STUDENT) AS XYZ
WHERE RANKS = 5

--12. Display 6th highest SPI. 
SELECT * FROM (SELECT STDID, SNAME, CITY, SPI, BRANCH,
			   ROW_NUMBER() OVER (ORDER BY SPI DESC) AS RANKS
               FROM STUDENT) AS XYZ
WHERE RANKS = 6

--13. Display students having same ranking. 
SELECT * FROM (SELECT STDID,SNAME,SPI,BRANCH,
	           RANK() OVER(ORDER BY SPI DESC) AS RANKS
	           FROM STUDENT) AS STURANK
WHERE RANKS IN (SELECT RANKS FROM (SELECT STDID,SNAME,SPI,BRANCH,
	                               RANK() OVER(ORDER BY SPI DESC) AS RANKS
	                               FROM STUDENT) AS STURANK
                GROUP BY RANKS
                HAVING COUNT(*) > 1)

--14. Display SNAME, Previous SPI, Current SPI and Next SPI based on ascending order of SPI. 
SELECT SNAME, SPI, 
LAG(SPI) OVER (ORDER BY SPI ASC) AS SPI_PREV, 
LEAD(SPI) OVER (ORDER BY SPI DESC) AS SPI_NEXT
FROM STUDENT

--15. Display topper of each branch. 
 SELECT * FROM (SELECT STDID, SNAME, CITY, SPI, BRANCH,
			   ROW_NUMBER() OVER (PARTITION BY BRANCH
								  ORDER BY SPI DESC) AS RANKS
               FROM STUDENT) AS XYZ
WHERE RANKS = 1

--Part – C: 

--16. Display students whose SPI is greater than the previous student and less than the next student. 
SELECT * FROM (SELECT STDID, SNAME, SPI,
               LAG(SPI) OVER (ORDER BY SPI) AS PREV_SPI,
               LEAD(SPI) OVER (ORDER BY SPI) AS NEXT_SPI
               FROM STUDENT) AS XYZ
WHERE SPI > PREV_SPI AND SPI < NEXT_SPI

--17. Display branch-wise second topper students.
 SELECT * FROM (SELECT STDID, SNAME, CITY, SPI, BRANCH,
			   ROW_NUMBER() OVER (PARTITION BY BRANCH
								  ORDER BY SPI DESC) AS RANKS
               FROM STUDENT) AS XYZ
WHERE RANKS = 2

--18. Display students whose rank and dense rank are different. 
SELECT * FROM (SELECT STDID, SNAME, SPI,
               RANK() OVER (ORDER BY SPI DESC) AS RANKS,
               DENSE_RANK() OVER (ORDER BY SPI DESC) AS DENSE_RANKS
               FROM STUDENT) AS XYZ
WHERE RANKS <> DENSE_RANKS

--19. Display consecutive students having same branch ordered by SPI. 
SELECT * FROM (SELECT STDID, SNAME, BRANCH, SPI,
               LAG(BRANCH) OVER (PARTITION BY BRANCH
                                 ORDER BY SPI ) AS PREV_BRANCH
               FROM STUDENT) AS XYZ
WHERE BRANCH = PREV_BRANCH

--20. Display students whose SPI difference with previous student is maximum. 
SELECT TOP 1 *
FROM (SELECT STDID, SNAME,
      SPI - LAG(SPI) OVER (ORDER BY SPI ASC) AS DIFF
      FROM STUDENT) AS NEW
ORDER BY DIFF DESC