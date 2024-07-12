with stg_calendario as (
  select 
    *
  from {{ ref('stg_calendario') }}
)

select 
  (extract(EPOCH from date)/86400)::integer AS unix_day,
  date as date,
  extract(DAY from date)::integer AS day,
  extract(MONTH from date)::integer AS month,
  extract(YEAR from date) AS year,
  to_char(date, 'YYYYMM')::integer AS period,
  extract(DOY from date)::integer AS day_of_year,
  extract(WEEK FROM date) week,
  extract(DOW from date)::integer AS day_of_week
from stg_calendario