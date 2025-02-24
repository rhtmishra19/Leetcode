with Cte1 as (
select player_id, min(event_date) as first_login_date from activity group by player_id),
Cte2 as (
select player_id, DATE_SUB(event_date, INTERVAL 1 DAY) AS day_before_each_event_day from activity)
select round(count(*)*1/(select count(distinct player_id) from activity),2) as fraction
from Cte1 join Cte2 using(player_id) 
where first_login_date = day_before_each_event_day;
