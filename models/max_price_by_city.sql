SELECT
    city,
    MAX(price) AS max_price
FROM `hazel-aquifer-458214-c4.polish_flats_data.apartments_sale_aggregated`
GROUP BY city