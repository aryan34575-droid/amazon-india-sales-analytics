# Amazon India Sales Analytics

An end-to-end data analytics project exploring Amazon India order and sales records with **Python, Pandas, Jupyter Notebook, DuckDB SQL, and an interactive HTML dashboard**.

> **Project status:** Analysis and dashboard validation have been completed by the project author. Repository documentation and static deployment setup are included here. The live dashboard URL will be added after GitHub Pages deployment succeeds.

## Project at a glance

| Item | Detail |
|---|---|
| Dataset | Amazon India Sale Report |
| Cleaned records | 128,017 rows |
| Distinct orders | 120,229 |
| Recorded sales amount | ₹78,179,803.88 |
| Analysis tools | Python, Pandas, DuckDB SQL |
| Dashboard | Interactive HTML with filters and hover details |
| Deployment target | GitHub Pages |

## Business questions

This analysis explores:
- Which product categories contribute most to recorded sales?
- How are sales distributed across states and cities?
- What share of recorded sales comes from B2B versus B2C orders?
- How do Amazon and Merchant fulfilment compare?
- What does the order and courier status mix look like?
- What data-quality limitations should decision-makers consider?

## Key findings

- **₹78.18M** in recorded Amount values (excluding missing Amount values).
- **₹650.26** average order value, calculated as the mean of order-level totals.
- T-shirts, shirts, and blazers contribute approximately **91.26%** of recorded sales.
- B2C contributes approximately **99.25%** of recorded sales.
- Amazon fulfilment contributes approximately **69.18%** of recorded sales.
- Cancelled orders represent approximately **14.28%** of distinct orders.

These are descriptive findings from the supplied dataset. They do not establish causation or profitability.

## Dashboard

The dashboard is a self-contained static HTML experience with:
- Filters for category, state, order status, fulfilment, and customer segment.
- KPI recalculation based on selected filters.
- Interactive category, geography, monthly, status, fulfilment, and courier charts.
- Hover tooltips showing detailed values, percentages, ranks, and filtered totals.

After deployment, open the dashboard using the GitHub Pages URL shown in **Settings → Pages**.

## Technology stack

- **Python / Pandas / NumPy** — data preparation and exploratory analysis
- **Jupyter Notebook** — reproducible analysis workflow
- **DuckDB SQL** — analytical queries and grouped summaries
- **HTML / CSS / JavaScript** — interactive dashboard
- **GitHub Actions / GitHub Pages** — static site deployment

## Repository structure

```text
.
├── index.html
├── data/
│   └── processed/
│       └── Amazon_Sales_Cleaned_Public.csv
├── notebooks/
│   └── Amazon_Sales_EDA_Original_Workflow.ipynb
├── reports/
│   └── Amazon_Sales_Conclusion_and_Decision_Report.pdf
├── docs/
│   ├── DATA_DICTIONARY.md
│   ├── METHODOLOGY.md
│   └── DEPLOYMENT.md
├── .github/
│   └── workflows/
│       └── pages.yml
└── requirements.txt
```

## Data quality and analytical limitations

- The source date values use mixed formats. Strict parsing in the original workflow produced **54,744 missing parsed dates (42.76%)**. The monthly chart therefore uses only rows with successfully parsed dates and is not a complete time trend.
- **7,563 Amount values (5.91%)** are missing.
- The `fulfilled-by` field has extensive missingness; missing values should not automatically be interpreted as fulfilment failures.
- The dataset does not provide cost, fees, or margin, so **profit and profitability cannot be calculated**.
- There is no suitable customer identifier for customer retention, repeat-customer, or lifetime-value analysis.
- Statistical outliers are flags for review, not automatically erroneous records.

Read [Data Dictionary](docs/DATA_DICTIONARY.md), [Methodology](docs/METHODOLOGY.md), and [Deployment Guide](docs/DEPLOYMENT.md) for details.

## Reproduce the analysis

1. Clone this repository.
2. Install dependencies: `pip install -r requirements.txt`.
3. Open the notebook under `notebooks/` in Jupyter.
4. The original notebook workflow expects the original source file named `Amazon Sale Report.csv` in the project root.

The original order-level source CSV is not distributed in this public repository. The committed public-safe cleaned dataset is intended for dashboard exploration. If you have lawful access to the original source file, place it locally in the expected path before rerunning the original cleaning workflow.

## Privacy note

The public-safe dataset uses stable pseudonymous order keys in place of original order IDs and excludes postal-code values. Do not commit the unmodified source CSV or any file containing customer details, original order identifiers, postal codes, or other sensitive order-level information.

## Author

**Aryan Mishra**  
Data Analytics Portfolio Project
