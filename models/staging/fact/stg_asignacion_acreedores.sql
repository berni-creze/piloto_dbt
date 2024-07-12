{{ config(materialized='table') }}

with asac as(
    select * from {{ source('cobranza', 'acreedores_contrato_monto') }}
)

select 
  folio, 
  fecha_firma, 
  tasa, 
  plazo, 
  monto, 
  fecha_pago, 
  tag, 
  fecha_asignacion,
  fecha_salida 
from asac