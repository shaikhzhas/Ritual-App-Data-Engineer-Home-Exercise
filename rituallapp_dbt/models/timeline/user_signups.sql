

with date_range as (
    select 
        cast(generate_series as date) date
    from
        generate_series(date '2022-10-30', date '2023-12-30', interval '1 day')
)
select
    dr.date as event_date,
    coalesce(count(distinct up.user_id),0) as number_of_users
from
    date_range dr
left join
    {{ ref('user_profiles') }} up
on dr.date=up.signup_date
group by
    dr.date 
order by dr.date  desc