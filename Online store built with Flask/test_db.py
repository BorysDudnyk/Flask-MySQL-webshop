import yaml
import mysql.connector
from mysql.connector import Error

# Зчитування параметрів з файлу database.yaml
with open("database.yaml", 'r') as file:
    config = yaml.safe_load(file)

mysql_host = config['mysql_host']
mysql_user = config['mysql_user']
mysql_password = config['mysql_password']
mysql_db = config['mysql_db']

connection = None
try:
    connection = mysql.connector.connect(
        host=mysql_host,
        user=mysql_user,
        password=mysql_password,
        database=mysql_db
    )

    if connection.is_connected():
        print("Успішно підключено до бази даних!")

except Error as e:
    print(f"Помилка при підключенні: {e}")

finally:
    if connection is not None and connection.is_connected():
        connection.close()
        print("Підключення закрито")