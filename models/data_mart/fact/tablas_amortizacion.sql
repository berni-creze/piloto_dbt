{{ config(materialized='incremental',unique_key='id') }}

select 
    id_ta as id
    ,folio::varchar as folio_contrato
    ,fecha_contrato
    ,monto_operado
    ,no_pago
    ,fecha_corte
    ,fecha_pago
    ,saldo_inicio as saldo_inicial 
    ,pago_total 
    ,pago_capital 
    ,intereses_ordinarios 
    ,intereses_moratorios 
    ,impuestos as pago_impuestos 
    ,saldo_insoluto as saldo_final 
    ,referencia::varchar
from {{ ref('stg_tablas_amortizacion') }}

{% if is_incremental() %}
  -- this filter will only be applied on an incremental run
  -- (uses >= to include records arriving later on the same day as the last run of this model)
  where id_ta > (select COALESCE(max(id),0) from {{this}})

{% endif %}