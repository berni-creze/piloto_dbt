include .env

dbt-run-all:
	export DBT_PROFILE=${DBT_PROFILE};\
	dbt run seed;\
	dbt run ;\
	dbt test;\
	dbt docs generate

dbt-serve:
	dbt docs serve --port 8000
