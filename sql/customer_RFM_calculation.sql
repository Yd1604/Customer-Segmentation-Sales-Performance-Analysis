-- 2. CUSTOMER RFM CALCULATION


-- RFM stands for:
-- R = Recency: Number of days since the customer's last purchase
-- F = Frequency: Number of unique orders placed by the customer
-- M = Monetary: Total amount spent by the customer


--  CHECK TRANSACTION DATE RANGE


-- first and last purchase dates in the dataset

SELECT
    MIN(DATE(InvoiceDate)) AS First_Purchase_Date,
    MAX(DATE(InvoiceDate)) AS Last_Purchase_Date
FROM
    `segmentation-project-503000.customer_segmentation.cleaned_online_retail`;


-- calculating RFM Values

SELECT
    CustomerID,

    DATE_DIFF(
        DATE '2011-12-10',
        MAX(DATE(InvoiceDate)),
        DAY
    ) AS Recency,

    COUNT(DISTINCT InvoiceNo) AS Frequency,

    ROUND(
        SUM(TotalPrice),
        2
    ) AS Monetary

FROM
    `segmentation-project-503000.customer_segmentation.cleaned_online_retail`

GROUP BY
    CustomerID

ORDER BY
    Monetary DESC;


--  VALIDATE RFM RESULTS


-- the number of customers included in the RFM analysis.

WITH rfm_values AS (

    SELECT
        CustomerID,

        DATE_DIFF(
            DATE '2011-12-10',
            MAX(DATE(InvoiceDate)),
            DAY
        ) AS Recency,

        COUNT(DISTINCT InvoiceNo) AS Frequency,

        ROUND(
            SUM(TotalPrice),
            2
        ) AS Monetary

    FROM
        `segmentation-project-503000.customer_segmentation.cleaned_online_retail`

    GROUP BY
        CustomerID
)

SELECT
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Recency), 2) AS Average_Recency,
    ROUND(AVG(Frequency), 2) AS Average_Frequency,
    ROUND(AVG(Monetary), 2) AS Average_Monetary_Value

FROM
    rfm_values;



-- TOP CUSTOMERS BY MONETARY VALUE


WITH rfm_values AS (

    SELECT
        CustomerID,

        DATE_DIFF(
            DATE '2011-12-10',
            MAX(DATE(InvoiceDate)),
            DAY
        ) AS Recency,

        COUNT(DISTINCT InvoiceNo) AS Frequency,

        ROUND(
            SUM(TotalPrice),
            2
        ) AS Monetary

    FROM
        `segmentation-project-503000.customer_segmentation.cleaned_online_retail`

    GROUP BY
        CustomerID
)

SELECT
    CustomerID,
    Recency,
    Frequency,
    Monetary

FROM
    rfm_values

ORDER BY
    Monetary DESC

LIMIT 10;
