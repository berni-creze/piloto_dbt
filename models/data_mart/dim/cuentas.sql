select 
  id_bc id,
  fecha_apertura,
  leyenda::varchar leyenda,
  no_cuenta::varchar numero_cuenta,
  clv::varchar prefijo_clabe_banco,
  banco::varchar ticker_banco,
  razon_social::varchar razon_social_banco,
  clabe::varchar clabe,
  activo
from {{ ref('stg_cuentas') }}