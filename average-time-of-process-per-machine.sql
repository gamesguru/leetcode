-- Difficulty: easy

-- SELECT
--   a.machine_id,
--   round(avg(b.timestamp - a.timestamp), 3) AS processing_time
-- FROM
--   Activity a,
--   Activity b
-- WHERE
--   a.machine_id = b.machine_id
--   AND a.process_id = b.process_id
--   AND a.activity_type = 'start'
--   AND b.activity_type = 'end'
-- GROUP BY
--   machine_id;

-- Runtime 456 ms
-- Beats 52.12% of users with MySQL

SELECT
  machine_id,
  round(avg(
      CASE WHEN activity_type = 'start' THEN
        timestamp * -1
      ELSE
        timestamp
      END) * 2, 3) AS processing_time
FROM
  Activity
GROUP BY
  machine_id;

-- Runtime 395ms
-- Beats 78.69% of users with MySQL

-- Test case 3
-- | machine_id | process_id | activity_type | timestamp |
-- | ---------- | ---------- | ------------- | --------- |
-- | 0          | 0          | start         | 0.712     |
-- | 0          | 0          | end           | 1.52      |
-- | 0          | 1          | start         | 3.14      |
-- | 0          | 1          | end           | 4.12      |
-- | 1          | 0          | start         | 0.55      |
-- | 1          | 0          | end           | 1.55      |
-- | 1          | 1          | start         | 0.43      |
-- | 1          | 1          | end           | 1.42      |
-- | 2          | 0          | start         | 4.1       |
-- | 2          | 0          | end           | 4.512     |
-- | 2          | 1          | start         | 2.5       |
-- | 2          | 1          | end           | 5         |

-- Test case 2
-- | machine_id | process_id | activity_type | timestamp |
-- | ---------- | ---------- | ------------- | --------- |
-- | 4          | 0          | end           | 98.227    |
-- | 0          | 0          | start         | 89.478    |
-- | 2          | 0          | start         | 4.06      |
-- | 4          | 0          | start         | 35.617    |
-- | 0          | 0          | end           | 93.686    |
-- | 1          | 0          | end           | 97.821    |
-- | 1          | 0          | start         | 73.793    |
-- | 3          | 0          | end           | 85.537    |
-- | 3          | 0          | start         | 35.138    |
-- | 2          | 0          | end           | 48.225    |
-- | 5          | 0          | start         | 22.284    |
-- | 5          | 0          | end           | 53.926    |

-- Test case 1:
Create table If Not Exists Activity (machine_id int, process_id int, activity_type ENUM('start', 'end'), timestamp float);
Truncate table Activity;
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('0', '0', 'start', '0.712');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('0', '0', 'end', '1.52');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('0', '1', 'start', '3.14');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('0', '1', 'end', '4.12');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('1', '0', 'start', '0.55');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('1', '0', 'end', '1.55');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('1', '1', 'start', '0.43');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('1', '1', 'end', '1.42');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('2', '0', 'start', '4.1');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('2', '0', 'end', '4.512');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('2', '1', 'start', '2.5');
insert into Activity (machine_id, process_id, activity_type, timestamp) values ('2', '1', 'end', '5');
