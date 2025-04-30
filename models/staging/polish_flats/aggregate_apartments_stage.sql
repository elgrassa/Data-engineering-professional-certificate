{{ config(materialized='view') }}

SELECT
    city,
    COUNT(id) AS total_listings,
    AVG(price) AS average_price,
    MIN(price) AS min_price,
    MAX(price) AS max_price
FROM {{ source('polish_flats', 'apartments_sale') }}
GROUP BY city

UNION ALL

SELECT
    city,
    COUNT(id) AS total_listings,
    AVG(price) AS average_price,
    MIN(price) AS min_price,
    MAX(price) AS max_price
FROM {{ source('polish_flats', 'apartments_rent') }}
GROUP BY city
