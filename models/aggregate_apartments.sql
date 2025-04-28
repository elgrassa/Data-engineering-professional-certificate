-- select
--     city,
--     count(id) as total_listings,
--     avg(price) as average_price,
--     min(price) as min_price,
--     max(price) as max_price
-- from `hazel-aquifer-458214-c4.polish_flats_data.apartments_sale_aggregated`  -- Corrected table reference
-- group by city

-- union all

-- select
--     city,
--     count(id) as total_listings,
--     avg(price) as average_price,
--     min(price) as min_price,
--     max(price) as max_price
-- from `hazel-aquifer-458214-c4.polish_flats_data.apartments_rent_aggregated`  -- Corrected table reference
-- group by city

-- limit 100  -- Apply LIMIT only once at the end
-- ;

-- Count total rows in apartments_sale_aggregated
SELECT COUNT(*) AS total_rows
FROM `hazel-aquifer-458214-c4.polish_flats_data.apartments_sale_aggregated`;

-- -- Count total rows in apartments_rent_aggregated
-- SELECT COUNT(*) AS total_rows
-- FROM `hazel-aquifer-458214-c4.polish_flats_data.apartments_rent_aggregated`;