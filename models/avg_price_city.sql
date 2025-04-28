SELECT
    city,
    AVG(price) AS average_price
FROM `hazel-aquifer-458214-c4.polish_flats_data.apartments_sale_aggregated`
GROUP BY city