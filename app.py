from flask import Flask, render_template, request, session, redirect, url_for
import mysql.connector

app = Flask(__name__)
app.secret_key = 'dennakommeringenlistaut'

def get_connection():
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="forum"
    )
    return mydb

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        username_input = request.form['name']
        password_input = request.form['password']

        db = get_connection()
        cursor = db.cursor(dictionary=True)

        sql = "SELECT * FROM users WHERE username = %s AND password = %s"
        cursor.execute(sql, (username_input, password_input))
        user = cursor.fetchone()

        if user:
            session['user'] = user['username']
            session['email'] = user['email']
            return redirect(url_for('forum_home'))
        else:
            return "Fel användarnamn eller lösenord! <a href='/'>Försök igen</a>"
        
    return render_template('home.html')

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('index'))

@app.route('/registrera', methods=['GET', 'POST'])
def registrera():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        email = request.form['email']

        db = get_connection()
        cursor = db.cursor()

        sql = "INSERT INTO users (username, password, email) VALUES (%s, %s, %s)"
        val = (username, password, email)

        cursor.execute(sql, val)
        db.commit()

        return redirect(url_for('index'))

    return render_template('registrera.html')

@app.route('/forum')
def forum_home():
    if 'user' not in session:
        return redirect(url_for('index'))

    db = get_connection()
    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT * FROM topics")
    all_topics = cursor.fetchall()

    return render_template('forum_threads.html', topics=all_topics)

@app.route('/skapa_tråd', methods=['POST'])
def skapa_tråd():
    if 'user' in session:
        title = request.form['title']
        creator = session['user']

        db= get_connection()
        cursor = db.cursor()
        sql = "INSERT INTO topics (title, creator) VALUES (%s, %s)"
        cursor.execute(sql, (title, creator))
        db.commit()
        
    return redirect(url_for('forum_home'))

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')