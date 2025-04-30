{{ config(materialized='view') }}

with apartments as (
    select *
    from {{ source('polish_flats', 'apartments_sale_aggregated') }}
)

select
    city,
    avg(price) as average_price
from apartments
group by city
