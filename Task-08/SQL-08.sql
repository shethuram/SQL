-- Non recursive CTE to count the number of employees under each manager

WITH ManagerCount AS (
    SELECT ManagerID, COUNT(*) AS total
    FROM Employees
    WHERE ManagerID IS NOT NULL
    GROUP BY ManagerID
)
SELECT e.FirstName || ' ' || e.LastName AS ManagerName,
       mc.total
FROM ManagerCount mc
JOIN Employees e ON mc.ManagerID = e.EmployeeID;

-- Recursive CTE to get the hierarchy of employees and their levels in the organization

WITH RECURSIVE cteHierarchy AS (
    SELECT EmployeeID, FirstName, LastName, ManagerID, 1 AS level
    FROM Employees
    WHERE ManagerID IS NULL

    UNION ALL

    SELECT e.EmployeeID, e.FirstName, e.LastName, e.ManagerID, h.level + 1
    FROM Employees e
    JOIN cteHierarchy h ON e.ManagerID = h.EmployeeID
)
SELECT FirstName || ' ' || LastName AS FullName, level
FROM cteHierarchy;

-- cycle detection in recursive CTE to prevent infinite loops in case of circular references

WITH RECURSIVE cteHierarchy(EmployeeID, FirstName, LastName, ManagerID, level) AS (
    SELECT EmployeeID, FirstName, LastName, ManagerID, 1
    FROM Employees
    WHERE ManagerID IS NULL

    UNION ALL

    SELECT e.EmployeeID, e.FirstName, e.LastName, e.ManagerID, h.level + 1
    FROM Employees e
    JOIN cteHierarchy h ON e.ManagerID = h.EmployeeID
)
CYCLE EmployeeID SET is_cycle USING path

SELECT FirstName || ' ' || LastName AS FullName, level, ManagerID
FROM cteHierarchy
WHERE NOT is_cycle
ORDER BY level;