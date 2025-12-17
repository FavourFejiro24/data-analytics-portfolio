CREATE TABLE ProductInfo (
    ProductCategory VARCHAR(50),
    Department VARCHAR(50)
);

INSERT INTO ProductInfo VALUES
('Beauty', 'Personal Care'),
('Clothing', 'Fashion'),
('Electronics', 'Tech');

SELECT * FROM ProductInfo

---INNER JOIN---
SELECT a.Transaction_ID, a.Product_Category, b.Department
FROM retail_sales_dataset a
INNER JOIN ProductInfo b
ON a.Product_Category = b.ProductCategory;

--LEFT JOIN---
SELECT a.Transaction_ID, a.Product_Category, b.Department
FROM retail_sales_dataset a
LEFT JOIN ProductInfo b
ON a.Product_Category = b.ProductCategory;

---RIGHT JOIN---
SELECT a.Transaction_ID, a.Product_Category, b.Department
FROM retail_sales_dataset a
RIGHT JOIN ProductInfo b
ON a.Product_Category = b.ProductCategory;


----AGGREGATION + JOIN-----
SELECT b.Department, SUM(a.Total_Amount) AS TotalRevenue
FROM retail_sales_dataset a
LEFT JOIN ProductInfo b
ON a.Product_Category = b.ProductCategory
GROUP BY b.Department;

---JOIN + FILTER-----
SELECT a.Customer_ID, a.Product_Category, b.Department
FROM retail_sales_dataset a
LEFT JOIN ProductInfo b
ON a.Product_Category = b.ProductCategory
WHERE b.Department = 'Tech';

---SUBQUERY IN WHERE---
SELECT *
FROM retail_sales_dataset
WHERE Total_Amount > (
    SELECT AVG(Total_Amount)
    FROM retail_sales_dataset
);

---SUBQUERY IN WHERE----
SELECT *
FROM retail_sales_dataset
WHERE Total_Amount > (
    SELECT MIN(Total_Amount)
    FROM retail_sales_dataset
);

--SUBQUERY IN FROM (inline view)---
SELECT Product_Category, AverageSales
FROM (
    SELECT Product_Category, AVG(Total_Amount) AS AverageSales
    FROM retail_sales_dataset
    GROUP BY Product_Category
) AS t;

---SUBQUER IN SELECT---
 SELECT  
     Customer_ID,
     Total_Amount,
    (SELECT AVG(Total_Amount) FROM retail_sales_dataset) AS OverallAvg
FROM retail_sales_dataset;

