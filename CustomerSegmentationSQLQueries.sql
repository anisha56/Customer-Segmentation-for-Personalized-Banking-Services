# 1. Total Transaction Amount per Location
SELECT CustLocation, round(SUM(`TransactionAmount (INR)`),0) AS TotalSpend
FROM bank_transactions
GROUP BY CustLocation
ORDER BY TotalSpend DESC
LIMIT 10;
# Mumbai Location has the most transaction amount 

# 2. Average Spend by Gender
SELECT CustGender, ROUND(AVG(`TransactionAmount (INR)`),0) AS AvgSpend
FROM bank_transactions
GROUP BY CustGender;

# 3. Monthly Spend Pattern 
SELECT EXTRACT(month from (TransactionDate)) AS Month, ROUND(SUM(`TransactionAmount (INR)`),0)  AS MonthlySpend
FROM bank_transactions
GROUP BY Month
ORDER BY Month;

# 4. Count of Transactions by Gender and Location
SELECT CustGender, CustLocation, COUNT(*) AS NumTransactions
FROM bank_transactions
GROUP BY CustGender, CustLocation
ORDER BY NumTransactions DESC
LIMIT 10;

# 5.  Customers with Highest Average Account Balance
SELECT CustomerID,
       MAX(CustAccountBalance) AS MaxBalance
FROM bank_transactions
GROUP BY CustomerID
ORDER BY MaxBalance DESC
LIMIT 10; 

# 6.Time of Day Analysis 
SELECT substr(TransactionTime, 1, 2) AS Hour,
       COUNT(*) AS NumTransactions,
       round(SUM(`TransactionAmount (INR)`),0) AS TotalSpend
FROM bank_transactions
GROUP BY Hour
ORDER BY Hour desc, NumTransactions DESC;
 
 # 7. Customer Segmentation by Balance 
 SELECT
  CASE
    WHEN CustAccountBalance < 10000 THEN 'Low Balance'
    WHEN CustAccountBalance BETWEEN 10000 AND 50000 THEN 'Mid Balance'
    WHEN CustAccountBalance BETWEEN 50001 AND 100000 THEN 'High Balance'
    ELSE 'Very High Balance'
  END AS BalanceSegment,
  COUNT(DISTINCT CustomerID) AS NumCustomers,
  round(SUM(`TransactionAmount (INR)`),0) AS TotalTransaction
FROM bank_transactions
GROUP BY BalanceSegment
ORDER BY TotalTransaction DESC;

# 8. Repeat Customers vs One-Time Customers
SELECT
  CASE
    WHEN COUNT(*) = 1 THEN 'One-time'
    ELSE 'Repeat'
  END AS CustomerType,
  COUNT(DISTINCT CustomerID) AS NumCustomers
FROM bank_transactions
GROUP BY CustomerID
ORDER BY CustomerType;

# 9. Customers with No Large Transactions (e.g. > ₹10,000)
SELECT CustomerID,
       MAX(`TransactionAmount (INR)`) AS MaxTransaction
FROM bank_transactions
GROUP BY CustomerID
HAVING MaxTransaction < 10000
ORDER BY MaxTransaction DESC;  

# 10. Which Day of the Week Has Highest Spend?
SELECT DAYOFWEEK(TransactionDate) AS DayOfWeek,
       COUNT(*) AS Transactions,
       ROUND(SUM(`TransactionAmount (INR)`),0) AS TotalSpend
FROM bank_transactions
GROUP BY DayOfWeek

ORDER BY TotalSpend DESC;

# 11. Customers inactive for last 60 days
SELECT 
    CustomerID,
    MAX(TransactionDate) AS LastTransactionDate,
    DATEDIFF(CURDATE(), MAX(TransactionDate)) AS DaysSinceLastTransaction
FROM 
    bank_transactions
GROUP BY 
    CustomerID
HAVING 
    DaysSinceLastTransaction > 60
ORDER BY 
    DaysSinceLastTransaction DESC;
    
# 12. Calculate Simplified CLV (Customer Lifetime Value)
SELECT 
    CustomerID,
    COUNT(*) AS NumTransactions,
    SUM(`TransactionAmount (INR)`) AS TotalSpent,
    AVG(`TransactionAmount (INR)`) AS AvgTransaction,
    MAX(STR_TO_DATE(TransactionDate, '%d/%m/%y')) AS LastTransactionDate,
    DATEDIFF(CURDATE(), MAX(STR_TO_DATE(TransactionDate, '%d/%m/%y'))) AS Recency
FROM 
    bank_transactions
GROUP BY 
    CustomerID
ORDER BY 
    TotalSpent DESC
LIMIT 20;

