CREATE OR REPLACE TABLE `data-engineering-hs-bkk.homework_ds.large_dataset` AS
SELECT 
  GENERATE_UUID() AS id,
  FORMAT('group_%04d', CAST(FLOOR(RAND() * 1000) AS INT64)) AS group_id,
  RAND() * 1000 AS value
FROM UNNEST(GENERATE_ARRAY(1, 1000000)) AS x;