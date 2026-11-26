# Methodology

## Objective
Describe sales composition, category performance, geography, customer segment, fulfilment, and order-status mix in the supplied Amazon India sales export.

## Source and cleaning
The analysis uses the supplied `Amazon Sale Report.csv` source export.

1. Load the source CSV.
2. Drop export/helper columns `index`, `New`, and `PendingS`.
3. Remove exact duplicate rows after dropping those columns.
4. Parse dates using both `%m-%d-%y` and `%m-%d-%Y` formats.
5. Preserve postal codes as strings for local analysis; do not publish them.
6. Keep missing Amount values missing; do not impute them.

Rebuilt source facts: 128,976 original rows, 959 duplicate rows removed, 128,017 cleaned rows, zero invalid dates after mixed-format parsing, 7,563 missing Amount values, and 120,229 distinct order IDs.

## Measures and definitions
- **Recorded sales:** sum of non-missing `Amount` values.
- **Distinct orders:** count of unique `Order ID` values.
- **AOV:** mean of order-level recorded Amount totals.
- **Cancelled order share:** distinct order IDs with Status = Cancelled divided by all distinct order IDs.
- **Segment/fulfilment share:** recorded Amount for the segment divided by total recorded Amount.

## Analysis
The reproducible notebook includes:
- Data dimensions, types, missingness, and duplicates.
- Overall KPIs and order-level AOV.
- Monthly sales, category sales, state sales, status distribution, and B2B/B2C comparisons.
- DuckDB SQL queries for the same aggregation families.
- Assertions comparing DuckDB and Pandas results.

Independent verification in the analysis environment compared the Pandas aggregations with equivalent SQLite SQL queries; all six aggregation families reconciled. This is not represented as a direct DuckDB runtime execution. The notebook contains the direct DuckDB assertions for a full run with dependencies installed.

## Dashboard
The GitHub Pages dashboard presents source-backed aggregate KPIs and charts for monthly sales, category sales, top states, order status, and B2B/B2C composition. It uses no customer-level or postal-code data.

## Interpretation limits
- Amount is recorded sales, not profit.
- Missing Amount values remain excluded from sums and are not imputed.
- March 2022 is partial (31 March data only); April MoM is not a full-month like-for-like comparison.
- No customer identifier, SKU, costs, fees, margin, or delivery timestamps are available. Retention, CLV, product-level margin, profit, and delivery-duration metrics are therefore out of scope.
- Statistical outliers are review flags, not automatic data errors.
