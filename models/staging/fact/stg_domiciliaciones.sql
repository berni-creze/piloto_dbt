with bm as(
  select 
    * 
  from {{ source('cobranza', 'ban_mcm') }}

),
ctm as (
  select 
    * 
  from {{ source('seeds', 'cat_tipos_movimiento') }}
),
cmp as (
  select 
    * 
  from {{ source('seeds', 'cat_metodos_pago') }}
)


select
	id_bmcm
	,id_bc
	,fecha_mod
	,fecha
	,monto 
	,mxc
	,ctm.id_tm
	,ctm.tipo_movimiento::varchar
	,ctm.signo_cxc
	,ctm.signo_ban
	,cmp.metodo_pago::varchar
	,ref_clabe
	,ref_banco
	,ref_banco2
	,ref_banco3
	,observaciones
	,anexo
	,activo
from bm 
inner join ctm on bm.id_tm = ctm.id_tm
inner join cmp on bm.id_mp = cmp.id_mp