--From the table DEPOSIT perform the following queries: 

--Part – A: 

--1. Add column state varchar(20).  
ALTER TABLE DEPOSIT
ADD STATE VARCHAR(20)

--2. Add two more columns city varchar(20) and pincode int.
ALTER TABLE DEPOSIT
ADD CITY VARCHAR(20), PINCODE INT

--3. Change the size of cname column from varchar(50) to varchar(35).  
ALTER TABLE DEPOSIT
ALTER COLUMN CNAME VARCHAR(35)

--4. Change the data type of amount from decimal to int.  
ALTER TABLE DEPOSIT
ALTER COLUMN AMOUNT INT

--5. Delete column city from the DEPOSIT table. 
ALTER TABLE DEPOSIT
DROP COLUMN CITY

--6. Rename column actno to ano.
EXEC SP_RENAME 'DEPOSIT.ACTNO', 'ANO'

--7. Rename column bname to branch_name. 
EXEC SP_RENAME 'DEPOSIT.BNAME', 'BRANCH_NAME'

--8. Rename table DEPOSIT to DEPOSIT_DETAIL.
EXEC SP_RENAME 'DEPOSIT', 'DEPOSIT_DETAIL'

--9. Add column ifsc_code varchar(15).  
ALTER TABLE DEPOSIT
ADD IFSC_CODE VARCHAR(15)

--10. Change the size of bname column from varchar(50) to varchar(30). 
ALTER TABLE DEPOSIT
ALTER COLUMN BNAME VARCHAR(30)

--Part – B: 

--11. Rename column adate to aopendate.  
EXEC SP_RENAME 'DEPOSIT.ADATE', 'AOPENDATE'

--12. Delete column aopendate from DEPOSIT_DETAIL table.
ALTER TABLE DEPOSIT_DETAIL
DROP COLUMN AOPENDATE

--13. Rename column cname to customer_name.
EXEC SP_RENAME 'DEPOSIT.CNAME', 'CUSTOMER_NAME'

--14. Add column country varchar(20).
ALTER TABLE DEPOSIT
ADD COUNTRY VARCHAR(20)

--15. Add column account_type varchar(15). 
ALTER TABLE DEPOSIT
ADD ACCOUNT_TYPE VARCHAR(15)

--Part – C: 

--16. Change data type of pincode from int to bigint. 
ALTER TABLE DEPOSIT
ALTER COLUMN PINCODE BIGINT

--17. Delete column account_type. 
ALTER TABLE DEPOSIT
DROP COLUMN ACCOUNT_TYPE

--18. Rename column amount to balance.
EXEC SP_RENAME 'DEPOSIT.AMOUNT', 'BALANCE'

--19. Add column status varchar(10).
ALTER TABLE DEPOSIT
ADD STATUS VARCHAR(10)

--20. Change table name deposit_detail to bank_deposit.
EXEC SP_RENAME 'DEPOSIT_DETAIL', 'BANK_DEPOSIT'
 
--From the table DEPOSIT perform the following queries:

--Part – A:  
SELECT * FROM DEPOSIT
--1. Delete all the records having amount less than or equal to 3000.
DELETE FROM DEPOSIT
WHERE AMOUNT <= 3000

--2. Delete all the accounts of ‘BEDI’ branch customer.
DELETE FROM DEPOSIT
WHERE BNAME='BEDI'

--3. Delete all the accounts having account number greater than 102 and less than 109.
DELETE FROM DEPOSIT
WHERE ACTNO > 102 AND ACTNO < 109

--4. Delete all the accounts whose branch is ‘BEDI’ or ‘MADHAPAR’.
DELETE FROM DEPOSIT
WHERE BNAME = 'BEDI' OR BNAME = 'MADHAPAR'

--5. Delete all the accounts details where amount is 8000 and account open after 1-1-2025;
DELETE FROM DEPOSIT
WHERE AMOUNT = 8000 AND ADATE > '1-1-2025'

--6. Delete all the accounts whose account branch is NULL.
DELETE FROM DEPOSIT
WHERE BNAME IS NULL

--7. Delete all the accounts details where amount is 7000 and name is CHARMI and branch is SHITAL PARK.
DELETE FROM DEPOSIT
WHERE AMOUNT = 7000 AND CNAME = 'CHARMI' AND BNAME = 'SHITAL PARK'

--8. Delete all the remaining records using DELETE command.
DELETE FROM DEPOSIT 

--9. Delete all the records of DEPOSIT table. (Use TRUNCATE) 
TRUNCATE TABLE DEPOSIT

--10. Remove DEPOSIT table. (Use DROP)
DROP TABLE DEPOSIT
 
--From the table STUDENT perform the following queries:

--Part – B: 

--11. Delete all the students whose stdid is greater than 105. 
DELETE FROM STUDENT
WHERE STDID > 105

--12. Delete the records whose branch is NULL and sname is not NULL.  
DELETE FROM STUDENT 
WHERE BRANCH IS NULL AND SNAME IS NOT NULL

--13. Delete the records whose SPI is less than 9 and city is RAJKOT. 
DELETE FROM STUDENT
WHERE SPI < 9 AND CITY = 'RAJKOT'

--14. Delete the records whose branch name is not empty.
DELETE FROM STUDENT
WHERE BRANCH IS NOT NULL

--15. Delete all the records of STUDENT table. (Use TRUNCATE)
TRUNCATE TABLE STUDENT 