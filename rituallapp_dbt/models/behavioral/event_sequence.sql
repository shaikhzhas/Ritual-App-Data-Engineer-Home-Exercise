

with t1 as (
    select
        user_id,
        event_date,
        event_type,
        lag(event_type) over (partition by user_id order by event_date) as previous_event_type
    from
         {{ ref('user_events') }} 
),
t2 as (
    select
        user_id,
        event_date,
        event_type,
        lead(event_type) over (partition by user_id order by event_date asc) as next_event_type,
        lead(event_type,2) over (partition by user_id order by event_date asc) as next_next_event_type
    from
        t1
    where
        event_type != previous_event_type OR previous_event_type IS NULL
    order by
        user_id, 
        event_date
)
select
    event_type,
    next_event_type,
    next_next_event_type,
    count(*) as number_of_events
from
    t2
group by 
    event_type,
    next_event_type,
    next_next_event_type