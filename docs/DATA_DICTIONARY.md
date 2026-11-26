# Data Dictionary

This document describes the fields in the cleaned public-safe dataset. Original order identifiers are replaced with pseudonymous keys, and postal-code values are excluded from the public copy.

| Field | Description |
|---|---|
| `Order ID` | Pseudonymous order key; retains grouping for distinct-order calculations |
| `Date` | Order date parsed from the source export using both `MM-DD-YY` and `MM-DD-YYYY` formats |
| `Status` | Order status recorded in the source |
| `Fulfilment` | Fulfilment channel |
| `Sales Channel` | Sales channel |
| `ship-service-level` | Shipping service level |
| `Category` | Product category |
| `Size` | Product size |
| `Courier Status` | Courier/shipping status |
| `Qty` | Quantity recorded on the order line |
| `currency` | Currency code |
| `Amount` | Recorded order-line amount |
| `ship-city` | Shipping city |
| `ship-state` | Shipping state |
| `ship-country` | Shipping country |
| `B2B` | Business-to-business indicator |
| `fulfilled-by` | Fulfilment provider field |

## Corrected data-quality observations

The figures below reflect the corrected cleaning workflow, including explicit parsing of both source date formats.

- Cleaned dataset size: **128,017 rows × 17 public fields**.
- Distinct orders: **120,229**.
- Exact duplicate rows removed: **959**.
- Missing Amount: **7,563 rows (5.91%)**; these values remain missing and are not imputed.
- Missing parsed Date after mixed-format parsing: **0 rows**.
- Missing `fulfilled-by`: **89,085 rows**.
- The original export contained postal-code values; those values are intentionally excluded from the public-safe copy.

### Date-parsing clarification

An earlier preliminary pass using a single strict date format reported 54,744 missing dates (42.76%). This was a parsing limitation, not the final cleaned-data result. The corrected workflow parses both `MM-DD-YY` and `MM-DD-YYYY`; the validation summary records zero invalid dates after this correction.

## Fields not available

The dataset does not provide a reliable customer ID, SKU/product identifier, product cost, fees, profit/margin, or delivery timestamps. Therefore retention, repeat-customer behaviour, SKU profitability, profit margin, and delivery-time KPIs cannot be calculated from this dataset.
