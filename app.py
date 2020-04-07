from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
import MySQLdb.cursors


app = Flask(__name__)


app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'shuzurh5'
app.config['MYSQL_DB'] = 'e_com'

mysql = MySQL(app)


@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == "POST":
        details = request.form
        userName = details['username']
        e_mail = details['email']
        password = details['password']
        confirmpassword = details['confirmpassword']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO user_reg(Username,E_Mail,password,confirmpassword) VALUES (%s, %s,%s, %s)",
                    (userName, e_mail, password, confirmpassword))
        mysql.connection.commit()
        cur.close()
        return render_template('index.html')

    return render_template('index.html')


if __name__ == '__main__':
    app.run()