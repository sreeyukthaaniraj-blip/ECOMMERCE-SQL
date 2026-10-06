Sales & Customer Analysis Using MySQL

📌 Project Overview

This project is a SQL-based sales analysis project developed using MySQL. The main objective is to create a relational sales database and perform business analysis using SQL queries.

The project analyzes customers, products, orders, sales, profit, and regional performance to generate useful business insights.

🗄️ Database Structure

The project uses four main tables:

1. Customers

Contains customer-related information:

- Customer ID
- Customer Name
- Gender
- City
- State

2. Products

Contains product information:

- Product ID
- Product Name
- Category
- Sub-category
- Price

3. Orders

Contains order information:

- Order ID
- Customer ID
- Order Date
- Ship Date
- Payment Method

4. Order Items

Contains individual order details:

- Order Item ID
- Order ID
- Product ID
- Quantity
- Sales Amount
- Profit

Primary keys and foreign keys are used to establish relationships between the tables.

🛠️ Tools & Technologies

- MySQL
- SQL
- MySQL Workbench

🔍 SQL Concepts Used

The project demonstrates:

- Database and table creation
- Primary Keys
- Foreign Keys
- ALTER TABLE
- Data type modification
- DELETE and DROP operations
- SELECT statements
- INNER JOIN
- GROUP BY
- ORDER BY
- Aggregate functions such as "SUM()" and "COUNT()"
- "HAVING"
- Subqueries
- "CASE WHEN"
- Window functions
- "RANK()"
- "DENSE_RANK()"
- Running totals

📊 Analysis Performed

The project answers several business questions, including:

1. Which product categories generate the highest sales?
2. Which states generate the highest profit?
3. Which states have the highest number of orders?
4. Who are the top customers based on total spending?
5. Which product categories are most and least profitable?
6. Which customers belong to High, Medium, and Low Value segments?
7. Which products generate high profit or losses?
8. Which products perform above the average sales level?
9. What is the second-highest selling product?
10. How are customers ranked according to their sales?
11. What are the top three products in each category?
12. What is the running total of sales over time?

📈 Key Results

- Total Revenue: $7,183.24
- Total Orders: 22
- Highest Sales Category: Furniture
- Furniture Revenue: $3,706.52
- Furniture Profit: -$22.06
- Most Profitable Category: Technology
- Technology Profit: $175.09
- Highest Order Volume: California – 5 orders
- Most Profitable State: Wisconsin – $90.72
- Top Customer: Ken Black
- Top Customer Sales: $1,706.18

💡 Business Insights

The analysis shows that high sales do not always result in high profitability. Furniture generated the highest revenue but operated at a net loss. Technology, despite not being the highest-selling category, generated the highest profit.

The state-level analysis also shows that order volume and profitability can differ significantly. California had the highest number of orders, while Wisconsin generated the highest profit.

These findings can help a business identify profitable categories, high-value customers, and areas where sales strategies or cost management need improvement.

🎯 Project Objective

The main objective of this project is to demonstrate the ability to use SQL to:

- Design a relational database
- Manage and manipulate structured data
- Combine data from multiple tables
- Perform sales and customer analysis
- Apply advanced SQL techniques
- Generate meaningful business insights from data

👩‍💻 Author

Sreeyuktha K.

Project: Sales & Customer Analysis Using MySQL
