{{ config(materialized='incremental',unique_key='id_bmcm')}}

with bm as(
  select 
    * 
  from {{ source('cobranza', 'ban_mcm') }}

),
ctm as (
  select 
    * 
  from {{ ref('cat_tipos_movimiento') }}
),
cmp as (
  select 
    * 
  from {{ ref('cat_metodos_pago') }}
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

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  -- (uses >= to include records arriving later on the same day as the last run of this model)
  where id_bmcm > (select COALESCE(max(id_bmcm),0) from {{this}})

{% endif %}