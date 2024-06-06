# Sales_Insights_Dashboard
Here is a data analysis project I completed using Tableau and SQL for a hardware company in India as part of my data science journey.

# About the Project
Completed a Data Analysis project for a hardware manufacturer in India.

A star schema data model was designed on Tableau and data cleaning was carried out once the data was moved to the staging area via ETL mappings created using SQL.

Created an analytical Tableau dashboard, generating quantitative visuals in Tableau to derive important insights from various factors impacting the company's performance annually and offer further business solutions.

# Problem Statement
Sales Director wants to know the company's performance in various Indian States and take business actions accordingly.

Q1. Annual Revenue Patterns

Q2. Revenue patterns by Market 

Q3. Top 5 customers by revenue 

Q4. Sales patterns by Market

Q5. Net Profit & Profit Margin by Market

Q6. Most Profitable Customers

**What is the purpose? Why? What are we hoping to accomplish?**

To reduce the amount of time spent manually gathering data by unlocking sales insights that were previously invisible to the sales team and automating them for decision assistance.

**Stakeholders involved:**

- Sales Director
- I.T. Team
- Customer Service Team
- Data & Analytics Team

# Data Analysis Approach
<img width="635" alt="image" src="https://github.com/jatinsatija/Sales_Insights_Data_Analysis_using_Tableau_and_SQL/assets/44506321/40384a8e-953b-484f-96ab-0a1cb0ccc503">

# Exploratory Analysis Using SQL

1. Show Customer wise total Revenue and Profit
``` sql   
SELECT distinct customers.custmer_name, sum(transactions.profit_margin) as "Total Profit Generated", sum(transactions.sales_amount) as "Total Revenue Generate"
from customers INNER JOIN transactions on customers.customer_code = transactions.customer_code
INNER JOIN date on transactions.order_date = date.date
group by customers.custmer_name; 
``` 
2. Show Annual Revenue Patterns: Month-by-Month View
``` sql  
SELECT date.year, date.month_name, sum(transactions.sales_amount) as "Total Revenue Generated"
FROM transactions 
INNER JOIN date ON transactions.order_date = date.date 
group by date.year, date.month_name;
``` 
3. Show Market Performance: Revenue Insights
``` sql  
SELECT markets.markets_name, sum(transactions.sales_amount) as "Total Revenue Generated"
from transactions INNER JOIN markets ON markets.markets_code = transactions.market_code
group by markets.markets_name
order by sum(transactions.sales_amount) desc;
``` 
4. Show Market Performance: Sales Insights
``` sql  
SELECT markets.markets_name, sum(transactions.sales_qty) as "Total Sales"
from transactions INNER JOIN markets ON markets.markets_code = transactions.market_code
group by markets.markets_name
order by sum(transactions.sales_qty) desc;
``` 
5. Show Annual Revenue and Profit Margin Patterns: Month-by-Month View
``` sql  
SELECT date.year, date.month_name, sum(transactions.sales_amount) as "Total Revenue Generated", sum(transactions.profit_margin) as "Total Profit Generated"
FROM transactions 
INNER JOIN date ON transactions.order_date = date.date 
group by date.year, date.month_name;
``` 
6. Show Market Segmentation Profit Overview
``` sql     
SELECT markets.markets_name, sum(transactions.profit_margin)/sum(transactions.sales_amount)*100 as "Total Profit Margin %"
from transactions INNER JOIN markets ON markets.markets_code = transactions.market_code
group by markets.markets_name
order by sum(transactions.profit_margin)/sum(transactions.sales_amount)*100 desc; 
``` 





