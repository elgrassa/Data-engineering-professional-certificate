WITH rent_prices AS (
    SELECT
        city,
        APPROX_QUANTILES(price, 100)[OFFSET(50)] AS median_price,  -- 50th percentile (median)
        APPROX_QUANTILES(price, 100)[OFFSET(95)] AS percentile_95_price,  -- 95th percentile
        '2022' AS year
FROM `hazel-aquifer-458214-c4.polish_flats_data.apartments_rent_aggregated`
WHERE buildyear = 2022  -- Filter for apartments built in 2022
GROUP BY city
UNION ALL
SELECT
    city,
    APPROX_QUANTILES(price, 100)[OFFSET(50)] AS median_price,
    APPROX_QUANTILES(price, 100)[OFFSET(95)] AS percentile_95_price,
    '2024' AS year
FROM `hazel-aquifer-458214-c4.polish_flats_data.apartments_rent_aggregated`
WHERE buildyear = 2024  -- Filter for apartments built in 2024
GROUP BY city
    )
SELECT
    city,
    MAX(CASE WHEN year = '2022' THEN median_price ELSE NULL END) AS median_price_2022,
    MAX(CASE WHEN year = '2024' THEN median_price ELSE NULL END) AS median_price_2024,
    CASE
        WHEN MAX(CASE WHEN year = '2024' THEN median_price ELSE NULL END) > MAX(CASE WHEN year = '2022' THEN median_price ELSE NULL END) THEN '+'
        WHEN MAX(CASE WHEN year = '2024' THEN median_price ELSE NULL END) < MAX(CASE WHEN year = '2022' THEN median_price ELSE NULL END) THEN '_'
        ELSE '0'
        END AS median_price_change,

    MAX(CASE WHEN year = '2022' THEN percentile_95_price ELSE NULL END) AS percentile_95_price_2022,
    MAX(CASE WHEN year = '2024' THEN percentile_95_price ELSE NULL END) AS percentile_95_price_2024,
    CASE
        WHEN MAX(CASE WHEN year = '2024' THEN percentile_95_price ELSE NULL END) > MAX(CASE WHEN year = '2022' THEN percentile_95_price ELSE NULL END) THEN '+'
        WHEN MAX(CASE WHEN year = '2024' THEN percentile_95_price ELSE NULL END) < MAX(CASE WHEN year = '2022' THEN percentile_95_price ELSE NULL END) THEN '_'
        ELSE '0'
        END AS percentile_95_price_change
FROM rent_prices
GROUP BY city
ORDER BY city;