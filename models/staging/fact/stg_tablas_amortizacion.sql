{{ config(materialized='table',unique_key='id_ta') }}

with ta as(
    select 
        * 
    from {{ source('cobranza', 'tablas_amortizacion') }}

),
c as (
    select 
        * 
    from {{ source('cobranza', 'contratos') }}
)

select 
    ta.id_ta
    ,c.folio
    ,c.fecha_contrato
    ,c.monto_operado
    ,ta.no_pago
    ,ta.fecha_corte
    ,ta.fecha_pago
    ,ta.saldo_inicio
    ,ta.pago_total 
    ,ta.pago_capital 
    ,ta.intereses_ordinarios 
    ,ta.intereses_moratorios 
    ,ta.impuestos 
    ,ta.saldo_insoluto
    ,ta.referencia
    ,ta.saldo_capital
    ,ta.saldo_intereses
    ,ta.fecha_mod
    ,ta.fecha_ultimo_pago
    ,ta.id_factura
from ta 
inner join c 
on ta.id_contrato = c.id_contrato 


{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  -- (uses >= to include records arriving later on the same day as the last run of this model)
  where id_ta > (select COALESCE(max(id_ta),0) from {{this}})

{% endif %}