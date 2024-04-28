SELECT
  customer_id,
  count(visits.visit_id) AS count_no_trans
--   count(transactions.transaction_id) as n_trans
FROM
  visits
  LEFT OUTER JOIN transactions ON visits.visit_id = transactions.visit_id
WHERE
  transactions.visit_id is null
GROUP BY
  customer_id
ORDER BY
  count_no_trans ASC


-- https://stackoverflow.com/questions/1247361/get-the-inverse-of-a-join

-- Difficulty: easy
-- Runtime 2291 ms
-- Beats 82.49% of users with MySQL
