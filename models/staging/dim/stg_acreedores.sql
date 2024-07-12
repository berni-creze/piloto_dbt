with ac as (
    select * from {{ source ('cobranza', 'acreedores') }}
)

select 
  id_acreedor, 
  acreedor, 
  email, 
  activo, 
  fecha_mod 
from ac 
