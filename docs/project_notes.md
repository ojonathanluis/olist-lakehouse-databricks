# Project Notes

This is a practical learning project using Databricks, PySpark, SQL, Delta Lake and Power BI. The implementation intentionally keeps the architecture simple, from raw ingestion to analytical visualization.

## Scope

- Bronze ingestion is implemented with a small PySpark loop over six Olist CSV sources.
- Silver applies timestamp conversion and order-status filtering to the orders table; the other source tables are exposed without advanced transformations.
- Gold joins orders, customers, order items and products into one analytical table.
- Power BI consumes the Gold table through a compact semantic model with four core measures.

## Deliberate limitations

- `inferSchema` is used for simplicity.
- Loads overwrite the Bronze destination tables rather than using incremental logic.
- The Gold table is item-level, so `order_id` may repeat and order counts must be distinct.
- Average delivery days in the current dashboard is calculated over nonblank Gold rows; orders with more items can therefore receive slightly more weight.

These limitations are documented rather than hidden because the project is intended to demonstrate the implemented learning workflow, not a production-ready enterprise platform.
