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
from ta 
inner join c 
on ta.id_contrato = c.id_contrato 
