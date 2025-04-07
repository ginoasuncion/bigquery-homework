#!/bin/bash

DATASET="data-engineering-hs-bkk.homework_ds"
OUTPUT_FILE="all_query_timings.csv"

# Clean output file
rm -f "$OUTPUT_FILE"
touch "$OUTPUT_FILE"

run_query() {
  local label=$1
  local query=$2
  local use_cache=$3

  echo "⏱️ Running $label ($use_cache)..."

  if [ "$use_cache" = "false" ]; then
    TIME_OUTPUT=$( { time bq query --nouse_cache --use_legacy_sql=false "$query" > /dev/null; } 2>&1 )
  else
    TIME_OUTPUT=$( { time bq query --use_legacy_sql=false "$query" > /dev/null; } 2>&1 )
  fi

  # Extract real time
  REAL_TIME=$(echo "$TIME_OUTPUT" | grep real | awk '{print $2}')
  echo "$label ($use_cache): $REAL_TIME"
  echo "$label ($use_cache),$REAL_TIME" >> "$OUTPUT_FILE"
}

echo "🚀 Benchmarking All BigQuery and Google Sheets Aggregation Methods..."
echo ""

### 📦 BigQuery Dataset

run_query "BQ View" "SELECT * FROM \`$DATASET.group_mean_view\`" true
run_query "BQ View" "SELECT * FROM \`$DATASET.group_mean_view\`" false

run_query "BQ Materialized View" "SELECT * FROM \`$DATASET.group_mean_mv\`" true
run_query "BQ Materialized View" "SELECT * FROM \`$DATASET.group_mean_mv\`" false

run_query "BQ Scheduled Table" "SELECT * FROM \`$DATASET.group_mean_scheduled\`" true
run_query "BQ Scheduled Table" "SELECT * FROM \`$DATASET.group_mean_scheduled\`" false

### 📄 Google Sheets Dataset

run_query "Sheets View" "SELECT * FROM \`$DATASET.gs_group_mean_view\`" true
run_query "Sheets View" "SELECT * FROM \`$DATASET.gs_group_mean_view\`" false

run_query "Sheets Scheduled Table" "SELECT * FROM \`$DATASET.gs_group_mean_scheduled\`" true
run_query "Sheets Scheduled Table" "SELECT * FROM \`$DATASET.gs_group_mean_scheduled\`" false

# Display results
echo ""
echo "📊 Query Timing Summary:"
echo "=============================="
printf "| %-30s | %-8s |\n" "Method" "Time"
echo "|------------------------------|----------|"

while IFS=',' read -r method time; do
  printf "| %-30s | %-8s |\n" "$method" "$time"
done < "$OUTPUT_FILE"

echo "=============================="

