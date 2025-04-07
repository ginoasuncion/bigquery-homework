CREATE MATERIALIZED VIEW IF NOT EXISTS `data-engineering-hs-bkk.homework_ds.group_mean_mv` AS
SELECT group_id, AVG(value) AS avg_value
FROM `data-engineering-hs-bkk.homework_ds.large_dataset`
GROUP BY group_id;