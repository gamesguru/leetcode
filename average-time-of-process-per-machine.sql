SELECT
  Activity.machine_id,
  round((e.end_total - s.start_total) / 2, 3) AS processing_time
  -- round(sum(timestamp), 3) AS processing_time
  -- round(sum(timestamp) / count(*), 3) AS processing_time
FROM
  Activity,
  (select machine_id, sum(timestamp) as start_total from Activity where activity_type='start' group by machine_id) as s,
  (select machine_id, sum(timestamp) as end_total from Activity where activity_type='end' group by machine_id) as e
WHERE
  s.machine_id = Activity.machine_id
  AND e.machine_id = Activity.machine_id
GROUP BY
  machine_id;

  -- (SELECT machine_id, sum(timestamp) as sum_starts FROM Activity WHERE activity_type='start' AND machine_id=Activity.machine_id) x;

-- Difficulty: easy

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

-- Test case 2:
| machine_id | process_id | activity_type | timestamp |
| ---------- | ---------- | ------------- | --------- |
| 4          | 0          | end           | 98.227    |
| 0          | 0          | start         | 89.478    |
| 2          | 0          | start         | 4.06      |
| 4          | 0          | start         | 35.617    |
| 0          | 0          | end           | 93.686    |
| 1          | 0          | end           | 97.821    |
| 1          | 0          | start         | 73.793    |
| 3          | 0          | end           | 85.537    |
| 3          | 0          | start         | 35.138    |
| 2          | 0          | end           | 48.225    |
| 5          | 0          | start         | 22.284    |
| 5          | 0          | end           | 53.926    |
