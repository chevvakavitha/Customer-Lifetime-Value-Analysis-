SELECT COUNT(*) FROM retail;

SELECT SUM(Quantity * UnitPrice) AS total_revenue
FROM retail;

--Top 10 Customers
SELECT CustomerID,
       SUM(Quantity * UnitPrice) AS revenue
FROM retail
GROUP BY CustomerID
ORDER BY revenue DESC
LIMIT 10;

--Revenue by Country
SELECT Country,
       SUM(Quantity * UnitPrice) AS revenue
FROM retail
GROUP BY Country
ORDER BY revenue DESC;

--Monthly Revenue
SELECT strftime('%Y-%m', InvoiceDate) AS month,
       SUM(Quantity * UnitPrice) AS revenue
FROM retail
GROUP BY month
ORDER BY month;

--Total Customers
SELECT COUNT(DISTINCT CustomerID) AS total_customers
FROM retail;

--Average Order Value
SELECT CustomerID,
       SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo) AS avg_order_value
FROM retail
GROUP BY CustomerID;

--Purchase Frequency
SELECT CustomerID,
       COUNT(DISTINCT InvoiceNo) AS total_orders
FROM retail
GROUP BY CustomerID
ORDER BY total_orders DESC;

--