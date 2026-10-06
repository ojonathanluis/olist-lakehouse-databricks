-- Run after Bronze, Silver and Gold in Databricks.
SHOW TABLES IN workspace.default LIKE 'bronze_olist_*';
SHOW TABLES IN workspace.default LIKE 'silver_olist_*';
SELECT COUNT(*) AS total_pedidos_silver
FROM workspace.default.silver_olist_orders;
SELECT order_status, COUNT(*) AS total_pedidos
FROM workspace.default.silver_olist_orders GROUP BY order_status;
SELECT * FROM workspace.default.gold_olist_vendas_consolidadas LIMIT 100;
SELECT COUNT(*) AS total_linhas,
       COUNT(DISTINCT order_id) AS volume_pedidos,
       SUM(valor_produto) AS faturamento_total,
       SUM(valor_total_com_frete) AS valor_total_com_frete,
       AVG(dias_para_entrega) AS tempo_medio_de_entrega
FROM workspace.default.gold_olist_vendas_consolidadas;