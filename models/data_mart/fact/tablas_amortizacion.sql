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
