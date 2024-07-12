include .env

dbt-run-all:
	export DBT_HOST=${DBT_HOST};\
	export DBT_USER=${DBT_USER};\
	export DBT_PASSWORD=${DBT_PASSWORD};\
	export DBT_SCHEMA=${DBT_SCHEMA};\
	export DBT_DATABASE=${DBT_DATABASE};\
	echo "Running Seeds";\
	dbt seed;\
	echo "Running Cuentas";\
	dbt run --models stg_cuentas;\
	dbt run --models cuentas;\
	echo "Running Domiciliaciones";\
	dbt run --models stg_domiciliaciones;\
	dbt run --models domiciliaciones;\
	echo "Running Tablas Amortizacion";\
	dbt run --models stg_tablas_amortizacion;\
	dbt run --models tablas_amortizacion;\
	dbt run --models historico_tablas_amortizacion;\
	echo "Running Asignacion Acreedores";\
	dbt run --models stg_acreedores;\
	dbt run --models acreedores;\
	dbt run --models stg_asignacion_acreedores;\
	dbt run --models asignacion_acreedores;\
	echo "Running Tests";\
	dbt test;\
	echo "Creating Documents";\
	dbt docs generate;\

dbt-serve:
	dbt docs serve --port 8000

