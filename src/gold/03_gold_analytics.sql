CREATE OR REPLACE TABLE workspace.default.gold_olist_vendas_consolidadas AS

SELECT 
    o.order_id,

    c.customer_id,
    c.customer_city,
    c.customer_state,

    o.order_status,

    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,

    -- Tempo entre compra e entrega
    CASE
        WHEN o.order_delivered_customer_date IS NOT NULL
        THEN DATEDIFF(
            o.order_delivered_customer_date,
            o.order_purchase_timestamp
        )
    END AS dias_para_entrega,

    i.product_id,

    p.product_category_name,

    i.price AS valor_produto,

    i.freight_value AS valor_frete,

    -- Produto + frete
    (i.price + i.freight_value)
        AS valor_total_com_frete

FROM workspace.default.silver_olist_orders o

INNER JOIN workspace.default.silver_olist_customers c 
    ON o.customer_id = c.customer_id

INNER JOIN workspace.default.silver_olist_order_items i 
    ON o.order_id = i.order_id

LEFT JOIN workspace.default.silver_olist_products p 
    ON i.product_id = p.product_id;
