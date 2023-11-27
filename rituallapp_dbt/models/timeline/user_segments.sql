

with t1 as (
    select
        user_id, count(*) as number_of_events
    from
        {{ ref('user_events') }}
    group by user_id
)
select
    user_id,
    number_of_events,
    case
        when number_of_events > 10 then 'high'
        when number_of_events < 6 then 'low'
        else 'medium'
    end as user_segment
from
    t1