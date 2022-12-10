SELECT
    $__time(time_column),
    value1
FROM
    metric_table
WHERE
    $__timeFilter(time_column)
