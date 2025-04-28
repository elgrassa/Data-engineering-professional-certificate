SELECT
    city,
    COUNT(id) AS total_listings
FROM `hazel-aquifer-458214-c4.polish_flats_data.apartments_sale_aggregated`
GROUP BY city