


-- {{ config(materialized='table') }}

select * 
from {{ source('raw', 'user_events') }}