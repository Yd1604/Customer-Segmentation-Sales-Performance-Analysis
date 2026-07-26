-- 5. CUSTOMER SEGMENT SUMMARY


-- This query summarises each customer segment by:
-- 1. Number of Customers
-- 2. Total Segment Revenue
-- 3. Average Recency
-- 4. Average Frequency
-- 5. Average Customer Value


SELECT
    Customer_Segment,

    COUNT(*) AS Number_of_Customers,

    ROUND(
        SUM(Monetary),
        2
    ) AS Segment_Revenue,

    ROUND(
        AVG(Recency),
        2
    ) AS Average_Recency,

    ROUND(
        AVG(Frequency),
        2
    ) AS Average_Frequency,

    ROUND(
        AVG(Monetary),
        2
    ) AS Average_Customer_Value

FROM
    `segmentation-project-503000.customer_segmentation.customer_segments`

GROUP BY
    Customer_Segment

ORDER BY
    Segment_Revenue DESC;
