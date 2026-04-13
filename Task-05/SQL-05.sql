
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary INT,
    DepartmentID INT
);

INSERT INTO Employees (EmployeeID, Name, Salary, DepartmentID) VALUES
(1, 'Ram', 60000, 1),
(2, 'John', 40000, 1),
(3, 'Amit', 70000, 2),
(4, 'Sara', 50000, 2),
(5, 'Priya', 30000, 3),
(6, 'Kiran', 45000, 3);




--  1. NON-CORRELATED SUBQUERY
-- Employees earning above overall average salary


SELECT Name, Salary
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary) 
    FROM Employees
);




--  2. CORRELATED SUBQUERY
-- Employees earning above their department average


SELECT e.Name, e.Salary, e.DepartmentID
FROM Employees e
WHERE e.Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE DepartmentID = e.DepartmentID
);




--  3. SUBQUERY IN SELECT (Dynamic Column)
-- Show department average for each employee


SELECT 
    e1.Name,
    e1.Salary,
    e1.DepartmentID,
    (
        SELECT AVG(Salary)
        FROM Employees e2
        WHERE e2.DepartmentID = e1.DepartmentID
    ) AS Dept_Avg_Salary
FROM Employees e1;



-- ============================================
--  OPTIMIZED VERSION (JOIN + GROUP BY)
-- Same as correlated subquery (better performance)
-- ============================================

/*
SELECT e.Name, e.Salary, e.DepartmentID
FROM Employees e
JOIN (
    SELECT DepartmentID, AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY DepartmentID
) d
ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > d.AvgSalary;
*/