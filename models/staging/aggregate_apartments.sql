{{ config(materialized='table') }}

with sale_data as (
    select
        city,
        'Sale' as market_type,
        count(id) as total_listings,
        avg(price) as average_price,
        min(price) as min_price,
        max(price) as max_price
    from {{ source('polish_flats', 'apartments_sale') }}
    group by city
),

rent_data as (
    select
        city,
        'Rent' as market_type,
        count(id) as total_listings,
        avg(price) as average_price,
        min(price) as min_price,
        max(price) as max_price
    from {{ source('polish_flats', 'apartments_rent') }}
    group by city
)

select *
from sale_data
union all
select *
from rent_data
