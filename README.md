# Airline Data

Steps to replicate the analysis
1. Clone the repo 
  ```git clone git@github.com:kailasprasannakumar/airline_data.git```
2. Change directory to bi_project
3. Start the docker container
    ```docker compose up -d```
4. Copy the jupyter token using the command  ```docker logs jupyter```
5. Connect to [http://localhost:8888](http://localhost:8888)
6. Copy the Airline Data in the following directory -  bi_project/jupyter/jovyan/
7. Run ```airline_data.ipynb``` to transfer the clean and transfer the data to the mentioned postgres database
8. Once done ```bash postgres_tasks.sh``` should give the results for the tasks
9. Metabase KPI queries are in the ```metabase_kpi.sql``` file.

The init.sql file contains the postgres DDL
