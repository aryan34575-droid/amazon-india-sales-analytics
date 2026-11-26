-- Amazon India Sales Analytics
-- DuckDB SQL companion to notebooks/Amazon_Sales_Validated_Analysis.ipynb
--
-- Prerequisite:
-- Run the notebook's preparation cells and register the cleaned DataFrame as
-- a DuckDB relation named amazon_sales. This relation contains the original
-- Order ID locally; do not publish raw order identifiers or postal codes.
--
-- Definitions:
-- Amount = recorded order-line sales amount, not profit.
-- AOV = total recorded Amount / distinct Order IDs, as documented in the
-- validation report. Missing Amount values are excluded from SUM.

-- 1. Data volume and quality checks
SELECT
    COUNT(*) AS cleaned_rows,
    COUNT(DISTINCT "Order ID") AS distinct_orders,
    SUM(CASE WHEN Amount IS NULL THEN 1 ELSE 0 END) AS missing_amount_rows,
    ROUND(
        100.0 * SUM(CASE WHEN Amount IS NULL THEN 1 ELSE 0 END) / NULLIF(COUNT(*), 0),
        2
    ) AS missing_amount_pct,
    SUM(Qty) AS total_units
FROM amazon_sales;

-- 2. Executive KPIs
SELECT
    ROUND(SUM(Amount), 2) AS recorded_sales_inr,
    COUNT(DISTINCT "Order ID") AS distinct_orders,
    ROUND(SUM(Amount) / NULLIF(COUNT(DISTINCT "Order ID"), 0), 2) AS average_order_value_inr,
    COUNT(DISTINCT CASE WHEN Status = 'Cancelled' THEN "Order ID" END) AS cancelled_orders,
    ROUND(
        100.0 * COUNT(DISTINCT CASE WHEN Status = 'Cancelled' THEN "Order ID" END)
        / NULLIF(COUNT(DISTINCT "Order ID"), 0),
        2
    ) AS cancelled_order_share_pct
FROM amazon_sales;

-- 3. Monthly recorded sales (Date must already be parsed as DATE/TIMESTAMP)
SELECT
    strftime(Date, '%Y-%m') AS sales_month,
    ROUND(SUM(Amount), 2) AS recorded_sales_inr,
    COUNT(DISTINCT "Order ID") AS distinct_orders,
    SUM(Qty) AS units
FROM amazon_sales
WHERE Date IS NOT NULL
GROUP BY 1
ORDER BY 1;

-- 4. Category performance
SELECT
    Category,
    ROUND(SUM(Amount), 2) AS recorded_sales_inr,
    SUM(Qty) AS units,
    COUNT(DISTINCT "Order ID") AS distinct_orders,
    ROUND(
        100.0 * SUM(Amount) / NULLIF(SUM(SUM(Amount)) OVER (), 0),
        2
    ) AS recorded_sales_share_pct
FROM amazon_sales
GROUP BY Category
ORDER BY recorded_sales_inr DESC;

-- 5. Top states by recorded sales
SELECT
    "ship-state" AS state,
    ROUND(SUM(Amount), 2) AS recorded_sales_inr,
    COUNT(DISTINCT "Order ID") AS distinct_orders
FROM amazon_sales
WHERE "ship-state" IS NOT NULL
GROUP BY "ship-state"
ORDER BY recorded_sales_inr DESC
LIMIT 10;

-- 6. Order status mix
SELECT
    Status,
    COUNT(DISTINCT "Order ID") AS distinct_orders,
    ROUND(SUM(Amount), 2) AS recorded_sales_inr,
    SUM(Qty) AS units
FROM amazon_sales
GROUP BY Status
ORDER BY distinct_orders DESC;

-- 7. B2B versus B2C mix (B2B is expected to be BOOLEAN in the prepared data)
SELECT
    CASE WHEN "B2B" THEN 'B2B' ELSE 'B2C' END AS customer_segment,
    ROUND(SUM(Amount), 2) AS recorded_sales_inr,
    COUNT(DISTINCT "Order ID") AS distinct_orders,
    SUM(Qty) AS units,
    ROUND(
        100.0 * SUM(Amount) / NULLIF(SUM(SUM(Amount)) OVER (), 0),
        2
    ) AS recorded_sales_share_pct
FROM amazon_sales
GROUP BY "B2B"
ORDER BY recorded_sales_inr DESC;

-- 8. Fulfilment mix
SELECT
    Fulfilment,
    ROUND(SUM(Amount), 2) AS recorded_sales_inr,
    COUNT(DISTINCT "Order ID") AS distinct_orders,
    SUM(Qty) AS units
FROM amazon_sales
GROUP BY Fulfilment
ORDER BY recorded_sales_inr DESC;
