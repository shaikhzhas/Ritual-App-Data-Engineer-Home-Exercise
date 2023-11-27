


-- Most common event types
select
    event_type,
    count(*) as event_count
from
    {{ ref('user_events') }}
group by
    event_type