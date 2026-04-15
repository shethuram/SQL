

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(50),
    OrderDate DATETIME
);

-- =====================================
-- 1. INSERT SAMPLE DATA
-- =====================================
INSERT INTO Orders (CustomerName, OrderDate) VALUES
('Ram', NOW()),
('Ajay', DATE_SUB(NOW(), INTERVAL 5 DAY)),
('Sneha', DATE_SUB(NOW(), INTERVAL 15 DAY)),
('Kiran', DATE_SUB(NOW(), INTERVAL 35 DAY)),
('Priya', DATE_SUB(NOW(), INTERVAL 60 DAY));

-- =====================================
-- 2. VIEW ALL DATA
-- =====================================
SELECT * FROM Orders;

-- =====================================
-- 3. DATE FUNCTION: DAYS SINCE ORDER
-- =====================================
SELECT 
    OrderID,
    CustomerName,
    OrderDate,
    DATEDIFF(NOW(), OrderDate) AS DaysAgo
FROM Orders;

-- =====================================
-- 4. DATE FUNCTION: ADD 7 DAYS (DELIVERY)
-- =====================================
SELECT 
    OrderID,
    OrderDate,
    DATE_ADD(OrderDate, INTERVAL 7 DAY) AS DeliveryDate
FROM Orders;

-- =====================================
-- 5. FILTER: LAST 30 DAYS
-- =====================================
SELECT *
FROM Orders
WHERE OrderDate >= DATE_SUB(NOW(), INTERVAL 30 DAY);

-- =====================================
-- 6. FORMAT DATE OUTPUT
-- =====================================
SELECT 
    OrderID,
    CustomerName,
    DATE_FORMAT(OrderDate, '%d-%m-%Y') AS FormattedDate
FROM Orders;

-- =====================================
-- 7. COMBINED QUERY (BEST PRACTICE)
-- =====================================
SELECT 
    OrderID,
    CustomerName,
    DATE_FORMAT(OrderDate, '%d-%m-%Y') AS OrderDateFormatted,
    DATEDIFF(NOW(), OrderDate) AS DaysAgo
FROM Orders
WHERE OrderDate >= DATE_SUB(NOW(), INTERVAL 30 DAY);

-- =====================================
-- 8. EXTRA PRACTICE QUERIES
-- =====================================

-- Extract month
SELECT 
    OrderID,
    MONTH(OrderDate) AS OrderMonth
FROM Orders;

-- Orders in current month
SELECT *
FROM Orders
WHERE MONTH(OrderDate) = MONTH(NOW())
AND YEAR(OrderDate) = YEAR(NOW());

-- Day name of order
SELECT 
    OrderID,
    DAYNAME(OrderDate) AS DayName
FROM Orders;

-- Last day of current month
SELECT LAST_DAY(NOW()) AS LastDayOfMonth;