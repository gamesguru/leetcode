-- Difficulty: easy

WITH q_poor AS (
    SELECT
        q.query_name,
        count(q2.query_name) / count(q.query_name) AS poor_query_percentage
    FROM
        Queries q,
        Queries q2
    WHERE
        q.query_name = q2.query_name
    GROUP BY
        q.query_name
)

SELECT
  q.query_name,
  round(avg(q.rating / q.position), 2) AS quality,
  q_poor.poor_query_percentage AS poor_query_percentage
--   q_poor.query_name AS n_poor_queries,
--   q.query_name AS n_queries
--   count(q_poor.query_name) / count(q.query_name) AS poor_query_percentage
FROM
  Queries q,
  q_poor
--   Queries q_poor
-- WHERE
--   q_poor.rating < 3 AND q_poor.query_name = q.query_name
GROUP BY
  q.query_name,
  q_poor.query_name
;


-- Test case 1
-- Create table If Not Exists Queries (query_name varchar(30), result varchar(50), position int, rating int);
-- Truncate table Queries;
-- insert into Queries (query_name, result, position, rating) values ('Dog', 'Golden Retriever', '1', '5');
-- insert into Queries (query_name, result, position, rating) values ('Dog', 'German Shepherd', '2', '5');
-- insert into Queries (query_name, result, position, rating) values ('Dog', 'Mule', '200', '1');
-- insert into Queries (query_name, result, position, rating) values ('Cat', 'Shirazi', '5', '2');
-- insert into Queries (query_name, result, position, rating) values ('Cat', 'Siamese', '3', '3');
-- insert into Queries (query_name, result, position, rating) values ('Cat', 'Sphynx', '7', '4');