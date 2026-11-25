# Data Dictionary

This document describes the fields in the cleaned public-safe dataset. Original order identifiers are replaced with pseudonymous keys, and postal-code values are excluded from the public copy.

| Field | Description |
|---|---|
| `Order ID` | Pseudonymous order key; retains grouping for distinct-order calculations |
| `Date` | Parsed order date; may be missing when source date formats do not match the parser |
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

## Known data-quality observations

- Cleaned dataset size: **128,017 rows × 17 public fields**.
- Distinct orders: **120,229**.
- Missing Amount: **7,563 rows (5.91%)**.
- Missing parsed Date: **54,744 rows (42.76%)** under the original strict parser.
- Missing `fulfilled-by`: **89,085 rows**.
- The original export contained postal-code values; those values are intentionally excluded from the public-safe copy.

## Fields not available

The dataset does not provide a reliable customer ID, SKU/product identifier, product cost, fees, profit/margin, or delivery timestamps. Therefore retention, repeat-customer behaviour, SKU profitability, profit margin, and delivery-time KPIs cannot be calculated from this dataset.
