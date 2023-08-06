from flask import render_template, request
from conexion import conector_db

def add_sales():
    if request.method == 'POST':
        id_user = request.form['id_user']
        id_product = request.form['id_product']
        amount = request.form['amount']
        total = request.form['total']
        date = request.form['date']

        conector = conector_db()
        cursor = conector.cursor()
        consult = "INSERT INTO sale (id_user, id_product, amount, total, date) VALUES (%s, %s, %s, %s, %s)"
        cursor.execute(consult, (id_user, id_product, amount, total, date))
        conector.commit()
        cursor.close()
        conector.close()

        return render_template('admin.html')

    return render_template('add_sale.html')

def select_sale():
    conector = conector_db()
    cursor = conector.cursor()

    consult = "SELECT sale.ticket, user.username, products.name, sale.amount, sale.total, sale.date FROM sale INNER JOIN user ON user.id = sale.id_user INNER JOIN products ON products.id_product = sale.id_product;"
    # consult = "SELECT * FROM sale "
    cursor.execute(consult)

    sale_tuplas = cursor.fetchall()

    cursor.close()
    conector.close()

    sale = []
    for sale_tuple in sale_tuplas:
        if len(sale_tuple) >= 6:
            sale.append({'ticket': sale_tuple[0], 'id_user': sale_tuple[1], 'id_product': sale_tuple[2], 'amount': sale_tuple[3], 'total': sale_tuple[4], 'date': sale_tuple[5]})
    return sale

def select_sale_date():
    dates = request.form['date']
    conector = conector_db()
    cursor = conector.cursor()

    consult = f"SELECT sale.ticket, user.username, products.name, sale.amount, sale.total, sale.date FROM sale INNER JOIN user ON user.id = sale.id_user INNER JOIN products ON products.id_product = sale.id_product WHERE sale.date = '{dates}';"
    cursor.execute(consult,)

    sale_tuplas = cursor.fetchall()
    #sale_tuplas = consult

    cursor.close()
    conector.close()

    sale = []
    for sale_tuple in sale_tuplas:
        if len(sale_tuple) >= 6:
            sale.append({'ticket': sale_tuple[0], 'id_user': sale_tuple[1], 'id_product': sale_tuple[2], 'amount': sale_tuple[3], 'total': sale_tuple[4], 'date': sale_tuple[5]})
    return sale and render_template('select_sale_date.html')