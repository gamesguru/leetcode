select id from weather where (select from (lag(temperature, 1) over(order by id))) < temperature
