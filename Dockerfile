FROM python:3.6

WORKDIR /root

RUN apt-get update

RUN pip install mysqlclient

RUN pip install apache-airflow

RUN airflow db init

RUN sed -i "s|^sql_alchemy_conn.*|sql_alchemy_conn = mysql://devops:Devops@123@airflow_db_containerr/airflowdb|g" /root/airflow/airflow.cfg

COPY entrypoint.sh /root
RUN chmod +x /root/entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]

