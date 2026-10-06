# Power BI Data Model

The Power BI semantic model imports `workspace.default.gold_olist_vendas_consolidadas` from Databricks.

The Gold table is item-level: one order may appear on multiple rows when it contains multiple items. For this reason, order volume uses `DISTINCTCOUNT(order_id)`.

The model exposes the columns required by the report, including:

- `order_estimated_delivery_date`
- `dias_para_entrega`
- `valor_produto`
- `valor_frete`
- `valor_total_com_frete`

A calculated `Mês da Compra` column is used for chronological monthly reporting. Authentication and credentials are managed locally in Power BI and are not stored in the repository.
