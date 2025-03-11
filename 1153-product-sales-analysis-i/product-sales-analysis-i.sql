# Write your MySQL query statement below
select product_name, year, price from Sales S left join Product P using (product_id)