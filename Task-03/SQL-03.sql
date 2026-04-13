-- Step 1: Create Table
CREATE TABLE Employees (
    Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT
);

-- Step 2: Insert Sample Data
INSERT INTO Employees (Id, Name, Department, Salary) VALUES
(1, 'Ram', 'IT', 60000),
(2, 'Arun', 'HR', 40000),
(3, 'Priya', 'IT', 75000),
(4, 'Kiran', 'Finance', 50000),
(5, 'Meena', 'HR', 55000),
(6, 'John', 'IT', 45000),
(7, 'Sara', 'Finance', 70000);

-- Step 3: Aggregate + WHERE + GROUP BY + HAVING
SELECT 
    Department,
    COUNT(*) AS TotalEmployees,
    AVG(Salary) AS AvgSalary,
    SUM(Salary) AS TotalSalary
FROM Employees
WHERE Salary > 40000           -- Row filtering
GROUP BY Department            -- Grouping
HAVING COUNT(*) >= 2;          -- Group filtering