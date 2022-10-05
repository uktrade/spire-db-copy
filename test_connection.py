#!/home/vcap/deps/0/python/bin/python
import cx_Oracle
import os


ORACLE_SERVER_IP = os.environ.get("ORACLE_SERVER_IP")
SERVICE_NAME = os.environ.get("SERVICE_NAME")
PASSWORD = os.environ.get("PASSWORD")

with cx_Oracle.connect(
    user="READUSER", password=PASSWORD,
    dsn=f"{ORACLE_SERVER_IP}:1521/{SERVICE_NAME}"
) as connection:

   cursor = connection.cursor()
   cursor.execute("""
           SELECT count(*)
           FROM all_tables"""
   )
   num_tables = next(cursor)[0]

   print('Connection successful')
   print(f'Database contains {num_tables} tables')
