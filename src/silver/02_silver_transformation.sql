-- ============================================================
-- SILVER - ORDERS
-- Tratamento de datas e filtro de pedidos relevantes
-- ============================================================

CREATE OR REPLACE TABLE workspace.default.silver_olist_orders AS
SELECT 
    order_id,
    customer_id,
    order_status,

    CAST(order_purchase_timestamp AS TIMESTAMP)
        AS order_purchase_timestamp,

    CAST(order_delivered_customer_date AS TIMESTAMP)
        AS order_delivered_customer_date,

    CAST(order_estimated_delivery_date AS TIMESTAMP)
        AS order_estimated_delivery_date

FROM workspace.default.bronze_olist_orders

WHERE order_status IN (
    'delivered',
    'shipped',
    'invoiced',
    'processing'
);


-- ============================================================
-- SILVER - ORDER ITEMS
-- ============================================================

CREATE OR REPLACE TABLE workspace.default.silver_olist_order_items AS 
SELECT * 
FROM workspace.default.bronze_olist_order_items;


-- ============================================================
-- SILVER - ORDER PAYMENTS
-- ============================================================

CREATE OR REPLACE TABLE workspace.default.silver_olist_order_payments AS 
SELECT * 
FROM workspace.default.bronze_olist_order_payments;


-- ============================================================
-- SILVER - CUSTOMERS
-- ============================================================

CREATE OR REPLACE TABLE workspace.default.silver_olist_customers AS 
SELECT * 
FROM workspace.default.bronze_olist_customers;


-- ============================================================
-- SILVER - PRODUCTS
-- ============================================================

CREATE OR REPLACE TABLE workspace.default.silver_olist_products AS 
SELECT * 
FROM workspace.default.bronze_olist_products;


-- ============================================================
-- SILVER - SELLERS
-- ============================================================

CREATE OR REPLACE TABLE workspace.default.silver_olist_sellers AS 
SELECT * 
FROM workspace.default.bronze_olist_sellers;


-- ============================================================
-- VALIDAÇÃO SIMPLES
-- ============================================================

SELECT COUNT(*) AS total_pedidos_silver
FROM workspace.default.silver_olist_orders;
