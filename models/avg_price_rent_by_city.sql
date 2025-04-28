SELECT
    city,
    AVG(price) AS average_price
FROM `hazel-aquifer-458214-c4.polish_flats_data.apartments_rent_aggregated`
GROUP BY city