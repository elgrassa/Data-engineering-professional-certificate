-- Sale Market Activity by City, Rent Market Activity by City
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
group by city

-- Limit to top 15 cities by activity (total listings)
order by total_listings desc
limit 15
