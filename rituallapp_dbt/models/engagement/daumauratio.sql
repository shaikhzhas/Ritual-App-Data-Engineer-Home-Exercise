

with dau as (
    select
        event_date,
        dau
    from
        {{ ref('dau') }}
),
mau as (
    select
        event_month,
        mau
    from
        {{ ref('mau') }}
)
select
    mau.event_month,
    avg(dau.dau) as average_dau,
    mau.mau,
    avg(dau.dau) / mau.mau as dau_mau_ratio
from
    dau
join
    mau on date_trunc('month', dau.event_date) = mau.event_month
group by
    mau.event_month, mau.mau
order by
    mau.event_month