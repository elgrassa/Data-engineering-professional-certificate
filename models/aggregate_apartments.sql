-- models/aggregate_apartments.sql
SELECT
    city,
    COUNT(id) AS total_listings,
    AVG(price) AS average_price,
    MIN(price) AS min_price,
    MAX(price) AS max_price
FROM {{ ref('apartments_sale') }}  -- Refers to the apartments_sale source model
GROUP BY city