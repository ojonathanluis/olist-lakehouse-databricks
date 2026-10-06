# Gold Table Data Dictionary

Table: `workspace.default.gold_olist_vendas_consolidadas`.
Grain: one row per joined order item. Item identifiers are not projected, so otherwise identical rows can represent separate items. Do not deduplicate by order/product.

| Column | Description |
|---|---|
| order_id | Order identifier; repeats across items |
| customer_id | Customer identifier used in the order/customer join |
| customer_city | Customer city |
| customer_state | Customer state abbreviation |
| order_status | Retained order status: delivered, shipped, invoiced or processing |
| order_purchase_timestamp | Purchase timestamp |
| order_delivered_customer_date | Actual customer delivery timestamp; may be null |
| order_estimated_delivery_date | Estimated delivery timestamp |
| dias_para_entrega | Calendar-day difference between purchase and delivery; null without delivery date |
| product_id | Product identifier |
| product_category_name | Source product category; may be null |
| valor_produto | Price of the source order item, in BRL |
| valor_frete | Freight value of the source order item, in BRL |
| valor_total_com_frete | Item price plus freight; null if either operand is null |

Count orders distinctly. Average delivery days over nonblank item rows as specified; this weights orders by their item count. Revenue includes all retained statuses and excludes freight unless explicitly stated.