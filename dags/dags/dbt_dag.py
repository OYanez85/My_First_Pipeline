from cosmos import DbtDag, ProjectConfig, ProfileConfig, ExecutionConfig
from cosmos.profiles import SnowflakeUserPasswordProfileMapping

profile_config = ProfileConfig(
    profile_name="default",
    target_name="dev",
    profile_mapping=SnowflakeUserPasswordProfileMapping(
        conn_id="snowflake_conn",  # Ensure this connection ID is correctly configured
        profile_args={"database": "dbt_db", "schema": "dbt_schema"},
    ),
)

dbt_snowflake_dag = DbtDag(
    project_config=ProjectConfig("/mnt/c/Users/oscar/DBT-DAG/dags/dbt/data_pipeline"),
    operator_args={"install_deps": True},
    profile_config=profile_config,
    execution_config=ExecutionConfig(dbt_executable_path="/home/oyanez/.local/bin/dbt"),
    schedule_interval="@daily",
    start_date=datetime(2023, 9, 10),
    catchup=False,
    dag_id="dbt_dag",  # This should match what you're looking for in the UI
)



