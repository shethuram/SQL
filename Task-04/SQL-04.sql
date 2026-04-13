-- Step 1: Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50)
);

-- Step 2: Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(50),
    Amount INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Step 3: Insert Data into Customers
INSERT INTO Customers (CustomerID, Name, City) VALUES
(1, 'Ram', 'Salem'),
(2, 'John', 'Chennai'),
(3, 'Amit', 'Delhi'),
(4, 'Sara', 'Mumbai');

-- Step 4: Insert Data into Orders
INSERT INTO Orders (OrderID, CustomerID, Product, Amount) VALUES
(101, 1, 'Laptop', 50000),
(102, 1, 'Mouse', 500),
(103, 2, 'Keyboard', 1500);

-- Step 5: INNER JOIN (Only Matching Records)
SELECT 
    c.CustomerID,
    c.Name,
    c.City,
    o.OrderID,
    o.Product,
    o.Amount
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;

-- Step 6: LEFT JOIN (All Customers + Matching Orders)
SELECT 
    c.CustomerID,
    c.Name,
    c.City,
    o.OrderID,
    o.Product,
    o.Amount
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;

-- Step 7: RIGHT JOIN (All Orders + Matching Customers)
SELECT 
    c.CustomerID,
    c.Name,
    c.City,
    o.OrderID,
    o.Product,
    o.Amount
FROM Customers c
RIGHT JOIN Orders o
ON c.CustomerID = o.CustomerID;

-- Step 8: Customers with NO Orders 
SELECT 
    c.CustomerID,
    c.Name
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL;