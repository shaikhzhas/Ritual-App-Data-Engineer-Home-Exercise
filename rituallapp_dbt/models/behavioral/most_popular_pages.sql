


SELECT
    page,
    COUNT(*) as event_count
FROM
    {{ ref('user_events') }} 
GROUP BY
    page
ORDER BY
    event_count DESC