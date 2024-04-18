-- Difficulty: medium

-- select name from Employee where (select count(managerId) from Employee where id = managerId) IS NULL;

-- SELECT
--   e1.id,
--   e1.name,
--   e1.managerId,
--   (select count(id) as n_emp from Employee where e1.managerId = Employee.id) x
-- --   x.n_emp
-- FROM
--   Employee e1
-- -- LEFT JOIN Employee e2 on e1.id=e2.managerId
-- -- WHERE
-- --   x.n_emp >= 0
-- GROUP BY
--   id,
--   name,
-- --   x.n_emp,
--   managerId;

SELECT
  e1.id,
  e1.name,
  e2.managerId
--   x.n_emp
FROM
  Employee e1
-- LEFT JOIN Employee e2 on e1.id=e2.managerId
-- WHERE
--   x.n_emp >= 0
LEFT OUTER JOIN Employee e2 ON e1.id = e2.managerId
--   AND count(e2.managerId) > 4
GROUP BY
  id,
  name,
--   x.n_emp,
  managerId;

-- select count(id) from Employee where managerId = 101;

-- Test case 1
-- Create table If Not Exists Employee (id int, name varchar(255), department varchar(255), managerId int);
-- Truncate table Employee;
-- insert into Employee (id, name, department, managerId) values ('101', 'John', 'A', 'None');
-- insert into Employee (id, name, department, managerId) values ('102', 'Dan', 'A', '101');
-- insert into Employee (id, name, department, managerId) values ('103', 'James', 'A', '101');
-- insert into Employee (id, name, department, managerId) values ('104', 'Amy', 'A', '101');
-- insert into Employee (id, name, department, managerId) values ('105', 'Anne', 'A', '101');
-- insert into Employee (id, name, department, managerId) values ('106', 'Ron', 'B', '101');
