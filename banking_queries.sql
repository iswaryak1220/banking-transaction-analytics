-- Total transactions
SELECT COUNT(*) AS total_transactions
FROM banking;

-- Total transaction amount
SELECT SUM(transaction_amount) AS total_amount
FROM banking;

-- Credit vs Debit distribution
SELECT transaction_type, COUNT(*) AS count, SUM(transaction_amount) AS total_amount
FROM banking
GROUP BY transaction_type;

-- High value transactions (>5000)
SELECT *
FROM banking
WHERE transaction_amount > 5000;

-- Fraud / High risk transactions
SELECT *
FROM banking
WHERE risk_flag = 'High';

-- Transactions by location
SELECT location, COUNT(*) AS transaction_count, SUM(transaction_amount) AS total_amount
FROM banking
GROUP BY location
ORDER BY total_amount DESC;

-- Monthly transaction trend
SELECT MONTH(transaction_date) AS month, SUM(transaction_amount) AS total_amount
FROM banking
GROUP BY MONTH(transaction_date)
ORDER BY month;

-- Top customers by transaction amount
SELECT customer_id, SUM(transaction_amount) AS total_spent
FROM banking
GROUP BY customer_id
ORDER BY total_spent DESC;