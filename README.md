# BigQuery Homework Project – High School Bangkok

This project demonstrates the creation and benchmarking of data aggregation in BigQuery using both native tables and Google Sheets as external sources.

## 📁 Project Structure

```
bigquery-homework/
├── 01_create_large_dataset.sql
├── 02_create_group_mean_view.sql
├── 03_create_materialized_view.sql
├── 04_create_scheduled_query_table.sql
├── 05_create_google_sheet_view.sql
├── 06_create_google_sheet_scheduled_query.sql
└── README.md
```

## 🧠 Objective

- Create a large dataset with 1,000,000 rows and 1,000 distinct groups.
- Generate a random numeric column.
- Create views, materialized views, and scheduled queries to compute group-level averages.
- Benchmark the performance of each method.
- Include a Google Sheet with the same structure and compare performance when accessed via BigQuery.

## ✅ SQL Scripts

| File Name                              | Description                                         |
|----------------------------------------|-----------------------------------------------------|
| 01_create_large_dataset.sql            | Generate base dataset with UUIDs, group IDs, values |
| 02_create_group_mean_view.sql          | Create a standard view                              |
| 03_create_materialized_view.sql        | Create a materialized view                          |
| 04_create_scheduled_query_table.sql    | Create scheduled query output table (native)        |
| 05_create_google_sheet_view.sql        | Create a view using Google Sheets as external data  |
| 06_create_google_sheet_scheduled_query.sql | Scheduled query table from Google Sheets         |

## 📊 Performance Benchmark

Performed using `bq query` with `time` in CLI. Each method was run:
- Once with cached results
- Once with `--nouse_cache` to simulate fresh queries

Results were stored and compared to analyze speed differences.

## 📎 Notes

- Materialized Views are only supported on native BigQuery tables.
- Google Sheets cannot be used to create Materialized Views.
- For best performance and stability, use scheduled query tables.

## 🔧 Requirements

- Google Cloud project with BigQuery and Sheets access
- Google Sheet shared with BigQuery's service account
- CLI access with `bq` and `gcloud` authenticated

## 🏁 How to Use

1. Download and run the SQL files in order.
2. Ensure your dataset is created and external table is linked.
3. Use the CLI or UI to run benchmark comparisons.