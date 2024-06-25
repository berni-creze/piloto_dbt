{{ config(materialized='table') }}

select 
    ta.id_ta as id
    ,c.folio::varchar as folio_contrato
    ,c.fecha_contrato
    ,c.monto_operado
    ,ta.no_pago
    ,ta.fecha_corte
    ,ta.fecha_pago
    ,ta.saldo_inicio as saldo_inicial 
    ,ta.pago_total 
    ,ta.pago_capital 
    ,ta.intereses_ordinarios 
    ,ta.intereses_moratorios 
    ,ta.impuestos as pago_impuestos 
    ,ta.saldo_insoluto as saldo_final 
    ,ta.referencia::varchar
from cobranza.tablas_amortizacion ta 
inner join cobranza.contratos c 
on ta.id_contrato = c.id_contrato 

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
