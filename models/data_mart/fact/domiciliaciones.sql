select
	id_bmcm as id
	,id_bc as id_cuenta
	,fecha_mod as fecha_hora_mod
	,fecha as fecha_contabilizada
	,monto 
	,mxc as monto_por_conciliar
	,tipo_movimiento::varchar as tipo_movimiento
	,metodo_pago::varchar as metodo_pago 
	,ref_clabe::varchar as clabe_referencia
	,ref_banco::varchar as referencia_1
	,ref_banco2::varchar as referencia_2
	,ref_banco3::varchar as referencia_3
	,observaciones::varchar as observaciones
	,anexo::varchar as anexo
	,activo
from {{ ref('stg_domiciliaciones') }}
