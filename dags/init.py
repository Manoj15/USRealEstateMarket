import os
import pandas as pd
from airflow import DAG
from airflow.operators.python import PythonOperator, BranchPythonOperator
from airflow.operators.bash import BashOperator
from airflow.operators.dummy_operator import DummyOperator
from datetime import datetime

def write_csv_without_blank(df, file):
    df.to_csv(file, index = False,line_terminator="")
    file_data = open(file, 'rb').read()
    open(file, 'wb').write(file_data[:-1])

def source_data():

    dir = '/opt/airflow/dbt/data/'
    for f in os.listdir(dir):
        os.remove(os.path.join(dir, f))
    
    df_1 = pd.read_csv('data/RDC_Inventory_Core_Metrics_Zip.csv', skipfooter=1)
    df_2 = pd.read_csv('data/RDC_Inventory_Hotness_Metrics_Zip_History.csv', skipfooter=1)

    # df_1.to_csv('/opt/airflow/dbt/data/RDC_Inventory_Core_Metrics_Zip.csv', index = False)
    write_csv_without_blank(df_1, '/opt/airflow/dbt/data/RDC_Inventory_Core_Metrics_Zip.csv')
    # df_2.to_csv('/opt/airflow/dbt/data/RDC_Inventory_Hotness_Metrics_Zip_History.csv', index = False)
    write_csv_without_blank(df_2, '/opt/airflow/dbt/data/RDC_Inventory_Hotness_Metrics_Zip_History.csv')

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime.now(),
    'retries': 0
}


with DAG('0_source_data', default_args=default_args, schedule_interval='@once') as dag:

    task_0 = PythonOperator(
        task_id='source_data',
        python_callable=source_data,
        dag=dag
    )

    task_1 = BashOperator(
        task_id='load_seed_data_once',
        bash_command='cd /opt/airflow/dbt && dbt seed --profiles-dir . --no-version-check',
        env={
            'dbt_user': '{{ var.value.dbt_user }}',
            'dbt_password': '{{ var.value.dbt_password }}',
            **os.environ
        },
        dag=dag
    )

    task_0 >> task_1