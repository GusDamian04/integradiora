# flask
from flask import Flask, render_template, request, redirect, url_for, flash
from flask_mysqldb import MySQL
from flask_wtf.csrf import CSRFProtect
from flask_login import LoginManager, login_user
# Conector
from config import config
# Models:
from models.products import add_products, select_product, update_products, get_product_by_id, delete_product
from models.users import add_users, select_user, update_user, get_user_by_id, delete_user
from models.sale import add_sales, select_sale, select_sale_date
from models.ModelUser import ModelUser
# Entities:
from models.entities.User import User

app = Flask(__name__)

csrf = CSRFProtect()
db = MySQL(app)
login_manager_app = LoginManager(app)

@login_manager_app.user_loader
def load_user(id):
    return ModelUser.get_by_id(db, id)

@app.route('/')
def index():
    return render_template('/home.html')

@app.route('/home')
def home():
    return render_template('/home.html')

@app.route('/catalogue')
def catalogue():
    return render_template('/catalogue.html')

@app.route('/contact')
def contact():
    return render_template('/contact.html')

@app.route('/login')
def loginu():
    return render_template('/login.html')

@app.route('/homeadmin')
def admin():
    return render_template('/admin.html')

@app.route('/catalogueadm')
def cataloge():
    return render_template('/catalogueadm.html')

@app.route('/addproduct')
def addproduct():
    return render_template('/add_product.html')

@app.route('/add_product', methods=['GET', 'POST'])
def add_product():
    return add_products()

@app.route('/product')
def select_products():
    return render_template('select_product.html', products=select_product())

@app.route('/select_product')
def selects_product():
    return render_template('select_product.html', products=select_product())

@app.route('/update_product/<int:id_product>', methods=['POST'])
def process_update_product(id_product):
    result = update_products(id_product)
    if result:
        return render_template('admin.html')
    else:
        return render_template('error.html')

@app.route('/update_product/<int:id_product>')
def update_product(id_product):
    product_details = get_product_by_id(id_product)
    print(product_details)
    return render_template('update_product.html', product=product_details)

@app.route('/delete_product/<int:id_product>', methods=['POST'])
def process_delete_product(id_product):
    result = delete_product(id_product)
    if result:
        return render_template('admin.html')
    else:
        return render_template('error.html')

@app.route('/adduser')
def adduser():
    return render_template('/add_user.html')

@app.route('/add_user', methods=['GET', 'POST'])
def add_user():
    return add_users()

@app.route('/user')
def select_users():
    return render_template('select_user.html', user=select_user())

@app.route('/select_product')
def selects_user():
    return render_template('select_user.html', products=select_user())

@app.route('/update_user/<int:id>', methods=['POST'])
def process_update_user(id):
    result = update_user(id)
    if result:
        return render_template('admin.html')
    else:
        return render_template('error.html')

@app.route('/update_user/<int:id>')
def update_user(id):
    user_details = get_user_by_id(id)
    print(user_details)
    return render_template('update_user.html', user=user_details)

@app.route('/delete_user/<int:id>', methods=['POST'])
def process_delete_user(id):
    result = delete_user(id)
    if result:
        return render_template('admin.html')
    else:
        return render_template('error.html')

@app.route('/addsale')
def addsale():
    return render_template('/add_sale.html')

@app.route('/add_sale', methods=['GET', 'POST'])
def add_sale():
    return add_sales()

@app.route('/sale')
def select_sales():
    return render_template('select_sale.html', sale=select_sale())

@app.route('/select_sale')
def selects_sales():
    return render_template('select_sale.html', sale=select_sale())

@app.route('/select_sale_date', methods=['GET', 'POST'])
def select_sale_dates():
    return select_sale_date()

@app.route('/sale_date')
def sale_date():
    return render_template('/sale_date.html')

# @app.route('/select_product')
# def selects_product():
#     return render_template('select_product.html', products=select_product())

@app.route('/homeemployee')
def employee():
    return render_template('/employee.html')

@app.route('/catalogueemp')
def catalogeemp():
    return render_template('/catalogueemp.html')

csrf = CSRFProtect()

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        # print(request.form['username'])
        # print(request.form['password'])
        user = User(0, request.form['username'], request.form['password'])
        logged_user = ModelUser.login(db, user)
        if logged_user != None:
            if logged_user.password:
                login_user(logged_user)
                if logged_user.roll == 'adm':
                    return render_template('/admin.html')
                elif logged_user.roll == 'emp':
                    return render_template('/employee.html')
                else:
                    flash("Unknown role...")
                    return render_template('/login.html')
            else:
                flash("Contrasña incorrecta...")
                return render_template('/login.html')
        else:
            flash("Usuario no encontrado...")
            return render_template('/login.html')
    else:
        return render_template('/login.html')

def status_401(error):
    print(error)
    return redirect(url_for('login'))

def status_404(error):
    return "<h1>Página no encontrada</h1>", 404


if __name__ == '__main__':
    app.config.from_object(config['development'])
    csrf.init_app(app)
    app.register_error_handler(401, status_401)
    app.register_error_handler(404, status_404)
    app.run()