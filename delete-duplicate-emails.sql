-- DELETE FROM Person WHERE id NOT IN (
--     SELECT id FROM (SELECT id FROM Person GROUP BY Email) x
-- );
-- SELECT DISTINCT email FROM Person;

DELETE FROM Person WHERE id NOT IN (
    SELECT min_id FROM (SELECT min(id) as min_id FROM Person GROUP BY Email) x
);

-- Runtime 1024 ms
-- Beats 95.45% of users with MySQL
