import pymysql

db_host="localhost"
db_user="root"
db_password=""
db_database="papeleria"

def conector_db():
    return pymysql.connect(host=db_host, user=db_user, password=db_password, database=db_database)

conector = conector_db()
cursor = conector.cursor()

# cursor.close()
# conector.close()

