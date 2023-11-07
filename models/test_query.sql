{{ config(materialized='table') }}
select * from alchemy.ingredients limit 10
