
select 
  id_acreedor as id, 
  acreedor as nombre, 
  email as correo, 
  activo, 
  fecha_mod as fecha_creacion
from {{ ref('stg_acreedores')}}