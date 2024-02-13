{{ config(materialized='table') }}
select * from ingredients limit 10
