-- Step 1: Create Table
CREATE TABLE Employees (
    Id INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2),
    Department VARCHAR(50)
);


-- Step 2: Insert Data
INSERT INTO Employees (Id, Name, Salary, Department)
VALUES 
(1, 'Ram', 50000.00, 'IT'),
(2, 'Vijay', 45000.00, 'HR'),
(3, 'Priya', 60000.00, 'Finance'),
(4, 'Suriya', 55000.00, 'IT'),
(5, 'Sneha', 48000.00, 'Marketing');


-- Step 3: Retrieve Data
SELECT * FROM Employees;
