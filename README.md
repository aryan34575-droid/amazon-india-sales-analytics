# Amazon India Sales Analytics

A source-backed analytics project using the supplied Amazon India Sale Report export. The project includes a corrected cleaning workflow, Pandas EDA, DuckDB SQL reconciliation code, aggregated outputs, and an interactive GitHub Pages dashboard.

## Current project status

- Corrected source data preparation and date parsing have been independently rebuilt.
- Aggregation logic has been cross-checked between Pandas and SQLite for KPIs, month, category, state, status, and B2B/B2C.
- A DuckDB-vs-Pandas assertion workflow is included in the reproducible notebook. Direct DuckDB execution is still pending a full notebook run with the source CSV and dependencies installed.
- Dashboard and report use corrected aggregate results. The public repository does not include the raw order-level source file.

## Key validated results

| Metric | Result |
|---|---:|
| Original source rows | 128,976 |
| Cleaned rows | 128,017 |
| Exact duplicate rows removed | 959 |
| Invalid dates after mixed-format parsing | 0 |
| Missing Amount values | 7,563 (5.91%) |
| Distinct Order IDs | 120,229 |
| Total recorded Amount | ₹78,179,803.88 |
| Average order value | ₹650.26 |
| Cancelled distinct orders | 17,166 (14.28%) |

AOV is the mean of per-order recorded Amount totals. Missing Amount values were not imputed. Recorded Amount is not profit.

## Key findings

- T-shirts, shirts, and blazers contribute approximately **91.26%** of recorded sales.
- B2C contributes approximately **99.25%** of recorded sales.
- Amazon fulfilment contributes approximately **69.18%** of recorded sales.
- Maharashtra is the highest recorded-sales state in the cleaned data.
- March 2022 is a partial month (only 31 March rows); April month-on-month growth is not a like-for-like full-month comparison.

## Dashboard

Open the [interactive dashboard](index.html). Charts support hover details and responsive layout.

## Repository structure

```text
.
├── index.html
├── data/
│   └── aggregates/
│       ├── monthly_sales.csv
│       ├── category_sales.csv
│       └── top_states.csv
├── notebooks/
│   └── Amazon_Sales_Validated_Analysis.ipynb
├── reports/
│   └── Amazon_Sales_Validation_Summary.md
├── docs/
│   ├── DATA_DICTIONARY.md
│   ├── METHODOLOGY.md
│   └── DEPLOYMENT.md
├── .github/workflows/pages.yml
└── requirements.txt
```

## Reproduce the analysis

1. Obtain the original `Amazon Sale Report.csv` from the dataset owner/source under its applicable terms.
2. Place it beside the notebook (the raw order-level file is intentionally not committed here).
3. Install dependencies: `pip install -r requirements.txt`.
4. Run `notebooks/Amazon_Sales_Validated_Analysis.ipynb` from top to bottom.
5. Confirm the final cell prints the DuckDB/Pandas reconciliation PASS message.

## Data quality and analytical limitations

- Mixed date formats are explicitly parsed as both `MM-DD-YY` and `MM-DD-YYYY`.
- 7,563 Amount values are missing; no imputation is applied.
- March 2022 is partial, so monthly growth comparisons require caution.
- No cost, fee, or margin fields are available; profit cannot be calculated.
- No suitable customer identifier is available for retention or customer lifetime value.
- Delivery timestamps are unavailable for delivery-duration analysis.
- Outliers are review flags, not automatically incorrect records.

## Privacy

The repository publishes aggregated results only. It does not publish the original order-level source CSV, original order identifiers, or postal codes.

## Author

**Aryan Mishra** · Data Analytics Portfolio Project
