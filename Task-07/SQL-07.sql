-- =====================================
-- 1. CREATE DATABASE
-- =====================================
CREATE DATABASE IF NOT EXISTS WindowPractice;
USE WindowPractice;

-- =====================================
-- 2. DROP TABLE (clean run)
-- =====================================
DROP TABLE IF EXISTS Orders;

-- =====================================
-- 3. CREATE TABLE
-- =====================================
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    Customer VARCHAR(50),
    Amount INT,
    OrderDate DATE
);

-- =====================================
-- 4. INSERT SAMPLE DATA
-- =====================================
INSERT INTO Orders (Customer, Amount, OrderDate) VALUES
('Ram', 100, '2026-04-10'),
('Ram', 200, '2026-04-12'),
('Ram', 150, '2026-04-15'),
('Ajay', 300, '2026-04-11'),
('Ajay', 100, '2026-04-13');

-- =====================================
-- 5. VIEW DATA
-- =====================================
SELECT * FROM Orders;

-- =====================================
-- 6. WINDOW FUNCTION: TOTAL (FULL TABLE)
-- =====================================
SELECT 
    OrderID,
    Amount,
    SUM(Amount) OVER() AS TotalAmount
FROM Orders;

-- =====================================
-- 7. PARTITION BY (TOTAL PER CUSTOMER)
-- =====================================
SELECT 
    Customer,
    Amount,
    SUM(Amount) OVER (PARTITION BY Customer) AS TotalPerCustomer
FROM Orders;

-- =====================================
-- 8. RUNNING TOTAL (ASC ORDER)
-- =====================================
SELECT 
    Customer,
    OrderDate,
    Amount,
    SUM(Amount) OVER (
        PARTITION BY Customer
        ORDER BY OrderDate ASC
    ) AS RunningTotal_ASC
FROM Orders;

-- =====================================
-- 9. RUNNING TOTAL (DESC ORDER)
-- =====================================
SELECT 
    Customer,
    OrderDate,
    Amount,
    SUM(Amount) OVER (
        PARTITION BY Customer
        ORDER BY OrderDate DESC
    ) AS RunningTotal_DESC
FROM Orders;

-- =====================================
-- 10. ROW_NUMBER()
-- =====================================
SELECT 
    Customer,
    Amount,
    ROW_NUMBER() OVER (ORDER BY Amount DESC) AS RowNum
FROM Orders;

-- =====================================
-- 11. RANK()
-- =====================================
SELECT 
    Amount,
    RANK() OVER (ORDER BY Amount DESC) AS RankVal
FROM Orders;

-- =====================================
-- 12. DENSE_RANK()
-- =====================================
SELECT 
    Amount,
    DENSE_RANK() OVER (ORDER BY Amount DESC) AS DenseRankVal
FROM Orders;

-- =====================================
-- 13. TOP CUSTOMER (USING SUBQUERY)
-- =====================================
SELECT *
FROM (
    SELECT 
        Customer,
        SUM(Amount) AS Total,
        RANK() OVER (ORDER BY SUM(Amount) DESC) AS rnk
    FROM Orders
    GROUP BY Customer
) t
WHERE rnk = 1;

-- =====================================
-- 14. RUNNING TOTAL WITH FRAME (EXPLICIT)
-- =====================================
SELECT 
    Customer,
    OrderDate,
    Amount,
    SUM(Amount) OVER (
        PARTITION BY Customer
        ORDER BY OrderDate
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningTotal_Frame
FROM Orders;

-- =====================================
-- 15. LAG() - PREVIOUS ORDER AMOUNT
-- =====================================
SELECT 
    Customer,
    OrderDate,
    Amount,
    LAG(Amount) OVER (
        PARTITION BY Customer
        ORDER BY OrderDate
    ) AS PrevAmount
FROM Orders;

-- =====================================
-- 16. LEAD() - NEXT ORDER AMOUNT
-- =====================================
SELECT 
    Customer,
    OrderDate,
    Amount,
    LEAD(Amount) OVER (
        PARTITION BY Customer
        ORDER BY OrderDate
    ) AS NextAmount
FROM Orders;

-- =====================================
-- 17. LAG() WITH OFFSET (2 ROWS BACK)
-- =====================================
SELECT 
    Customer,
    OrderDate,
    Amount,
    LAG(Amount, 2) OVER (
        PARTITION BY Customer
        ORDER BY OrderDate
    ) AS Prev2Orders
FROM Orders;

-- =====================================
-- 18. LAG() WITH DEFAULT VALUE
-- =====================================
SELECT 
    Customer,
    OrderDate,
    Amount,
    LAG(Amount, 1, 0) OVER (
        PARTITION BY Customer
        ORDER BY OrderDate
    ) AS PrevAmount_Default0
FROM Orders;

-- =====================================
-- 19. DIFFERENCE FROM PREVIOUS ORDER
-- =====================================
SELECT 
    Customer,
    OrderDate,
    Amount,
    Amount - LAG(Amount) OVER (
        PARTITION BY Customer
        ORDER BY OrderDate
    ) AS DiffFromPrev
FROM Orders;