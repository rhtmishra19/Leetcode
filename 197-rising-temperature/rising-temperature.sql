# Write your MySQL query statement below
-- with cte as 
-- (select *, lead(temperature,1,0)over(order by recordDate) as lea from weather)
-- select * from cte where (lea - temperature) <0

-- with tmp as (
-- select id ,RecordDate,Temperature,
-- LAG (Temperature,1) OVER (ORDER BY RecordDate) AS prev_Temperature,
-- LAG (RecordDate,1) OVER (ORDER BY RecordDate) AS prev_RecordDate
-- from Weather)

-- select id from tmp where Temperature>prev_Temperature and (RecordDate-prev_RecordDate)=1


-- select id, recordDate, temperature, Lag(temperature,1,0) over(order by recorddate) 
--     from Weather
--         where Lag(temperature,1,0) over(order by recorddate) > temperature


-- SELECT id, recordDate, temperature, prev_temperature
-- FROM (
--     SELECT 
--         id, 
--         recordDate, 
--         temperature, 
--         LAG(temperature, 1, 0) OVER (ORDER BY recordDate) AS prev_temperature
--     FROM Weather
-- ) 
-- WHERE prev_temperature > temperature;

SELECT today.id
FROM Weather yesterday 
CROSS JOIN Weather today

WHERE DATEDIFF(today.recordDate,yesterday.recordDate) = 1
    AND today.temperature > yesterday.temperature