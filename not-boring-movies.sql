-- Difficulty: easy
-- Category: Aggregates

Select * From Cinema 
Where MOD(id, 2) = 1 AND description!='boring'
Order By rating Desc;

-- Runtime 388 ms
-- Beats 93.24% of users with MySQL