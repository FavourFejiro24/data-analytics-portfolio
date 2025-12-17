 ---ROW_NUMBER()----                                                                                                                -                                                                                                                                                                                                                Today :                                                                                                                                                                                                NDZ Journal                                                                                                                                                                                         NDZ Letters                                                                                                                                                                                 Publish Blog Article                                                                                                                                                                     Publish Founders Note                                                                                                      Follow up With The LinkedIn Challenge For Campus Hosts                                                                                                                                                                  Blockers :                                                                                                                                                                                             -                                                                                                                                                                                                           Professionally :                                                                                                                                                                                5                                                                                                                                                                                                                 Personally :                                         ----ROW_NUMBER()  
SELECT 
    Customer_ID,
    Total_Amount,
    ROW_NUMBER() OVER (ORDER BY Total_Amount DESC) AS RankOrder
FROM retail_sales_dataset;

----RANK()-------
SELECT 
    Customer_ID,
    Total_Amount,
    RANK() OVER (ORDER BY Total_Amount DESC) AS SalesRank
FROM retail_sales_dataset;

----PARTION BY--------
SELECT 
    Product_Category,
    Customer_ID,
    Total_Amount,
    ROW_NUMBER() OVER (PARTITION BY Product_Category ORDER BY Total_Amount DESC) AS CategoryRank
FROM retail_sales_dataset;

-----RECENCY QUERY-------
SELECT 
    Customer_ID,
    DATEDIFF(DAY, MAX(Date), GETDATE()) AS Recency
FROM retail_sales_dataset
GROUP BY Customer_ID;

---FREQUENCY QUERY-----
SELECT 
    Customer_ID,
    COUNT(Transaction_ID) AS Frequency
FROM retail_sales_dataset
GROUP BY Customer_ID;

----MONETARY QUERY----
SELECT 
    Customer_ID,
    SUM(Total_Amount) AS Monetary
FROM retail_sales_dataset
GROUP BY Customer_ID;

---COMBINED RFM----
SELECT 
    r.Customer_ID,
    r.Recency,
    f.Frequency,
    m.Monetary
FROM
    (SELECT Customer_ID, DATEDIFF(DAY, MAX(Date), GETDATE()) AS Recency FROM retail_sales_dataset GROUP BY Customer_ID) r
JOIN
    (SELECT Customer_ID, COUNT(Transaction_ID) AS Frequency FROM retail_sales_dataset GROUP BY Customer_ID) f
ON r.Customer_ID = f.Customer_ID
JOIN
    (SELECT Customer_ID, SUM(Total_Amount) AS Monetary FROM retail_sales_dataset GROUP BY Customer_ID) m
ON r.Customer_ID = m.Customer_ID;

