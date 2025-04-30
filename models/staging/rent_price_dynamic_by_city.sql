{{ config(materialized='view') }}

with rent_prices_2022 as (
    select
        city,
        approx_quantiles(price, 100)[offset(50)] as median_price_2022,
        approx_quantiles(price, 100)[offset(95)] as percentile_95_price_2022
    from {{ source('polish_flats', 'apartments_rent_aggregated') }}
    where buildyear = 2022
    group by city
),

rent_prices_2024 as (
    select
        city,
        approx_quantiles(price, 100)[offset(50)] as median_price_2024,
        approx_quantiles(price, 100)[offset(95)] as percentile_95_price_2024
    from {{ source('polish_flats', 'apartments_rent_aggregated') }}
    where buildyear = 2024
    group by city
),

joined as (
    select
        coalesce(r2022.city, r2024.city) as city,
        r2022.median_price_2022,
        r2024.median_price_2024,
        case
            when r2024.median_price_2024 > r2022.median_price_2022 then '+'
            when r2024.median_price_2024 < r2022.median_price_2022 then '_'
            else '0'
        end as median_price_change,

        r2022.percentile_95_price_2022,
        r2024.percentile_95_price_2024,
        case
            when r2024.percentile_95_price_2024 > r2022.percentile_95_price_2022 then '+'
            when r2024.percentile_95_price_2024 < r2022.percentile_95_price_2022 then '_'
            else '0'
        end as percentile_95_price_change
    from rent_prices_2022 r2022
    full outer join rent_prices_2024 r2024
        on r2022.city = r2024.city
)

select *
from joined
order by city
