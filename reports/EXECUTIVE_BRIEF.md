# Amazon India Sales Analytics — Executive Brief

## Decision question

What does the supplied Amazon India Sale Report export show about recorded sales mix, category concentration, order status and geography, and what should an operations or commercial team investigate next?

## Scope and measurement

This independent analysis uses the supplied `Amazon Sale Report.csv` export. The corrected workflow retains 128,017 rows after removing 959 exact duplicate rows from 128,976 source rows. Mixed source date formats (`MM-DD-YY` and `MM-DD-YYYY`) are parsed explicitly. The cleaned extract contains 120,229 distinct order IDs.

**Important metric definition:** `Amount` is recorded order-line sales value. It is not revenue recognized under an accounting policy, gross margin or profit. The source does not contain product costs, platform fees or reliable customer identifiers.

## Executive snapshot

| Measure | Validated result |
|---|---:|
| Source rows | 128,976 |
| Cleaned rows | 128,017 |
| Exact duplicate rows removed | 959 |
| Distinct orders | 120,229 |
| Recorded Amount total | ₹78,179,803.88 |
| Average recorded order value | ₹650.26 |
| Cancelled distinct orders | 17,166 |
| Cancelled order share | 14.28% |
| Missing Amount | 7,563 rows (5.91%) |
| Invalid dates after corrected parsing | 0 |

AOV is defined as total non-missing recorded Amount divided by distinct Order IDs. Missing Amount values are not imputed.

## What the data says

### 1. Sales are concentrated in a small number of categories

T-shirts, shirts and blazers together account for approximately **91.26%** of recorded sales. T-shirts are the largest category in the cleaned extract.

**Why it matters:** a large share of recorded sales is exposed to the performance of a small set of categories. This is a concentration observation, not proof of high profitability or low profitability.

### 2. The recorded sales mix is predominantly B2C

B2C accounts for approximately **99.25%** of recorded sales in the cleaned extract.

**Why it matters:** B2C is the dominant observed channel/segment in this dataset. The result alone does not establish whether B2B expansion would be commercially attractive.

### 3. Fulfilment and cancellations deserve operational investigation

Amazon fulfilment accounts for approximately **69.18%** of recorded sales. The cancelled-order share is approximately **14.28%** of distinct order IDs.

**Why it matters:** these results justify deeper analysis of cancellation patterns by fulfilment, courier status, category, geography and time. They do not identify the cause of cancellations.

### 4. Maharashtra leads the recorded-sales geography

Maharashtra has the highest recorded sales among states in the cleaned extract (approximately ₹13.26 million).

**Why it matters:** the state is a useful starting point for a more granular service-level and fulfilment review. Recorded sales alone cannot establish delivery quality, customer satisfaction or profitability.

## Recommended next analyses

1. **Cancellation root-cause analysis:** compare cancellation rates by fulfilment channel, courier status, category, state and month. Use distinct order IDs as the denominator and document exclusions.
2. **Category concentration monitoring:** create a category-level monthly trend and concentration view; pair it with cost and margin data before making assortment or pricing decisions.
3. **Fulfilment performance:** compare status mix and recorded sales by fulfilment/courier combinations; request delivery timestamps and promised-delivery dates before measuring delivery speed.
4. **Geographic drill-down:** examine city-level order counts, cancellation rates and fulfilment mix for the highest-sales states, while suppressing small groups where privacy could be affected.
5. **Data-quality monitoring:** track missing Amount rows and validate date parsing on every refreshed extract.

## Limitations and responsible interpretation

- Amount is recorded sales, not profit or margin.
- Cost, fees, SKU-level product identifiers, reliable customer IDs and delivery timestamps are unavailable.
- Missing Amount values (5.91%) remain missing; they are not imputed.
- March 2022 is a partial month (31 March records only). April month-on-month growth is not a like-for-like full-month comparison.
- Statistical outliers are review flags, not automatic data errors.
- The public repository contains aggregate outputs and does not publish raw order IDs or postal codes.
- The analysis is based on a supplied export and should not be treated as a complete view of Amazon India marketplace performance.

## Reproducibility

- [Validated notebook](../notebooks/Amazon_Sales_Validated_Analysis.ipynb)
- [DuckDB SQL companion](../sql/amazon_sales_analysis.sql)
- [Validation summary](Amazon_Sales_Validation_Summary.md)
- [Data dictionary](../docs/DATA_DICTIONARY.md)
- [Methodology](../docs/METHODOLOGY.md)

The notebook contains DuckDB/Pandas reconciliation assertions. The README and validation summary explicitly distinguish independent SQLite reconciliation already completed from direct DuckDB execution, which still requires a full notebook run with the source CSV and project dependencies installed.
