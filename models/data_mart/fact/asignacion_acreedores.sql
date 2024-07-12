{{ config(materialized='incremental',unique_key='id') }}

select
  concat (regexp_replace(folio, '[^0-9]', '', 'g'), to_char(fecha_firma, 'YYYYMMDD'))::bigint as id,
  folio, 
  fecha_firma, 
  tasa, 
  plazo, 
  monto, 
  fecha_pago, 
  tag as acreedor,
  fecha_asignacion,
  fecha_salida 
from {{ ref('stg_asignacion_acreedores') }}

{% if is_incremental() %}
  -- this filter will only be applied on an incremental run
  -- (uses >= to include records arriving later on the same day as the last run of this model)
  where concat (regexp_replace(folio, '[^0-9]', '', 'g'), to_char(fecha_firma, 'YYYYMMDD'))::bigint <> (select COALESCE(max(id),0) from {{this}})

{% endif %}