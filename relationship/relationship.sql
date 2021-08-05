select * from (
select from_address, to_address, min (date(block_timestamp) ) as min_date , max (date(block_timestamp) ) as  max_date , count(1) as cnt_transaction, sum(value) as sum_transaction   from  (
SELECT from_address ,  to_address, value, block_timestamp,  
FROM `bigquery-public-data.crypto_ethereum.transactions`  
WHERE DATE(block_timestamp) > "2021-07-01" and value >0  LIMIT 10
)
group by from_address,  to_address
) where cnt_transaction >3