SELECT
  id
FROM (
  SELECT
    id,
    temperature,
    lag(temperature, 1) OVER (ORDER BY recordDate) AS temp_prev,
    recordDate,
    lag(recordDate, 1) OVER (ORDER BY recordDate) AS date_prev
  FROM
    Weather) x
WHERE
  x.temperature > x.temp_prev
  AND recordDate = (SELECT date_add(x.date_prev, INTERVAL 1 DAY));

-- Test case 7/14
Create table If Not Exists Weather (id int, recordDate date, temperature int);
Truncate table Weather;
insert into Weather (id, recordDate, temperature) values ('1', '2000-12-16', '3');
insert into Weather (id, recordDate, temperature) values ('2', '2000-12-15', '-1');

-- Test case 12/14
Create table If Not Exists Weather (id int, recordDate date, temperature int);
Truncate table Weather;
insert into Weather (id, recordDate, temperature) values ('1', '2000-12-14', '3');
insert into Weather (id, recordDate, temperature) values ('2', '2000-12-16', '5');

-- https://databasetips.net/2019/02/12/lead-and-lag-accessing-multiple-rows-without-self-join/

-- Difficulty: easy
-- Runtime 667 ms
-- Beats 92.86% of users with MySQL
