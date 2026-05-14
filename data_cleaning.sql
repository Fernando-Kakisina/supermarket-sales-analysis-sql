-- Making a backup table
create table supermarket_sales as
select *
from supermarket_sales_raw;

-- Data Cleaning --

-- Rename column --

# row_id
alter table supermarket_sales
rename column `Row ID` to row_id;

# order_id
alter table supermarket_sales
rename column `Order ID` to order_id;

# order_date
alter table supermarket_sales
rename column `Order Date` to order_date;

# order_month
alter table supermarket_sales
rename column `Order Month` to order_month;

# ship_date
alter table supermarket_sales
rename column `Ship Date` to ship_date;

# ship_day
alter table supermarket_sales
rename column `Ship Day` to shipping_day;

# shipping_days
alter table supermarket_sales
rename column `Ship Days` to shipping_days;

# ship_mode
alter table supermarket_sales
rename column `Ship Mode` to ship_mode;

# customer_id
alter table supermarket_sales
rename column `Customer ID` to customer_id;

# customer_name
alter table supermarket_sales
rename column `Customer Name` to customer_name;

# segment
alter table supermarket_sales
rename column `Segment` to segment;

# country
alter table supermarket_sales
rename column `Country` to country;

# city
alter table supermarket_sales
rename column `City` to city;

# state
alter table supermarket_sales
rename column `State` to state;

# postal_code
alter table supermarket_sales
rename column `Postal Code` to postal_code;

# region
alter table supermarket_sales
rename column `Region` to region;

# product_id
alter table supermarket_sales
rename column `Product ID` to product_id;

# category
alter table supermarket_sales
rename column `Category` to category;

# sub_category
alter table supermarket_sales
rename column `Sub-Category` to sub_category;

# product_name
alter table supermarket_sales
rename column `Product Name` to product_name;

# sales
alter table supermarket_sales
rename column `Sales` to sales;

select * from supermarket_sales ss limit 10;

-- data type changes

# order_date

-- order_date int to date simulation
select
	order_date,
	date_add('1899-12-30', interval order_date day) as converted_order_date
from supermarket_sales
limit 10
;

-- order_date convert to varchar
alter table supermarket_sales 
modify column order_date varchar(20);

-- convert number/int from csv into date
update supermarket_sales
set order_date = DATE_ADD('1899-12-30', interval order_date day);

-- int to date convert
alter table supermarket_sales 
modify column order_date date;

# ship_date

-- ship_date int to date simulation
select
	ship_date,
	date_add('1899-12-30', interval ship_date day) as converted_ship_date
from supermarket_sales
limit 10
;

-- ship_date to varchar convert
alter table supermarket_sales 
modify column ship_date varchar(20);

-- convert number/int from csv into date
update supermarket_sales
set ship_date = DATE_ADD('1899-12-30', interval ship_date day);

-- int to date convert
alter table supermarket_sales 
modify column ship_date date;

# postal_code
alter table supermarket_sales
modify column postal_code varchar(10);

# sales

-- convert ',' to '.'
update supermarket_sales
set sales = REPLACE(REPLACE(sales, '', ''), ',', '.');

-- varchar to decimal convert
alter table supermarket_sales
modify column sales decimal(10,2);

select * from supermarket_sales limit 30;

# null value checking

select
	count(*) as total_rows,
	sum(order_date is null) as null_order_date,
	sum(sales is null) as null_sales,
	sum(customer_id is null) as null_customer_id
from supermarket_sales;

# duplicate checking

-- order_id
select order_id, count(*)
from supermarket_sales
group by order_id
having count(*) > 1;


-- order_id, product_name, dan sales
select
	order_id, 
	product_name, 
	sales,
	count(*) as total_duplicate
from supermarket_sales
group by 
	order_id,
	product_name,
	sales
having count(*) > 1;

-- detail check for a possible data error
select *
from supermarket_sales
where order_id = "US-2015-150119";

# hidden space checking

-- hidden space
SELECT
    SUM(city <> TRIM(city)) AS city_issue,
    SUM(state <> TRIM(state)) AS state_issue,
    SUM(category <> TRIM(category)) AS category_issue,
    SUM(sub_category <> TRIM(sub_category)) AS sub_category_issue,
    SUM(segment <> TRIM(segment)) AS segment_issue,
    SUM(customer_name <> TRIM(customer_name)) AS customer_issue,
    SUM(product_name <> TRIM(product_name)) AS product_issue
FROM supermarket_sales;

# negative value check
select *
from supermarket_sales
where
	sales < 0
	or shipping_days < 0
	or sales < 0;

# outlier check
select 
	MIN(sales) as min_sales,
	MAX(sales) as max_sales,
	MIN(shipping_days) as min_shipping_days,
	MAX(shipping_days) as max_shipping_days
from supermarket_sales;













