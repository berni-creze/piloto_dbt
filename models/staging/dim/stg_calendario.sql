with rango_calendario as (
  select * from {{ ref('rango_calendario') }}
)

SELECT
	generate_series(
		(select min(date) from rango_calendario), 
		(select max(date) from rango_calendario), 
	interval '1 day')::date
AS date
