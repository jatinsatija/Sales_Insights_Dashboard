#Show Customer wise total Revenue and Profit 
select distinct customers.custmer_name, sum(transactions.profit_margin) as "Total Profit Generated", sum(transactions.sales_amount) as "Total Revenue Generate"
from customers INNER JOIN transactions on customers.customer_code = transactions.customer_code
INNER JOIN date on transactions.order_date = date.date
group by customers.custmer_name;

#Show Annual Revenue Patterns: Month-by-Month View
SELECT date.year, date.month_name, sum(transactions.sales_amount) as "Total Revenue Generated"
FROM transactions 
INNER JOIN date ON transactions.order_date = date.date 
group by date.year, date.month_name;

#Show Market Performance: Revenue Insights
select markets.markets_name, sum(transactions.sales_amount) as "Total Revenue Generated"
from transactions INNER JOIN markets ON markets.markets_code = transactions.market_code
group by markets.markets_name
order by sum(transactions.sales_amount) desc;

#Show Market Performance: Sales Insights
select markets.markets_name, sum(transactions.sales_qty) as "Total Sales"
from transactions INNER JOIN markets ON markets.markets_code = transactions.market_code
group by markets.markets_name
order by sum(transactions.sales_qty) desc;

#Show Annual Revenue and Profit Margin Patterns: Month-by-Month View
SELECT date.year, date.month_name, sum(transactions.sales_amount) as "Total Revenue Generated", sum(transactions.profit_margin) as "Total Profit Generated"
FROM transactions 
INNER JOIN date ON transactions.order_date = date.date 
group by date.year, date.month_name;

#Show Market Segmentation Profit Overview
select markets.markets_name, sum(transactions.profit_margin)/sum(transactions.sales_amount)*100 as "Total Profit Margin %"
from transactions INNER JOIN markets ON markets.markets_code = transactions.market_code
group by markets.markets_name
order by sum(transactions.profit_margin)/sum(transactions.sales_amount)*100 desc;
