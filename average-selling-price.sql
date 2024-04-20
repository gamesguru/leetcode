-- Difficulty: easy

SELECT
  p.product_id,
  --   sum(units * price) AS total,
  round(IFNULL (sum(units * price) / sum(units), 0), 2) AS average_price
FROM
  UnitsSold u
  RIGHT JOIN Prices p ON (u.product_id = p.product_id
      OR u.product_id IS NULL)
    AND u.purchase_date >= p.start_date
    AND u.purchase_date <= p.end_date
GROUP BY
  p.product_id;


  

-- Test case 15/17
-- Prices
-- | product_id | start_date | end_date   | price |
-- | ---------- | ---------- | ---------- | ----- |
-- | 1          | 2019-02-17 | 2019-02-28 | 5     |
-- | 1          | 2019-03-01 | 2019-03-22 | 20    |
-- | 2          | 2019-02-01 | 2019-02-20 | 15    |
-- | 2          | 2019-02-21 | 2019-03-31 | 30    |
-- | 3          | 2019-02-21 | 2019-03-31 | 30    |

-- UnitsSold
-- | product_id | purchase_date | units |
-- | ---------- | ------------- | ----- |
-- | 1          | 2019-02-25    | 100   |
-- | 1          | 2019-03-01    | 15    |
-- | 2          | 2019-02-10    | 200   |
-- | 2          | 2019-03-22    | 30    |

-- Output
-- | product_id | average_price |
-- | ---------- | ------------- |
-- | 1          | 6.96          |
-- | 2          | 16.96         |

-- Expected
-- | product_id | average_price |
-- | ---------- | ------------- |
-- | 1          | 6.96          |
-- | 2          | 16.96         |
-- | 3          | 0             |




-- Test case 1
-- Create table If Not Exists Prices (product_id int, start_date date, end_date date, price int);
-- Create table If Not Exists UnitsSold (product_id int, purchase_date date, units int);
-- Truncate table Prices;
-- insert into Prices (product_id, start_date, end_date, price) values ('1', '2019-02-17', '2019-02-28', '5');
-- insert into Prices (product_id, start_date, end_date, price) values ('1', '2019-03-01', '2019-03-22', '20');
-- insert into Prices (product_id, start_date, end_date, price) values ('2', '2019-02-01', '2019-02-20', '15');
-- insert into Prices (product_id, start_date, end_date, price) values ('2', '2019-02-21', '2019-03-31', '30');
-- Truncate table UnitsSold;
-- insert into UnitsSold (product_id, purchase_date, units) values ('1', '2019-02-25', '100');
-- insert into UnitsSold (product_id, purchase_date, units) values ('1', '2019-03-01', '15');
-- insert into UnitsSold (product_id, purchase_date, units) values ('2', '2019-02-10', '200');
-- insert into UnitsSold (product_id, purchase_date, units) values ('2', '2019-03-22', '30');
