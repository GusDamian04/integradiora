from flask import render_template, request, redirect
from conexion import conector_db

# conector = conector_db()
# cursor = conector.cursor()

def add_products():
    if request.method == 'POST':
        name = request.form['name']
        price = request.form['price']
        stock = request.form['stock']
        category = request.form['category']
        brand = request.form['brand']

        conector = conector_db()
        cursor = conector.cursor()
        consult = "INSERT INTO products (name, price, stock, category, brand) VALUES (%s, %s, %s, %s, %s)"
        cursor.execute(consult, (name, price, stock, category, brand))
        conector.commit()
        cursor.close()
        conector.close()

        return redirect('/select_product')

    return render_template('add_product.html')

def select_product():
    conector = conector_db()
    cursor = conector.cursor()

    consult = "SELECT * FROM products "
    cursor.execute(consult)

    product_tuplas = cursor.fetchall()

    cursor.close()
    conector.close()

    product = [{'id_product': product[0], 'name': product[1], 'price': product[2], 'stock': product[3], 'category': product[4], 'brand': product[5]} for product in product_tuplas]

    return product

def get_product_by_id(id_product):
    conector = conector_db()
    cursor = conector.cursor()

    consult = "SELECT * FROM products WHERE id_product = %s"
    cursor.execute(consult, (id_product,))
    product = cursor.fetchone()

    cursor.close()
    conector.close()

    return product

def update_products(id_product):
    if request.method == 'POST':
        name = request.form['name']
        price = request.form['price']
        stock = request.form['stock']
        category = request.form['category']
        brand = request.form['brand']

        conector = conector_db()
        cursor = conector.cursor()
        consulta = "UPDATE products SET name = %s, price = %s, stock = %s, category = %s, brand = %s WHERE id_product = %s"
        cursor.execute(consulta, (name, price, stock, category, brand, id_product))
        conector.commit()
        cursor.close()
        conector.close()

        return True

    return False

def delete_product(id_product):
    conector = conector_db()
    cursor = conector.cursor()

    consulta = "DELETE FROM products WHERE id_product = %s"
    cursor.execute(consulta, (id_product,))
    conector.commit()

    cursor.close()
    conector.close()

    return True