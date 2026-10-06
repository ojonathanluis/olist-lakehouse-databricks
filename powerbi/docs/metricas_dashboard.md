# Métricas do dashboard Olist

| Indicador | Cálculo |
|---|---|
| Faturamento Total | `SUM(valor_produto)`, sem frete |
| Volume de Pedidos | `DISTINCTCOUNT(order_id)` |
| Valor Total com Frete | `SUM(valor_total_com_frete)` |
| Tempo Médio de Entrega | `AVERAGE(dias_para_entrega)`, ignorando valores em branco |

A Gold possui uma linha por item do pedido, portanto `order_id` pode aparecer mais de uma vez. O volume de pedidos usa contagem distinta para evitar duplicidade.

A média de entrega segue a implementação simples do modelo atual e é calculada sobre as linhas não vazias da Gold. Como pedidos com vários itens geram várias linhas, eles podem receber peso ligeiramente maior nessa média.

Os valores incluem somente os status mantidos na Silver e não devem ser interpretados como lucro, receita líquida ou SLA.
