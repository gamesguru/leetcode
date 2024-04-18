-- Difficulty: medium

SELECT
  -- x.managerId
  e2.name
FROM (
  SELECT
    managerId,
    count(managerId) AS n_emps
  FROM
    Employee
  GROUP BY
    managerId) x
  INNER JOIN Employee e2 ON x.managerId = e2.id
WHERE
  x.n_emps >= 5;

-- Test case 10/11
-- | id  | name  | department | managerId |
-- | --- | ----- | ---------- | --------- |
-- | 101 | John  | A          | null      |
-- | 102 | Dan   | A          | 100       |
-- | 103 | James | A          | 100       |
-- | 104 | Amy   | A          | 100       |
-- | 105 | Anne  | A          | 100       |
-- | 106 | Ron   | B          | 100       |

-- output
-- | name |
-- | ---- |
-- | null |

-- expected
-- | name |
-- | ---- |

-- Test case 1
-- Create table If Not Exists Employee (id int, name varchar(255), department varchar(255), managerId int);
-- Truncate table Employee;
-- insert into Employee (id, name, department, managerId) values ('101', 'John', 'A', 'None');
-- insert into Employee (id, name, department, managerId) values ('102', 'Dan', 'A', '101');
-- insert into Employee (id, name, department, managerId) values ('103', 'James', 'A', '101');
-- insert into Employee (id, name, department, managerId) values ('104', 'Amy', 'A', '101');
-- insert into Employee (id, name, department, managerId) values ('105', 'Anne', 'A', '101');
-- insert into Employee (id, name, department, managerId) values ('106', 'Ron', 'B', '101');
