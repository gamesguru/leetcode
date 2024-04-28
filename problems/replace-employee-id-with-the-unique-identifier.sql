select unique_id, name from employees left join employeeUNI on employees.id=employeeUNI.id

-- Difficulty: easy
-- Runtime 2098ms
-- Beats 74.20% of users with MySQL
