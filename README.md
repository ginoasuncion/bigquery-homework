# 📊 BigQuery Homework Project

This project demonstrates how to design, implement, and benchmark aggregation queries on large datasets using both native BigQuery tables and Google Sheets as external data sources.

---

## 📁 Project Structure

```
bigquery-homework/
├── README.md
├── all_query_timings.csv                     # Benchmark results from CLI
├── benchmark_all_bigquery_and_sheets.sh      # Script to run and time all queries
├── requirements.txt                          # Python dependencies (optional)
├── scripts/                                  # Python script to generate data for Google Sheets
└── sql/                                      # All SQL scripts for table/view creation
    ├── 01_create_large_dataset.sql
    ├── 02_create_group_mean_view.sql
    ├── 03_create_materialized_view.sql
    ├── 04_create_scheduled_query_table.sql
    ├── 05_create_google_sheet_view.sql
    └── 06_create_google_sheet_scheduled_query.sql
```

---

## 🎯 Project Goals

- Generate a synthetic dataset with 1,000,000 rows and 1,000 groups.
- Create and compare the performance of:
  - Standard Views
  - Materialized Views (native BigQuery only)
  - Scheduled Queries
- Integrate Google Sheets as an external table
- Benchmark performance between BigQuery-native data and Sheets-linked data

---

## ✅ SQL Components

| Script                                | Description                                           |
|--------------------------------------|-------------------------------------------------------|
| `01_create_large_dataset.sql`        | Generate the synthetic dataset inside BigQuery       |
| `02_create_group_mean_view.sql`      | Create a standard view for group-mean aggregation     |
| `03_create_materialized_view.sql`    | Create a materialized view (BigQuery only)           |
| `04_create_scheduled_query_table.sql`| Create a scheduled output table                      |
| `05_create_google_sheet_view.sql`    | Create a view based on Google Sheets external table  |
| `06_create_google_sheet_scheduled_query.sql` | Scheduled output table from Sheet data     |

---

## 🚀 How to Run

1. Open the `sql/` folder and run SQL scripts in order.
2. Ensure Google Sheet is properly linked as an external table.
3. Run `benchmark_all_bigquery_and_sheets.sh` to compare performance.
4. Results are saved to `all_query_timings.csv`.

---

## 📊 Benchmark Sample (from CLI output)

| Method                     | Time     |
|----------------------------|----------|
| BQ View (cached)           | 7.914s   |
| BQ View (uncached)         | 6.183s   |
| Materialized View (cached) | 6.282s   |
| Materialized View (uncached)| 6.118s  |
| Scheduled Table (cached)   | 5.921s   |
| Scheduled Table (uncached) | 5.934s   |
| Sheets View (cached)       | 5.950s   |
| Sheets View (uncached)     | 6.049s   |
| Sheets Scheduled (cached)  | 5.940s   |
| Sheets Scheduled (uncached)| 6.029s   |

---

## 🔧 Prerequisites

- Google Cloud project with BigQuery and Drive access
- External table created from Google Sheets
- `bq` CLI installed and authenticated
- Google Sheet shared with the correct BigQuery service account

---

## 🏁 Conclusion

This project demonstrates how performance varies based on storage type and query method in BigQuery. For optimal performance and reliability, materialized or scheduled tables are preferred over dynamic views—especially when working with external data like Google Sheets.

---
