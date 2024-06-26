select 
    d_ta as id
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
    ,saldo_capital
    ,saldo_intereses
    ,fecha_mod as fecha_hora_actualizacion
    ,fecha_ultimo_pago
    ,id_factura
from {{ ref('stg_tablas_amortizacion') }}
