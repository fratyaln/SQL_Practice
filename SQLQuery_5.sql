--2. Write a query to fetch customers whose names start with the letter 'A'.
SELECT * from Customers 
WHERE CUSTOMERNAME LIKE 'A%'

--3. Write a query to fetch customers who were born between 1990 and 1995, including both years.
SELECT * from Customers 
WHERE BIRTHDATE BETWEEN '1990' AND '1995'


--4. Write a query using JOIN to fetch customers who live in Istanbul.
SELECT * from Customers AS CUS
JOIN cities on cus.CITYID=cities.ID
where cities.id  =34


-- 5. Write a query using a subquery to fetch customers who live in Istanbul.
 
SELECT * from Customers
where CITYID =(SELECT id from cities where city ='Istanbul')

--6. Write a query to get the number of customers per city.


SELECT CITYID ,cities.city,COUNT(CITYID) as Customers_amount from Customers
JOIN cities ON cities.ID=Customers.CITYID
GROUP BY CITYID ,cities.city
ORDER BY 3 DESC



--7. Write a query to get cities that have more than 10 customers, along with the number of customers, and sort the results from most to least.
SELECT CITYID ,cities.city,COUNT(CITYID) as Customers_amount from Customers
jOIN cities ON cities.ID=Customers.CITYID
GROUP BY CITYID ,cities.city
having COUNT(CITYID) > 10
order by Customers_amount desc


--8. Write a query to get the number of male and female customers per city.

SELECT CITYID ,cities.city,gender,COUNT(GENDER) as Customers_amount from Customers
JOIN cities ON cities.ID=Customers.CITYID
GROUP BY CITYID ,cities.city,gender
order by Customers_amount desc


--9. Add a new column called AGEGROUP (data type: VARCHAR(50)) to the Customers table. Do this using both SQL script and SQL Server Management Studio.
alter TABLE Customers
add AGEGROUP VARCHAR(50)

-- 10. Update the new AGEGROUP column based on age ranges:
/*
20–35 years

36–45 years

46–55 years

55–65 years

*/

UPDATE Customers
SET AGEGROUP = 
    CASE 
        WHEN DATEDIFF(YEAR, BIRTHDATE, GETDATE()) BETWEEN 20 AND 35 THEN '20–35 years'
        WHEN DATEDIFF(YEAR, BIRTHDATE, GETDATE()) BETWEEN 36 AND 45 THEN '36–45 years'
        WHEN DATEDIFF(YEAR, BIRTHDATE, GETDATE()) BETWEEN 46 AND 55 THEN '46–55 years'
        WHEN DATEDIFF(YEAR, BIRTHDATE, GETDATE()) BETWEEN 56 AND 65 THEN '55–65 years'
        WHEN DATEDIFF(YEAR, BIRTHDATE, GETDATE()) > 65 THEN 'Over 65 years'
        ELSE 'Unknown'
    END;

--11. List customers who live in Istanbul but not in the Kadıköy district.
SELECT * from Customers
JOIN districts ON districts.CITYID =Customers.CITYID
where (Customers.CITYID=34) and (districts.district<>'Kadıköy')


--12. Write a query to extract the operator code from the TELNR1 and TELNR2 phone number fields. For example, return only (532), (505), etc.
SELECT 
    CUSTOMERNAME,
    TELNR1,
    TELNR2,
    SUBSTRING(TELNR1, 1, 5) AS Operator1,
    SUBSTRING(TELNR2, 1, 5) AS Operator2
FROM CUSTOMERS;


--13. Based on phone numbers:

/*
If the number starts with "50" or "55", it belongs to Operator X

If it starts with "54", it's Operator Y

If it starts with "53", it's Operator Z

Write a query that returns how many customers each operator has.
*/
SELECT 
    CASE 
        WHEN SUBSTRING(TELNR1, 2, 2) IN ('50', '55') THEN 'X'
        WHEN SUBSTRING(TELNR1, 2, 2) = '54' THEN 'Y'
        WHEN SUBSTRING(TELNR1, 2, 2) = '53' THEN 'Z'
        ELSE 'Unknown'
    END AS Operator,
    COUNT(*) AS CustomerCount
FROM CUSTOMERS
GROUP BY 
    CASE 
        WHEN SUBSTRING(TELNR1, 2, 2) IN ('50', '55') THEN 'X'
        WHEN SUBSTRING(TELNR1, 2, 2) = '54' THEN 'Y'
        WHEN SUBSTRING(TELNR1, 2, 2) = '53' THEN 'Z'
        ELSE 'Unknown'
    END;



--14. Write a query to list the districts with the most customers in each city, sorted from most to least per city.

SELECT CITY ,DISTRICT,MAX(COUNT) from (SELECT CITIES.CITY, DISTRICTS.DISTRICT,COUNT(*) as COUNT from CUSTOMERS
JOIN DISTRICTS on CUSTOMERS.DISTRICTID= DISTRICTS.id
JOIN CITIES on CUSTOMERS.CITYID= CITIES.ID
GROUP BY DISTRICTS.DISTRICT,CITIES.CITY 
) as a
GROUP by CITY,DISTRICT
order by 3 DESC





--15. Write a query to return the day of the week (Monday, Tuesday, Wednesday, etc.) for each customer's date of birth.
 SELECT
    CUSTOMERNAME,
    BIRTHDATE,
    DATENAME(WEEKDAY, BIRTHDATE) AS _theday
FROM CUSTOMERS;

