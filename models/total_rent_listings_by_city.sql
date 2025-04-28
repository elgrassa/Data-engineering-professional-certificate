SELECT
    city,
    COUNT(id) AS total_listings
FROM `hazel-aquifer-458214-c4.polish_flats_data.apartments_rent_aggregated`
GROUP BY city