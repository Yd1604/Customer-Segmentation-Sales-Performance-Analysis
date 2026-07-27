-- 3. RFM SCORING

-- Recency:
-- Lower number of days is better.
--
-- Frequency:
-- Higher number of purchases is better.
--
-- Monetary:
-- Higher customer spending is better.


-- CALCULATE RFM VALUES


WITH rfm_values AS (

    SELECT
        CustomerID,

        -- Number of days since the customer's last purchase
        DATE_DIFF(
            DATE '2011-12-10',
            MAX(DATE(InvoiceDate)),
            DAY
        ) AS Recency,

        -- Number of unique orders placed by the customer
        COUNT(DISTINCT InvoiceNo) AS Frequency,

        -- Total amount spent by the customer
        ROUND(
            SUM(TotalPrice),
            2
        ) AS Monetary

    FROM
        `segmentation-project-503000.customer_segmentation.cleaned_online_retail`

    GROUP BY
        CustomerID
),



-- ASSIGN R, F AND M SCORES


rfm_scores AS (

    SELECT
        CustomerID,
        Recency,
        Frequency,
        Monetary,

        -- Lower Recency is better.
        -- DESC places customers with larger recency first,
        -- so the most recent customers receive the highest score.
        NTILE(5) OVER (
            ORDER BY Recency DESC
        ) AS R_Score,

        -- Higher Frequency is better.
        NTILE(5) OVER (
            ORDER BY Frequency ASC
        ) AS F_Score,

        -- Higher Monetary value is better.
        NTILE(5) OVER (
            ORDER BY Monetary ASC
        ) AS M_Score

    FROM
        rfm_values
)


-- CREATE COMBINED RFM SCORE

  
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
    ) AS RFM_Score

FROM
    rfm_scores

ORDER BY
    Monetary DESC;
