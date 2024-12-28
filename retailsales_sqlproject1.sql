set sql_safe_updates=0;


-- datacleaning--
delete from retailsales
where 
transaction_id is null
or sale_date is null
or sale_time is null
or customer_id is null
or gender is null
or age is null
or category is null
or quantiy is null
or price_per_unit is null
or cogs is null
or total_sale is null;



-- data exploration--

-- how many sales we have
select count(*) as total_sale from retailsales;

-- how many customer we have--
select count(distinct customer_id) as total_coustomers from retailsales;

-- how many category we have and what are they--
select count(distinct category) as total_category from retailsales;
select distinct category  from retailsales;

-- data analyze---
-- 1 sales made on 2022-11-05

select * 
from retailsales
where sale_date ="2022-11-05";

--  Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' 
 -- and the quantity sold is more than 4 in the month of Nov-2022
 
 select * from retailsales
 where category="clothing" and sale_date like "2022-11%" and quantiy>=4;
 
 -- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
 select category,sum(total_sale)as total_sale,count(category) from retailsales
 group by category;


-- Q.4 Write a SQL query to find the average age of customers
-- who purchased items from the 'Beauty' category.

select round(avg(age),2) as average_age
from retailsales
where category="Beauty";

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * from retailsales
where total_sale>1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

select gender,category,count(transaction_id) as totalno_sales
from retailsales
group by category,gender;

-- Q.7 Write a SQL query to calculate the average sale for each month. 
-- Find out best selling month in each year

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

select customer_id,sum(total_sale) as p
from retailsales
group by customer_id
order by p desc
limit 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select count(distinct(customer_id)),category
from retailsales 
group by category;


-- Q.10 Write a SQL query to create each shift and number of orders 
-- (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

select * from retailsales;






