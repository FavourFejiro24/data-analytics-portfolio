-- Show All Columns For All Rows----
SELECT * FROM retail_sales_dataset;

 -- Show Only Specific Columns---
SELECT Customer_ID, Product_Category, Total_Amount FROM retail_sales_dataset;

--Top 5 Customers by Total Spending--
SELECT TOP 5 * 
FROM retail_sales_dataset
ORDER BY Total_Amount DESC;

-- Total Sales Per Product Category---
SELECT Product_Category, SUM(Total_Amount) AS TotalSales
FROM retail_sales_dataset
GROUP BY Product_Category;
 
-- Count of Transactions Per Product Category---
SELECT Product_Category, COUNT(Transaction_ID) AS TransactionsCount
FROM retail_sales_dataset
GROUP BY Product_Category;

---Cutomers Older Than 50 Who Bought Electronics---- 
SELECT *
FROM retail_sales_dataset
WHERE Age > 50
  AND [Product_Category] = 'Electronics';
 
-- Only Beauty Products--
SELECT * 
FROM retail_sales_dataset
WHERE Product_Category = 'Beauty';

--Beauty Products Sold For More Than 100---
SELECT *
FROM retail_sales_dataset
WHERE [Product_Category] = 'Beauty' 
  AND [Total_Amount] > 100;

---Customers With More Than 2 Transactions---
SELECT Product_Category, COUNT(Transaction_ID) AS TransactionCount
FROM retail_sales_dataset
GROUP BY Product_Category
HAVING COUNT(Transaction_ID) > 2;

--Total Quantity sold by Product Category---
 SELECT Product_Category, SUM(Quantity) AS QuantitySold
FROM retail_sales_dataset
GROUP BY Product_Category;

---Average Total Amount by Product Category---
SELECT Product_Category, AVG(Total_Amount) AS AverageTotalAmount
FROM retail_sales_dataset
GROUP BY Product_Category

---Transactions in The Last Six Months---
SELECT *
FROM retail_sales_dataset
WHERE [Date] >= '2023-06-01';

