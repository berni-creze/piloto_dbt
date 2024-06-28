dbt-run-all:
	dbt run seed;\
	dbt run ;\
	dbt test;\
	dbt docs generate

dbt-serve:
	dbt docs serve --port 8000
