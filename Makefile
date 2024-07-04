include .env

dbt-run-all:
	export DBT_HOST=${DBT_HOST};\
	export DBT_USER=${DBT_USER};\
	export DBT_PASSWORD=${DBT_PASSWORD};\
	export DBT_SCHEMA=${DBT_SCHEMA};\
	export DBT_DATABASE=${DBT_DATABASE};\
	echo "Running Seeds";\
	dbt seed;\
	echo "Running Dimension Models in Staging";\
	dbt run --models stg_cuentas;\
	echo "Running Dimension Models in Data Mart";\
	dbt run --models cuentas;\
	echo "Running Fact Models in Staging";\
	dbt run --models stg_domiciliaciones,stg_tablas_amortizacion;\
	echo "Running Fact Models Data Mart";\
	dbt run --models domiciliaciones,tablas_amortizacion,historico_tablas_amortizacion;\
	echo "Running Tests";\
	dbt test;\
	echo "Creating Documents";\
	dbt docs generate

dbt-serve:
	dbt docs serve --port 8000

