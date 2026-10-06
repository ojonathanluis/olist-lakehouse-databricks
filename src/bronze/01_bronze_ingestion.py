# Lista com o nome dos arquivos exatos que estão no Volume
tabelas = [
    "olist_customers_dataset",
    "olist_order_items_dataset",
    "olist_order_payments_dataset",
    "olist_orders_dataset",
    "olist_products_dataset",
    "olist_sellers_dataset"
]

# Caminho base do Unity Catalog Volume
caminho_base = "/Volumes/workspace/default/dados_brutos/"

# Loop dinâmico para ingerir tudo automaticamente
for tabela in tabelas:
    print(f"Processando a tabela: {tabela}...")

    # Lê o arquivo bruto do Volume,
    # mantendo o cabeçalho e inferindo os tipos
    df = spark.read.format("csv") \
        .option("header", "true") \
        .option("inferSchema", "true") \
        .load(f"{caminho_base}{tabela}.csv")

    # Remove "_dataset" do nome
    nome_limpo = tabela.replace("_dataset", "")

    # Define o nome da tabela Bronze
    nome_tabela_destino = f"workspace.default.bronze_{nome_limpo}"

    # Salva como tabela Delta
    df.write.format("delta") \
        .mode("overwrite") \
        .saveAsTable(nome_tabela_destino)

print("Sucesso! Todas as tabelas da Camada Bronze foram criadas.")
