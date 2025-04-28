select
    city,
    count(id) as total_listings,
    avg(price) as average_price,
    min(price) as min_price,
    max(price) as max_price
from `hazel-aquifer-458214-c4.polish_flats_data.apartments_sale_aggregated`
group by city

union all

select
    city,
    count(id) as total_listings,
    avg(price) as average_price,
    min(price) as min_price,
    max(price) as max_price
from `hazel-aquifer-458214-c4.polish_flats_data.apartments_rent_aggregated`
group by city;
