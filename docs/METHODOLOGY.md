# Methodology

## 1. Objective
Analyze the supplied Amazon India sales/order export to describe sales composition, category performance, geography, customer segment, fulfilment, and order/courier status. The analysis is descriptive and intended to support business exploration.

## 2. Data preparation
The original notebook workflow:
1. Loads the source export `Amazon Sale Report.csv`.
2. Drops export/helper columns `index`, `New`, and `PendingS`.
3. Checks and removes duplicate rows after the selected-column transformation.
4. Parses the `Date` field using the specified date format.
5. Converts postal-code values to string for analysis.
6. Exports a cleaned dataset for downstream analysis.

For public sharing, the cleaned dataset was prepared separately: original order IDs were replaced with stable pseudonymous keys, and postal-code values were removed. This preserves distinct-order grouping while reducing exposure of order-level identifiers.

## 3. Exploratory data analysis
The notebook covers:
- Dataset dimensions, column types, missing values, and duplicates.
- Sales KPIs and order-level average order value.
- Monthly recorded sales for successfully parsed dates.
- Category and quantity contribution.
- B2B versus B2C mix.
- State and city distribution.
- Fulfilment provider and courier status.
- Spearman correlation between Amount and Qty.
- IQR-based outlier identification.
- Business observations and recommendations.

## 4. SQL analysis
DuckDB is used for grouped analytical queries, including overall KPIs and summaries by category, month, state, order status, and customer segment. SQL results are used as a second analytical view alongside the Python workflow.

## 5. Dashboard behaviour
The static HTML dashboard embeds the public-safe cleaned data. Browser-side filters update the displayed KPI values and chart series. Chart hover interactions expose the selected mark's detailed values, including value, share, and rank where applicable.

## 6. Interpretation guardrails
- Amount represents recorded sales amount, not profit.
- Missing Amount values are excluded from sums and relevant calculations.
- Monthly figures are incomplete because a substantial portion of source dates failed the strict date parser.
- Outliers are statistical review flags and are not automatically data errors.
- Correlation is not causation.
- No claims about customer retention, customer lifetime value, product-level margin, or delivery duration are made because the necessary fields are unavailable.
