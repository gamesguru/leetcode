-- SELECT
--   Students.student_id,
--   Students.student_name,
--   Examinations.subject_name,
--   COUNT(Examinations.student_id) AS attended_exams
-- FROM
--   Students
--   -- LEFT JOIN Subjects ON Subjects.subject_name = Examinations.subject_name
--   JOIN Examinations ON Examinations.student_id = Students.student_id
-- GROUP BY
--   student_id,
--   student_name,
--   subject_name
-- ORDER BY
--   student_id,
--   subject_name;

SELECT
  Students.student_id,
  Students.student_name,
  Subjects.subject_name,
  (
    SELECT
      COUNT(Examinations.student_id) AS c
    FROM
      Examinations
    WHERE
      Students.student_id = Examinations.student_id
      AND Subjects.subject_name = Examinations.subject_name) AS attended_exams
FROM
  Subjects
  LEFT JOIN Examinations ON Examinations.subject_name = Subjects.subject_name
  LEFT JOIN Students ON Subjects.subject_name = Examinations.subject_name
GROUP BY
  student_id,
  student_name,
  subject_name
ORDER BY
  student_id,
  subject_name;

-- Test case 1
-- Create table If Not Exists Students (student_id int, student_name varchar(20));
-- Create table If Not Exists Subjects (subject_name varchar(20));
-- Create table If Not Exists Examinations (student_id int, subject_name varchar(20));
-- Truncate table Students;
-- insert into Students (student_id, student_name) values ('1', 'Alice');
-- insert into Students (student_id, student_name) values ('2', 'Bob');
-- insert into Students (student_id, student_name) values ('13', 'John');
-- insert into Students (student_id, student_name) values ('6', 'Alex');
-- Truncate table Subjects;
-- insert into Subjects (subject_name) values ('Math');
-- insert into Subjects (subject_name) values ('Physics');
-- insert into Subjects (subject_name) values ('Programming');
-- Truncate table Examinations;
-- insert into Examinations (student_id, subject_name) values ('1', 'Math');
-- insert into Examinations (student_id, subject_name) values ('1', 'Physics');
-- insert into Examinations (student_id, subject_name) values ('1', 'Programming');
-- insert into Examinations (student_id, subject_name) values ('2', 'Programming');
-- insert into Examinations (student_id, subject_name) values ('1', 'Physics');
-- insert into Examinations (student_id, subject_name) values ('1', 'Math');
-- insert into Examinations (student_id, subject_name) values ('13', 'Math');
-- insert into Examinations (student_id, subject_name) values ('13', 'Programming');
-- insert into Examinations (student_id, subject_name) values ('13', 'Physics');
-- insert into Examinations (student_id, subject_name) values ('2', 'Math');
-- insert into Examinations (student_id, subject_name) values ('1', 'Math');
