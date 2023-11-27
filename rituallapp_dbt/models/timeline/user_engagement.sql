



select
    p.user_id,
    s.user_segment,
    p.signup_date,
    cast(date_trunc('week', e.event_date) as date) as event_week,
    count(*) as events_per_week
from
    {{ ref('user_events') }} e
join
    {{ ref('user_profiles') }} p on e.user_id = p.user_id
join
    {{ ref('user_segments') }} s on e.user_id = s.user_id
where
    e.event_date >= p.signup_date
group by
    p.user_id,
    s.user_segment,
    p.signup_date,
    date_trunc('week', e.event_date)
order by
    date_trunc('week', e.event_date) asc