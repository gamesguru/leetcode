SELECT
  department.name AS Department,
  employee.name AS Employee,
  salary AS Salary
FROM
  employee
  JOIN department ON department.id = employee.departmentId
WHERE
  salary IN (
    SELECT
      salary
    FROM ( SELECT DISTINCT
        salary
      FROM
        employee
      WHERE
        departmentId = department.id
      ORDER BY
        salary DESC
      LIMIT 3) x);

-- TODO: improve on sub-query approach

-- Runtime 1868 ms
-- Beats 52.09% of users with MySQL
-- Runtime 547 ms
-- Beats 62.14% of users with PostgreSQL
