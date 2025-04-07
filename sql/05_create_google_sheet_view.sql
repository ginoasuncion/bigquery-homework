CREATE OR REPLACE VIEW `data-engineering-hs-bkk.homework_ds.gs_group_mean_view` AS
SELECT group_id, AVG(value) AS avg_value
FROM `data-engineering-hs-bkk.homework_ds.google_sheet_external_table`
GROUP BY group_id;