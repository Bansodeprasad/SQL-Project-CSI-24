-- Create tables for demonstration purposes
CREATE TABLE Employees (
  EmployeeID INT PRIMARY KEY,
  Name VARCHAR(255),
  DepartmentID INT,
  Salary DECIMAL(10, 2)
);

CREATE TABLE Departments (
  DepartmentID INT PRIMARY KEY,
  Name VARCHAR(255)
);

-- Insert sample data
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary)
VALUES
  (1, 'John Doe', 1, 60000.00),
  (2, 'Jane Smith', 1, 70000.00),
  (3, 'Alice Johnson', 1, 65000.00),
  (4, 'Bob Brown', 1, 75000.00),
  (5, 'Charlie Wilson', 1, 80000.00),
  (6, 'Eva Lee', 2, 70000.00),
  (7, 'Michael Clark', 2, 75000.00),
  (8, 'Sarah Davis', 2, 80000.00),
  (9, 'Ryan Harris', 2, 85000.00),
  (10, 'Emily White', 2, 90000.00),
  (11, 'David Martinez', 3, 95000.00),
  (12, 'Jessica Taylor', 3, 100000.00),
  (13, 'William Rodriguez', 3, 105000.00);

INSERT INTO Departments (DepartmentID, Name)
VALUES
  (1, 'Marketing'),
  (2, 'Research'),
  (3, 'Development');

-- Calculate overall average salary
WITH overall_avg_salary AS (
  SELECT AVG(Salary) AS overall_avg
  FROM Employees
),
-- Calculate departmental average salary and employee count
departmental_avg_salary AS (
  SELECT D.Name AS DepartmentName, AVG(E.Salary) AS AverageSalary, COUNT(E.EmployeeID) AS NumberOfEmployees
  FROM Employees E
  JOIN Departments D ON E.DepartmentID = D.DepartmentID
  GROUP BY D.Name
)
-- Filter departments where average salary surpasses overall average
SELECT *
FROM departmental_avg_salary
WHERE AverageSalary > (SELECT overall_avg FROM overall_avg_salary);