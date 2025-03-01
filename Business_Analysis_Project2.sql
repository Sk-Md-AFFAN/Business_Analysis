SELECT*FROM pizza_sales

SELECT DATENAME(WEEKDAY, order_date) AS day_name,SUM(total_price) AS total_sale_of_day
FROM pizza_sales
GROUP BY DATENAME(WEEKDAY, order_date)


SELECT DATENAME(WEEKDAY, order_date) AS week_day,order_date,DATEPART(HOUR, order_time) AS order_hour,pizza_name,quantity
FROM pizza_sales
GROUP BY order_date,DATENAME(WEEKDAY, order_date),DATEPART(HOUR, order_time),quantity,pizza_name
HAVING DATENAME(WEEKDAY, order_date)='Friday'


SELECT pizza_name,SUM(total_price) AS revenue_per_pizza
FROM pizza_sales
GROUP BY pizza_name


SELECT SUM(total_price) AS net_revenue, AVG(total_price) AS avg_order_value, SUM(quantity) AS total_pizza_ordered,AVG(unit_price) AS avg_pizza_price
FROM pizza_sales

-- Analysing data from  Friday Sales

SELECT order_date,DATENAME(WEEKDAY,order_date) AS week_day,DATEPART(HOUR,order_time) AS order_hour,SUM(quantity) AS total_orders,
SUM(
CASE 
WHEN pizza_size='L' THEN 4
WHEN pizza_size='M' THEN 2
WHEN pizza_size='S' THEN 1
ELSE 0
END) AS no_of_persons
FROM pizza_sales
GROUP BY order_date,DATENAME(WEEKDAY,order_date),DATEPART(HOUR,order_time)
HAVING DATENAME(WEEKDAY,order_date)='Friday'


SELECT pizza_size,SUM(total_price) AS sale_per_size
FROM pizza_sales
GROUP BY pizza_size

SELECT pizza_category,SUM(total_price) AS sale_per_category
FROM pizza_sales
GROUP BY pizza_category



