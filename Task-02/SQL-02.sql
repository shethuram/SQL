drop table Employees;

--  Step 1: Create Table
CREATE TABLE Employees (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary INT
);
GO

--  Step 2: Insert Sample Data
INSERT INTO Employees (FirstName, LastName, Department, Salary) VALUES
('Ram', 'Kumar', 'Sales', 45000),
('Ajay', 'Sharma', 'IT', 60000),
('Priya', 'Menon', 'HR', 40000),
('John', 'David', 'Sales', 55000),
('Anu', 'Reddy', 'IT', 70000),
('Kiran', 'Das', 'HR', 35000),
('Sneha', 'Iyer', 'Sales', 30000),
('Vikram', 'Singh', 'IT', 80000);
GO

--- TASK RELATED QUERIES---


--  1. Filter by Department (Sales)
SELECT * 
FROM Employees
WHERE Department = 'Sales';
GO

--  2. Filter + Sort by Salary (High → Low)
SELECT * 
FROM Employees
WHERE Department = 'Sales'
ORDER BY Salary DESC;
GO

--  3. Multiple Conditions (AND)
SELECT * 
FROM Employees
WHERE Department = 'Sales' AND Salary > 40000;
GO

--  4. Multiple Conditions (OR)
SELECT * 
FROM Employees
WHERE Department = 'HR' OR Department = 'IT';
GO

--  5. Sort by Multiple Columns
SELECT * 
FROM Employees
ORDER BY Department ASC, Salary DESC;
GO

--  6. Advanced Combined Query
SELECT FirstName, LastName, Department, Salary
FROM Employees
WHERE Salary > 30000 AND Department = 'IT'
ORDER BY Salary DESC;
GO