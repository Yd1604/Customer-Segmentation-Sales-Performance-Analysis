
-- CUSTOMER SEGMENTATION & RFM ANALYSIS

-- 1. DATA EXPLORATION


-- PREVIEW THE DATASET


SELECT *
FROM `segmentation-project-503000.customer_segmentation.cleaned_online_retail`
LIMIT 10;



--  CHECK TOTAL NUMBER OF ROWS


SELECT
    COUNT(*) AS Total_Rows
FROM `segmentation-project-503000.customer_segmentation.cleaned_online_retail`;



--  CHECK UNIQUE CUSTOMERS


SELECT
    COUNT(DISTINCT CustomerID) AS Total_Customers
FROM `segmentation-project-503000.customer_segmentation.cleaned_online_retail`;



--  CHECK UNIQUE ORDER

SELECT
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM `segmentation-project-503000.customer_segmentation.cleaned_online_retail`;



-- CHECK TRANSACTION DATE RANGE


SELECT
    MIN(DATE(InvoiceDate)) AS First_Transaction_Date,
    MAX(DATE(InvoiceDate)) AS Last_Transaction_Date
FROM `segmentation-project-503000.customer_segmentation.cleaned_online_retail`;



-- CHECK COUNTRIES IN THE DATASET


SELECT
    Country,
    COUNT(*) AS Transaction_Count
FROM `segmentation-project-503000.customer_segmentation.cleaned_online_retail`
GROUP BY Country
ORDER BY Transaction_Count DESC;



-- CHECK TOTAL REVENUE


SELECT
    ROUND(SUM(TotalPrice), 2) AS Total_Revenue
FROM `segmentation-project-503000.customer_segmentation.cleaned_online_retail`;



--  TOP 10 COUNTRIES BY REVENUE


SELECT
    Country,
    ROUND(SUM(TotalPrice), 2) AS Revenue
FROM `segmentation-project-503000.customer_segmentation.cleaned_online_retail`
GROUP BY Country
ORDER BY Revenue DESC
LIMIT 10;



--  TOP 10 PRODUCTS BY REVENUE


SELECT
    Description,
    ROUND(SUM(TotalPrice), 2) AS Product_Revenue
FROM `segmentation-project-503000.customer_segmentation.cleaned_online_retail`
WHERE Description IS NOT NULL
GROUP BY Description
ORDER BY Product_Revenue DESC
LIMIT 10;



--  MONTHLY REVENUE TREND


SELECT
    FORMAT_TIMESTAMP('%Y-%m', InvoiceDate) AS Sales_Month,
    ROUND(SUM(TotalPrice), 2) AS Monthly_Revenue
FROM `segmentation-project-503000.customer_segmentation.cleaned_online_retail`
GROUP BY Sales_Month
ORDER BY Sales_Month;
