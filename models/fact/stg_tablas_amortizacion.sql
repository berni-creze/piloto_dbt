
{{ config(materialized='table',schema='stg_creze') }}

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
from cobranza.tablas_amortizacion ta 
inner join cobranza.contratos c 
on ta.id_contrato = c.id_contrato 

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
