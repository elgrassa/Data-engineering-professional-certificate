SELECT
    city,
    'Sale' AS market_type,
    COUNT(id) AS total_listings,
    APPROX_QUANTILES(price, 100)[OFFSET(50)] AS median_price,  -- 50th percentile (median)
    APPROX_QUANTILES(price, 100)[OFFSET(75)] AS percentile_75_price,  -- 75th percentile
    APPROX_QUANTILES(price, 100)[OFFSET(95)] AS percentile_95_price  -- 95th percentile
FROM `hazel-aquifer-458214-c4.polish_flats_data.apartments_sale_aggregated`
GROUP BY city

UNION ALL

SELECT
    city,
    'Rent' AS market_type,
    COUNT(id) AS total_listings,
    APPROX_QUANTILES(price, 100)[OFFSET(50)] AS median_price,  -- 50th percentile (median)
    APPROX_QUANTILES(price, 100)[OFFSET(75)] AS percentile_75_price,  -- 75th percentile
    APPROX_QUANTILES(price, 100)[OFFSET(95)] AS percentile_95_price  -- 95th percentile
FROM `hazel-aquifer-458214-c4.polish_flats_data.apartments_rent_aggregated`
GROUP BY city
ORDER BY total_listings DESC
    LIMIT 15;
