# Given a Weather table, write a SQL query to find all dates' Ids with higher 
# temperature compared to its previous (yesterday's) dates.
#+---------+------------+------------------+
#| Id(INT) | Date(DATE) | Temperature(INT) |
#+---------+------------+------------------+
#|       1 | 2015-01-01 |               10 |
#|       2 | 2015-01-02 |               25 |
#|       3 | 2015-01-03 |               20 |
#|       4 | 2015-01-04 |               30 |
#+---------+------------+------------------+

SELECT w2.Id
FROM Weather w1, Weather w2
WHERE TO_DAYS(w2.Date) = 1 + TO_DAYS(w1.Date)
AND w2.Temperature > w1.Temperature;