{{ config(materialized='view') }}

with sale_data as (
    select
        city,
        'Sale' as market_type,
        count(id) as total_listings,
        format('%.0f', avg(price)) as average_price,
        approx_quantiles(price, 100)[offset(50)] as median_price,
        approx_quantiles(price, 100)[offset(75)] as percentile_75_price,
        approx_quantiles(price, 100)[offset(95)] as percentile_95_price
    from {{ source('polish_flats', 'apartments_sale_aggregated') }}
    group by city
),

rent_data as (
    select
        city,
        'Rent' as market_type,
        count(id) as total_listings,
        format('%.0f', avg(price)) as average_price,
        approx_quantiles(price, 100)[offset(50)] as median_price,
        approx_quantiles(price, 100)[offset(75)] as percentile_75_price,
        approx_quantiles(price, 100)[offset(95)] as percentile_95_price
    from {{ source('polish_flats', 'apartments_rent_aggregated') }}
    group by city
)

select *
from (
         select * from sale_data
         union all
         select * from rent_data
     )
order by total_listings desc
    limit 15
