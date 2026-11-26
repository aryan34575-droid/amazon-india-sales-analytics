# Amazon India Sales Analytics — Corrected Validation Summary

**Source:** `Amazon Sale Report.csv` supplied for this project  
**Analysis basis:** cleaned source rows; aggregated recorded Amount values  
**Date handling:** both `MM-DD-YY` and `MM-DD-YYYY` parsed explicitly

## Data preparation

| Check | Result |
|---|---:|
| Original rows | 128,976 |
| Helper columns removed | `index`, `New`, `PendingS` |
| Exact duplicate rows removed | 959 |
| Cleaned rows | 128,017 |
| Remaining exact duplicate rows | 0 |
| Invalid dates after mixed-format parsing | 0 |
| Missing Amount values | 7,563 (5.91%) |
| Distinct Order IDs | 120,229 |

Missing Amount values were left missing; they were not replaced with zero or an average.

## Validated KPIs

| Metric | Value |
|---|---:|
| Recorded Amount total | ₹78,179,803.88 |
| Distinct orders | 120,229 |
| Average order value | ₹650.26 |
| Cancelled distinct orders | 17,166 |
| Cancelled order share | 14.28% |
| B2C recorded sales share | 99.25% |
| Amazon fulfilment recorded sales share | 69.18% |
| Top three categories' recorded sales share | 91.26% |

**AOV definition:** mean of per-order recorded Amount totals. This equals total recorded Amount divided by distinct Order IDs for this cleaned extract.

## Corrected monthly sales

| Month | Recorded sales | Distinct orders | Units |
|---|---:|---:|---:|
| March 2022 | ₹101,683.85 | 158 | 156 |
| April 2022 | ₹28,627,458.79 | 45,709 | 43,847 |
| May 2022 | ₹26,105,818.34 | 39,221 | 37,811 |
| June 2022 | ₹23,344,842.90 | 35,141 | 34,139 |

March contains only 31 March data. April month-on-month change must not be presented as a like-for-like full-month growth rate.

## Leading categories

| Category | Recorded sales | Units | Distinct orders |
|---|---:|---:|---:|
| T-shirt | ₹39,074,570.36 | 45,129 | 47,782 |
| Shirt | ₹21,127,971.29 | 44,671 | 46,499 |
| Blazzer | ₹11,141,538.83 | 13,850 | 14,984 |
| Trousers | ₹5,328,406.30 | 9,867 | 10,141 |

## Leading states

| State | Recorded sales | Distinct orders |
|---|---:|---:|
| Maharashtra | ₹13,261,933.90 | 20,756 |
| Karnataka | ₹10,421,496.02 | 16,162 |
| Telangana | ₹6,880,035.27 | 10,394 |
| Uttar Pradesh | ₹6,798,644.08 | 10,057 |
| Tamil Nadu | ₹6,477,109.53 | 10,507 |

## Cross-checks and test scope

The overall KPI, monthly, category, top-state, status, and B2B/B2C aggregation logic was independently re-executed using SQLite and reconciled to Pandas outputs. All six aggregation families passed in that independent SQL-engine comparison.

**Not yet claimed:** direct DuckDB execution in the current analysis runtime. A DuckDB-vs-Pandas assertion section is included in the committed notebook and must be run in an environment with the project's `requirements.txt` installed and the original source CSV present.

## Limitations

- Recorded Amount is not profit. Cost, fees, and margin are not present.
- There is no reliable customer identifier for retention or customer lifetime value.
- Delivery timestamps are unavailable for delivery-duration analysis.
- Missing Amount rows were not imputed.
- Statistical outliers are review flags, not automatic errors.
- Public dashboard values are aggregates; original order IDs and postal codes are not published.

## Files

- Dashboard: [index.html](../index.html)
- Reproducible notebook: [Amazon_Sales_Validated_Analysis.ipynb](../notebooks/Amazon_Sales_Validated_Analysis.ipynb)
- Methodology: [METHODOLOGY.md](../docs/METHODOLOGY.md)
