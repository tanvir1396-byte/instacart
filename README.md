# Instacart End-to-End Data Engineering Pipeline

A full data pipeline project that ingests raw e-commerce data using Python, stores it in Google BigQuery, and transforms it using modular dbt models following Medallion Architecture.

## 🚀 Tech Stack & Workflow
* **Ingestion:** Python (`pandas`, `pandas_gbq`, `glob`) to load CSVs into BigQuery Bronze Layer (`instacart_raw`).
* **Transformation:** dbt Cloud (Staging & Marts layers with dimensional models: `dim_user`, `dim_product`, `fct_orders`, `fct_rank`).
* **Quality & Testing:** Automated `unique` and `not_null` constraints via dbt tests.

