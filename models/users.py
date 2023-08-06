from flask import render_template, request, redirect
from conexion import conector_db

from werkzeug.security import check_password_hash, generate_password_hash
from flask_login import UserMixin


class User(UserMixin):

    def __init__(self, id, username, password, roll="") -> None:
        self.id = id
        self.username = username
        self.password = password
        self.roll = roll

    @classmethod
    def check_password(self, hashed_password, password):
        return check_password_hash(hashed_password, password)

#print(generate_password_hash("gustavo"))
    
def add_users():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        roll = request.form['roll']

        password = generate_password_hash(password)

        conector = conector_db()
        cursor = conector.cursor()
        consult = "INSERT INTO user (username, password, roll) VALUES (%s, %s, %s)"
        cursor.execute(consult, (username, password, roll))
        conector.commit()
        cursor.close()
        conector.close()

        return render_template('select_user.html')

    return render_template('add_user.html')

def select_user():
    conector = conector_db()
    cursor = conector.cursor()

    consult = "SELECT * FROM user "
    cursor.execute(consult)

    user_tuplas = cursor.fetchall()

    cursor.close()
    conector.close()

    user = [{'id': user[0], 'username': user[1], 'password': user[2], 'roll': user[3]} for user in user_tuplas]

    return user

def get_user_by_id(id):
    conector = conector_db()
    cursor = conector.cursor()

    consult = "SELECT * FROM user WHERE id = %s"
    cursor.execute(consult, (id,))
    product = cursor.fetchone()

    cursor.close()
    conector.close()

    return product

def update_user(id):
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        roll = request.form['roll']

        conector = conector_db()
        cursor = conector.cursor()
        consult = "UPDATE user SET username = %s, password = %s WHERE id = %s"
        cursor.execute(consult, (username, password, roll, id))
        conector.commit()
        cursor.close()
        conector.close()

        return True

    return False

def delete_user(id):
    conector = conector_db()
    cursor = conector.cursor()

    consulta = "DELETE FROM user WHERE id = %s"
    cursor.execute(consulta, (id,))
    conector.commit()

    cursor.close()
    conector.close()

    return True