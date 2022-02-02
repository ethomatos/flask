from flask import Flask
import mysql.connector
import os

# Get environment variables
USER = os.getenv('MYSQL_USER')
PASSWORD = os.environ.get('MYSQL_PASSWORD')
DB = os.environ.get('MYSQL_DATABASE')

def read_password():
	password = ""
	with open(PASSWORD, 'r') as psw:
		for line in psw:
			password = line.strip()
	return password

def mysql_conn(user, password, db):
	host = 'mysql'
	cnx = mysql.connector.connect(user=user, password=password, host=host, database=db)
	return cnx;

app = Flask(__name__)

def count_tables(cursor):
	query = ("show tables")
	cursor.execute(query)
	count = 0
	for table in cursor:
		count += 1	
	return(count)

@app.route('/count')
def counter():
	cnx = mysql_conn(USER, read_password(), DB)
	cursor = cnx.cursor()
	query = ("show tables")
	cursor.execute(query)
	tables = ""
	for	table in cursor:
		for field in table:
			tables = tables + "_" + field
	cursor.close()
	cnx.close()
	return "Tables in the database: " + tables

@app.route('/')
def hello_world():
	cnx = mysql_conn(USER, read_password(), DB)
	cursor = cnx.cursor()
	return 'This is Flask running in a Docker container querying a MySQL container with ' + str(count_tables(cursor)) + ' tables'
	cursor.close()
	cnx.close()

if __name__ == '__main__':
	app.run(debug=True, host='0.0.0.0')
