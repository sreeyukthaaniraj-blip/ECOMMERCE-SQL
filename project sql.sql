create database company
create table customers (customer_id int primary key,customer_name varchar(100),gender varchar(50),city varchar(50),state varchar(50))
create table products (product_id int primary key,product_name varchar(50),category varchar(100),sub_category varchar(100),price decimal (10,2))
create table orders (order_id int primary key,customer_id int,order_date date,ship_date date,payment_method varchar(50),foreign key (customer_id) references customers(customer_id))
create table order_items (order_item_id int primary key,order_id int,product_id int,quantity int,sales_amount decimal(10,2),profil decimal (10,2),foreign key (order_id) references orders(order_id),foreign key (product_id) references products(product_id))
alter table order_items rename column profil to profit
desc customers
delete from customers 
set sql_safe_updates=0
select * from customers
drop table orders
alter table customer modify column customer_id varchar(20),modify column customer_name varchar(100),modify column gender varchar(20),modify column city varchar(50),modify column state varchar(50)
select * from customer
desc customer
alter table customer add primary key(customer_id)
use company
select * from products
desc products
alter table products modify column product_id varchar(120) primary key,modify column product_name varchar(150),modify column category varchar(100),modify column sub_category varchar(100),modify column price decimal(10,2)
desc orders
alter table orders modify column order_id varchar(120) primary key,modify column customer_id varchar(150),modify column order_date date ,modify column ship_date date ,modify column payment_method varchar(50)
select * from orders
alter table orders add foreign key (customer_id) references customer(customer_id)
select * from order_items
desc order_items
alter table order_items modify column order_item_id int primary key,modify column order_id varchar(50),modify column product_id varchar(50) ,modify column quantity int ,modify column sales_amount decimal(10,2),modify column profit decimal(10,2)
alter table order_items add foreign key (order_id) references orders(order_id)
alter table order_items add foreign key (product_id) references products(product_id)
select sum(sales_amount) as total_sales from order_items
select count(customer_id) as total_customer from customer
select count(order_id) as total_orders from orders
select avg(sales_amount) as avg_sales_amount from order_items
select min(sales_amount) as min_sales_amount from order_items
select max(sales_amount) as max_sales_amount from order_items
select products.category,sum(order_items.sales_amount) as total_sales from order_items join products on order_items.product_id=products.product_id group by products.category order by total_sales desc
select customer.state,sum(order_items.profit) as total_profit from order_items join orders on order_items.order_id=orders.order_id join customer on orders.customer_id=customer.customer_id group by customer.state order by total_profit desc
select customer.state,count(orders.order_id) as total_orders from orders join customer on orders.customer_id=customer.customer_id group by customer.state order by total_orders desc
SELECT customer.customer_id,customer.customer_name,SUM(order_items.sales_amount) AS total_spent FROM order_items JOIN orders ON order_items.order_id = orders.order_id JOIN customer ON orders.customer_id = customer.customer_id GROUP BY customer.customer_id, customer.customer_name ORDER BY total_spent DESC LIMIT 5;
SELECT products.category,SUM(order_items.profit) AS total_profit FROM order_items join products ON order_items.product_id = products.product_id GROUP BY products.category ORDER BY total_profit ASC;
SELECT customer.customer_id,customer.customer_name,orders.order_id,orders.order_date,products.product_id,products.product_name,products.category,order_items.quantity,order_items.sales_amount,order_items.profit FROM order_items JOIN orders ON order_items.order_id = orders.order_id JOIN customer ON orders.customer_id = customer.customer_id JOIN products ON order_items.product_id = products.product_id
SELECT customer.state AS region,products.product_id,products.product_name,SUM(order_items.quantity) AS total_quantity_sold FROM order_items INNER JOIN products ON order_items.product_id = products.product_id INNER JOIN orders ON order_items.order_id = orders.order_id INNER JOIN customer ON orders.customer_id = customer.customer_id GROUP BY customer.state, products.product_id, products.product_name ORDER BY region ASC, total_quantity_sold desc
SELECT customer.customer_id,customer.customer_name,SUM(order_items.sales_amount) AS total_purchase, CASE WHEN SUM(order_items.sales_amount) >= 5000 THEN 'High Value' WHEN SUM(order_items.sales_amount) >= 1500 AND SUM(order_items.sales_amount) < 5000 THEN 'Medium Value' ELSE 'Low Value' END AS customer_class FROM customer JOIN orders ON customer.customer_id = orders.customer_id JOIN order_items ON orders.order_id = order_items.order_id GROUP BY customer.customer_id, customer.customer_name;
SELECT products.product_id,products.product_name,SUM(order_items.profit) AS total_profit, CASE WHEN SUM(order_items.profit) > 1000 THEN 'High Profit'WHEN SUM(order_items.profit) BETWEEN 0 AND 1000 THEN 'Low Profit' ELSE 'Loss' END AS product_class FROM products JOIN order_items ON products.product_id = order_items.product_id GROUP BY products.product_id, products.product_name
SELECT products.product_id, products.product_name, SUM(order_items.sales_amount) AS total_product_sales FROM products JOIN order_items ON products.product_id = order_items.product_id GROUP BY products.product_id, products.product_name HAVING SUM(order_items.sales_amount) > (SELECT AVG(total_sales) FROM (SELECT SUM(sales_amount) AS total_sales FROM order_items GROUP BY product_id ) AS product_sums)
SELECT products.product_id, products.product_name, SUM(order_items.sales_amount) AS total_product_sales FROM products JOIN order_items ON products.product_id = order_items.product_id GROUP BY products.product_id, products.product_name HAVING SUM(order_items.sales_amount) > (SELECT AVG(total_sales) FROM (SELECT SUM(sales_amount) AS total_sales FROM order_items  GROUP BY product_id ) AS product_sums )
SELECT products.product_id, products.product_name, SUM(order_items.sales_amount) AS total_sales FROM products JOIN order_items ON products.product_id = order_items.product_id GROUP BY products.product_id, products.product_name ORDER BY total_sales DESC LIMIT 1, 1;
SELECT customer.customer_id,customer.customer_name,SUM(order_items.sales_amount) AS total_sales, RANK() OVER (ORDER BY SUM(order_items.sales_amount) DESC) AS customer_rank FROM customer JOIN orders ON customer.customer_id = orders.customer_id JOIN order_items ON orders.order_id = order_items.order_id GROUP BY customer.customer_id, customer.customer_name
SELECT category,product_id,product_name,total_sales,product_rank FROM (SELECT products.category, products.product_id, products.product_name, SUM(order_items.sales_amount) AS total_sales, DENSE_RANK() OVER ( PARTITION BY products.category ORDER BY SUM(order_items.sales_amount) DESC) AS product_rank FROM products JOIN order_items ON products.product_id = order_items.product_id GROUP BY products.category, products.product_id, products.product_name ) AS RankedProducts WHERE product_rank <= 3
SELECT orders.order_date,order_items.order_id,order_items.sales_amount, SUM(order_items.sales_amount) OVER ( ORDER BY orders.order_date, order_items.order_id ) AS running_total_sales FROM orders JOIN order_items ON orders.order_id = order_items.order_id
