/* -------------------- Set up Database -------------------- */
/* To work through this code and test segments, highlight them and then press run */
/* This is based on AlexTheAnalyst 's youtube course */

/* Create Database*/
CREATE DATABASE SqlTutorial;
GO

/* Change to that database */
USE SqlTutorial;
GO

/* -------------------- Set up Tables -------------------- */

/*Create tables within the database*/
CREATE TABLE EmployeeDemographics
(EmployeeID int, 
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50) )

CREATE TABLE EmployeeSalary
(EmlpoyeeID int, 
JobTitle varchar(50),
Salary int)

/* Add data to the tables*/
INSERT INTO EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

INSERT INTO EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000) 

/* -------------------- SELECT Statements -------------------- */

/* Shows all of a given table (the * stans for all) */
SELECT *
FROM EmployeeDemographics

/* Shows a specific column of a given table */
SELECT FirstName
FROM EmployeeDemographics

/* Shows a multiple specific column of a given table */
SELECT FirstName, LastName
FROM EmployeeDemographics

/* Shows top 5 rows of a given table */
SELECT TOP 5 *
FROM EmployeeDemographics

/* Shows the distinct values in a given column (ex. 'yes, no' is returned column only contains yes or no options) */
SELECT DISTINCT(Gender)
FROM EmployeeDemographics

/* Shows the number of none null values in a column (ex. '9' is returned if there are 9 last names in the list)*/
SELECT COUNT(LastName)
FROM EmployeeDemographics 

/* Does what the previous one did but titles the table with 'LastNameCount'*/
SELECT COUNT(LastName) AS LastNameCount
FROM EmployeeDemographics

/* Looking at the Max of a value*/
SELECT MAX(Salary)
FROM EmployeeSalary

/* Looking at the Max of a value*/
SELECT MAX(Salary)
FROM EmployeeSalary

/* Looking at the Min of a value*/
SELECT MIN(Salary)
FROM EmployeeSalary

/* Looking at the Average of a value*/
SELECT AVG(Salary)
FROM EmployeeSalary 

/* -------------------- FROM Statements -------------------- */

/* If running from the master database, specify the name of the specific database the table is located in*/
SELECT *
FROM SQLTutorial.dbo.EmployeeSalary



/* -------------------- WHERE Statements -------------------- */

/* Returns rows that contain the first name of Jim */
SELECT *
FROM EmployeeDemographics
WHERE FirstName = 'Jim'

/* Returns rows that do not contain the first name of Jim */
SELECT *
FROM EmployeeDemographics
WHERE FirstName <> 'Jim'

/* Returns rows with ages over 30, if wanting over and 30 then add '=' */
SELECT *
FROM EmployeeDemographics
WHERE Age > 30 

/* Returns rows with ages equal or over to 32 AND genders that are male */
SELECT *
FROM EmployeeDemographics
WHERE Age <= 32 AND Gender = 'Male'

/* Returns rows with ages equal or over to 32 OR genders that are male */
SELECT *
FROM EmployeeDemographics
WHERE Age <= 32 OR Gender = 'Male'

/* Returns rows with last name containing an 's' anywhere */
SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE '%S%'

/* Returns rows with last name containing an 'S' at the begining and and 'o' anywhere (if more letters, they have to be in order and between $) */
SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%o%'

/* Returns rows with a first name of null value, no first name */
SELECT *
FROM EmployeeDemographics
WHERE FirstName is NULL

/* Returns rows with a first name of none null value, they do have a first name */
SELECT *
FROM EmployeeDemographics
WHERE FirstName is NOT NULL

/* A way of connecting lots of equal statements, this will return all rows with the names listed */
SELECT *
FROM EmployeeDemographics
WHERE FirstName In ('Jim', 'Michael')



/* -------------------- Group By, Order By -------------------- */

/* This rolls up all the rows into categories according to their distinct values  */
SELECT Gender
FROM EmployeeDemographics
GROUP BY Gender

/* This does what the above does and then counts how much are in each category */
SELECT Gender, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Gender

/* This will cause the above output to be all split up and the count will require both gender and age to be the same */
SELECT Gender, Age, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Gender, Age

/* You can add in parameters on top of that */
SELECT Gender, COUNT(Gender) AS CountGender
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender

/* This will put the rows in order according to the CountGender values going from smallest to largest */
SELECT Gender, COUNT(Gender) AS CountGender
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY CountGender

/* Adding DESC will make it go in descending order, from largest to smallest */
SELECT Gender, COUNT(Gender) AS CountGender
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY CountGender DESC

/* Can do multiple order bys, it'll first be ordered according to age, then within multiples it will order by gender */
SELECT *
FROM EmployeeDemographics
ORDER BY Age DESC, Gender

/* Putting in the number of the column will also have the same affect, this does the same as above because age is in the 4th column, and gender in the 5th */
SELECT *
FROM EmployeeDemographics
ORDER BY 4 DESC, 5



/* -------------------- Inner Joins, Full/Left/Right Outer Joins -------------------- */
/* How to combine multiple tables into a single output */

SELECT *
FROM SqlTutorial.dbo.EmployeeDemographics

SELECT *
FROM SqlTutorial.dbo.EmployeeSalary 

/* Looking at tables, you can use employee ID to combine rows */

SELECT *
FROM SqlTutorial.dbo.EmployeeDemographics
Inner Join SqlTutorial.dbo.EmployeeSalary
    ON (SqlTutorial.dbo.EmployeeDemographics.EmployeeID = SqlTutorial.dbo.EmployeeSalary.EmployeeID)




/* --------------------     -------------------- */
/* --------------------     -------------------- */
/* --------------------     -------------------- */
/* --------------------     -------------------- */
/* --------------------     -------------------- */
/* --------------------     -------------------- */