


-- Distribution of event types over time (daily)
select
    cast(event_date as date) as event_day,
    event_type,
    count(*) as event_count
from
    {{ ref('user_events') }}
group by
    event_day, event_type
order by
    event_day, event_count desc