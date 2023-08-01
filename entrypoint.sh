#!/bin/bash

airflow db init

airflow webserver -p 8080
