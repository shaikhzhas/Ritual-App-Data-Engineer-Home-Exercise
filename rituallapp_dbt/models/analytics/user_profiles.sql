


-- {{ config(materialized='table') }}

select
    user_id,
    signup_date,
    coalesce(last_login_date,signup_date) as last_login_date,
    datediff(
        'day',
        cast(signup_date as date),
        cast(coalesce(last_login_date,signup_date) as date)
    ) as engagement_duration
from {{ source('raw', 'user_profiles') }}