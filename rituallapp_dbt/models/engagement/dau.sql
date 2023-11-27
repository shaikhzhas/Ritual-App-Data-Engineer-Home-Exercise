


-- DAU
with date_range as (
    select 
        cast(generate_series as date) date
    from
        generate_series(date '2022-10-27', date '2023-12-26', interval '1 day')
)
select
    dr.date as event_date,
    coalesce(count(distinct ue.user_id),0) as dau
from
    date_range dr
left join
    {{ ref('user_events') }} ue
on dr.date=ue.event_date
group by
    dr.date 