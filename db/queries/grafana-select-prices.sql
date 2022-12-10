SELECT
    $__timeGroup(p.created_at, '10m') AS "time",
    p.binance_price_pair_id AS metric,
    p.price as value
FROM binance_prices p
WHERE
    $__timeFilter(p.created_at)
ORDER BY 1,2
