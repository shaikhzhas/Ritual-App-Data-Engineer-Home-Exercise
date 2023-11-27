

select
    user_id,
    count(*) as event_count
from
    {{ ref('user_events') }}
group by
    user_id
order by
    event_count desc
limit 5