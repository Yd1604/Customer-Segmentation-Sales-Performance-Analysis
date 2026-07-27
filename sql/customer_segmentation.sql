-- 4. CUSTOMER SEGMENTATION


-- CALCULATE RFM VALUES


WITH rfm_values AS (

    SELECT
        CustomerID,

        -- Days since the customer's most recent purchase
        DATE_DIFF(
            DATE '2011-12-10',
            MAX(DATE(InvoiceDate)),
            DAY
        ) AS Recency,

        -- Number of unique orders
        COUNT(DISTINCT InvoiceNo) AS Frequency,

        -- Total amount spent
        ROUND(
            SUM(TotalPrice),
            2
        ) AS Monetary

    FROM
        `segmentation-project-503000.customer_segmentation.cleaned_online_retail`

    GROUP BY
        CustomerID
),



--  ASSIGN RFM SCORES


rfm_scores AS (

    SELECT
        CustomerID,
        Recency,
        Frequency,
        Monetary,

        -- Lower Recency is better
        NTILE(5) OVER (
            ORDER BY Recency DESC
        ) AS R_Score,

        -- Higher Frequency is better
        NTILE(5) OVER (
            ORDER BY Frequency ASC
        ) AS F_Score,

        -- Higher Monetary value is better
        NTILE(5) OVER (
            ORDER BY Monetary ASC
        ) AS M_Score

    FROM
        rfm_values
),



-- CLASSIFYING CUSTOMERS INTO SEGMENTS


customer_segments AS (

    SELECT
        CustomerID,
        Recency,
        Frequency,
        Monetary,
        R_Score,
        F_Score,
        M_Score,

        CONCAT(
            CAST(R_Score AS STRING),
            CAST(F_Score AS STRING),
            CAST(M_Score AS STRING)
        ) AS RFM_Score,

        CASE

            -- Best customers:
            -- Recent, frequent and high spending
            WHEN R_Score >= 4
                 AND F_Score >= 4
                 AND M_Score >= 4
                THEN 'Champions'

            -- Customers who purchase frequently
            WHEN R_Score >= 3
                 AND F_Score >= 4
                THEN 'Loyal Customers'

            -- Recent customers with potential
            -- to become loyal customers
            WHEN R_Score >= 4
                 AND F_Score BETWEEN 2 AND 3
                THEN 'Potential Loyalists'

            -- Very recent customers
            -- with only a small number of purchases
            WHEN R_Score = 5
                 AND F_Score = 1
                THEN 'New Customers'

            -- Previously valuable customers
            -- who have not purchased recently
            WHEN R_Score <= 2
                 AND F_Score >= 3
                 AND M_Score >= 3
                THEN 'At Risk'

            -- Inactive customers with low
            -- frequency and monetary value
            WHEN R_Score = 1
                 AND F_Score <= 2
                 AND M_Score <= 2
                THEN 'Lost Customers'

            -- Customers who do not meet
            -- the conditions above
            ELSE 'Others'

        END AS Customer_Segment

    FROM
        rfm_scores
)



-- FINAL CUSTOMER SEGMENTATION


SELECT
    CustomerID,
    Recency,
    Frequency,
    Monetary,
    R_Score,
    F_Score,
    M_Score,
    RFM_Score,
    Customer_Segment

FROM
    customer_segments

ORDER BY
    Monetary DESC;
