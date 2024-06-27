with bc as (
  select * from {{ source('cobranza', 'ban_cuentas') }}
),
cb as (
  select * from {{ source('cobranza', 'cat_bancos') }}
)

select 
  id_bc ,
  fecha_apertura,
  leyenda,
  no_cuenta,
  cb.clv,
  cb.banco,
  cb.razon_social,
  cb.rfc,
  clabe,
  saldo_inicial ,
  saldo,
  activo 
from bc 
inner join cb on bc.id_banco = cb.id_banco