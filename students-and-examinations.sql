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
  JOIN Students ON Subjects.subject_name = Subjects.subject_name
  LEFT OUTER JOIN Examinations ON Examinations.subject_name = Subjects.subject_name
  OR Examinations.subject_name IS NULL
GROUP BY
  student_id,
  student_name,
  subject_name
ORDER BY
  student_id,
  subject_name;

-- Test case 13/14
-- | student_id | student_name |
-- | ---------- | ------------ |
-- | 54         | Jonathan     |
-- | 72         | Khaled       |
-- | 58         | Annabelle    |
-- | 97         | Stefan       |
-- | 28         | Tatiana      |
-- | 23         | Winston      |
-- | 26         | Alex         |
-- | 17         | Luis         |

-- | subject_name   |
-- | -------------- |
-- | DeepLearning   |
-- | DataStructures |
-- | Math           |

-- | student_id | subject_name   |
-- | ---------- | -------------- |
-- | 97         | DataStructures |
-- | 58         | DeepLearning   |
-- | 17         | DeepLearning   |

-- output
-- | student_id | student_name | subject_name   | attended_exams |
-- | ---------- | ------------ | -------------- | -------------- |
-- | 17         | Luis         | DataStructures | 0              |
-- | 17         | Luis         | DeepLearning   | 1              |
-- | 23         | Winston      | DataStructures | 0              |
-- | 23         | Winston      | DeepLearning   | 0              |
-- | 26         | Alex         | DataStructures | 0              |
-- | 26         | Alex         | DeepLearning   | 0              |
-- | 28         | Tatiana      | DataStructures | 0              |
-- | 28         | Tatiana      | DeepLearning   | 0              |
-- | 54         | Jonathan     | DataStructures | 0              |
-- | 54         | Jonathan     | DeepLearning   | 0              |
-- | 58         | Annabelle    | DataStructures | 0              |
-- | 58         | Annabelle    | DeepLearning   | 1              |
-- | 72         | Khaled       | DataStructures | 0              |
-- | 72         | Khaled       | DeepLearning   | 0       ...

-- expected
-- | student_id | student_name | subject_name   | attended_exams |
-- | ---------- | ------------ | -------------- | -------------- |
-- | 17         | Luis         | DataStructures | 0              |
-- | 17         | Luis         | DeepLearning   | 1              |
-- | 17         | Luis         | Math           | 0              |
-- | 23         | Winston      | DataStructures | 0              |
-- | 23         | Winston      | DeepLearning   | 0              |
-- | 23         | Winston      | Math           | 0              |
-- | 26         | Alex         | DataStructures | 0              |
-- | 26         | Alex         | DeepLearning   | 0              |
-- | 26         | Alex         | Math           | 0              |
-- | 28         | Tatiana      | DataStructures | 0              |
-- | 28         | Tatiana      | DeepLearning   | 0              |
-- | 28         | Tatiana      | Math           | 0              |
-- | 54         | Jonathan     | DataStructures | 0              |
-- | 54         | Jonathan     | DeepLearning   | 0       ...

-- Test case 2
-- | student_id | student_name |
-- | ---------- | ------------ |

-- | subject_name |
-- | ------------ |
-- | Math         |

-- | student_id | subject_name |
-- | ---------- | ------------ |

-- output
-- | student_id | student_name | subject_name | attended_exams |
-- | ---------- | ------------ | ------------ | -------------- |
-- | null       | null         | Math         | 0              |

-- expected
-- | student_id | student_name | subject_name | attended_exams |
-- | ---------- | ------------ | ------------ | -------------- |

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
