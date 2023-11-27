

-- MAU
select
    date_trunc('month', cast(event_date as date)) as event_month,
    count(distinct user_id) as mau
from
    {{ ref('user_events') }}
group by
    event_month
