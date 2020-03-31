import operator

import MySQLdb
from flask import Flask, render_template, request, redirect, url_for, session
import pymysql.cursors
import MySQLdb.cursors

from sklearn.preprocessing import LabelEncoder
from sklearn.metrics.pairwise import cosine_similarity
from sklearn.feature_extraction.text import CountVectorizer
import pandas as pd
from numpy import dot
from numpy.linalg import norm
import numpy as np

import re, math
from collections import Counter


def short(i):
    y=i.replace(' ','')
    z=y.lower()
    return z

app = Flask(__name__)

# Change this to your secret key (can be anything, it's for extra protection)
app.secret_key = '1a2b3c4d5e'

# Enter your database connection details below
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'puppy13'
app.config['MYSQL_DB'] = 'pythonlogin'

mysql = pymysql.connect(host='localhost',
                         user='root',
                         password='puppy13',
                         db='pythonlogin',
                         charset='utf8mb4',
                         cursorclass=pymysql.cursors.DictCursor)

# http://localhost:5000/pythonlogin/ - this will be the login page, we need to use both GET and POST requests
@app.route('/login', methods=['GET', 'POST'])
def login():
    # Output message if something goes wrong...
    msg = ''
    # Check if "username" and "password" POST requests exist (user submitted form)
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form:
        # Create variables for easy access
        username = request.form['username']
        password = request.form['password']
        # Check if account exists using MySQL
        cursor = mysql.cursor(pymysql.cursors.DictCursor)
        cursor.execute('SELECT * FROM accounts WHERE username = %s AND password = %s', (username, password))
        # Fetch one record and return result
        account = cursor.fetchone()
        # If account exists in accounts table in out database
        if account:
            # Create session data, we can access this data in other routes
            session['loggedin'] = True
            session['id'] = account['id']
            session['username'] = account['username']
            # Redirect to home page
            return redirect(url_for('home'))
        else:
            # Account doesnt exist or username/password incorrect
            msg = 'Incorrect username/password!'
            return render_template('login.html', msg='Incorrect username/password!')
    return render_template('login.html', msg='')


# http://localhost:5000/pythonlogin/register - this will be the registration page,
# we need to use both GET and POST requests
@app.route('/register', methods=['GET', 'POST'])
def register():
    # Output message if something goes wrong...
    msg = ''
    # Check if "username", "password" and "email" POST requests exist (user submitted form)
    if request.method == \
            'POST' and 'username' in request.form and 'password' in request.form and 'email' in request.form:
        # Create variables for easy access
        username = request.form['username']
        password = request.form['password']
        email = request.form['email']
        # Check if account exists using MySQL
        cursor = mysql.cursor(pymysql.cursors.DictCursor)
        cursor.execute('SELECT * FROM accounts WHERE username = %s OR email = %s', (username, email))
        account = cursor.fetchone()
        # If account exists show error and validation checks
        if account:
            msg = 'Account already exists!'
        elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):
            msg = 'Invalid email address!'
        elif not re.match(r'[A-Za-z0-9]+', username):
            msg = 'Username must contain only characters and numbers!'
        elif not username or not password or not email:
            msg = 'Please fill out the form!'
        else:
            # Account doesnt exists and the form data is valid, now insert new account into accounts table
            cursor.execute('INSERT INTO accounts VALUES (NULL, %s, %s, %s)', (username, password, email))
            mysql.connection.commit()
            msg = 'You have successfully registered!'
    elif request.method == 'POST':
        # Form is empty... (no POST data)
        msg = 'Please fill out the form!'
    # Show registration form with message (if any)
    return render_template('register.html', msg=msg)

# http://localhost:5000/pythinlogin/home - this will be the home page, only accessible for loggedin users
@app.route('/home')
def home():
    # Check if user is loggedin
    if 'loggedin' in session:
        # User is loggedin show them the home page
        cursor = mysql.cursor(pymysql.cursors.DictCursor)


        # Get all the movies for the user based on rated and non rated
        cursor.execute('select a.movieId,a.movieTitle,a.imdbId,a.movieDirector,a.movieProtagonist,a.movieGenre,a.movieRank,a.avg_rating AS user_rating,b.avg_rating,b.total_ratings,a.flag FROM ((SELECT DISTINCT movieId,movieTitle,imdbId,movieDirector,movieProtagonist,movieGenre,movieRank,AVG(IMDBRating) AS avg_rating, COUNT(DISTINCT b.fkCustomerid) AS total_ratings,"Not-Rated" AS flag FROM movies a LEFT JOIN movieRatings b ON a.movieId = b.fkmovieId WHERE movieId NOT IN (SELECT DISTINCT movieId FROM movies a LEFT JOIN movieRatings b ON a.movieId = b.fkmovieId WHERE b.fkCustomerid = %s) GROUP BY 1,2,3,4,5,6,7 ORDER BY 1,2,3,4,5,6,7) UNION (SELECT DISTINCT movieId,movieTitle,imdbId,movieDirector,movieProtagonist,movieGenre,movieRank,AVG(rating) AS avg_rating, COUNT(DISTINCT b.fkCustomerid) AS total_ratings,"Rated" AS flag FROM movies a LEFT JOIN movieRatings b ON a.movieId = b.fkmovieId WHERE b.fkCustomerid = %s GROUP BY 1,2,3,4,5,6,7 ORDER BY 1,2,3,4,5,6,7)) a INNER JOIN (SELECT DISTINCT fkmovieID,COUNT(DISTINCT fkCustomerId) as total_ratings,AVG(IMDBrating) AS avg_rating FROM movieRatings a INNER JOIN movies b ON a.fkmovieId = b.movieID GROUP BY 1) b ON a.movieId = b.fkmovieId',
                       (session['id'],session['id']))
        cur = mysql.cursor(pymysql.cursors.DictCursor)
        cur.execute("select * from movies ")
        data = cur.fetchall()
        cur1 = mysql.cursor(pymysql.cursors.DictCursor)
        cur1.execute("select * from movies where movieRank <= 10  ")
        data1 = cur1.fetchall()


        #  STEP 1: Store in Data Frame
        results = []
        for row in cursor.fetchall():
            keys = (row.keys())
            results.append(list(row.values()))
        df = pd.DataFrame(results, columns=keys)

        #Step 2: Use a CountVectorizer that will create a matrix (50,50) with each movie against every movie with the count of similarity in terms of words
        count = CountVectorizer()
        count_matrix = count.fit_transform(df['movieDirector'].apply(short)+' '+df['movieProtagonist'].apply(short)+' '+df['movieGenre'].apply(short)+' '+(0.5 * round((df['avg_rating']).astype(float))/0.5).astype(str) )

        # the cosine similary is based on the count of similarity of each

        cos_sims = cosine_similarity(count_matrix, count_matrix)
        #cosine_sim1 = cosine_similarity(count_matrix1, count_matrix1)

        # Initialize the recommended movies
        recommended_movies1 = []

        # For each movie that was rated by the user
        df_rated = df.loc[df['flag'] == 'Rated']
        for index1,row1 in df_rated.iterrows():

            # find the cosine similarity of all the movies for this specific movie
            score_series = pd.Series(cos_sims[index1]).sort_values(ascending=False)

            # find the user rating for this specific movie
            movie_rated = round(float(df.iloc[index1]['user_rating'])*0.1,2)

            # ensuring we are only including movies that are not rated already
            for x,y in score_series.iteritems():
                if df.iloc[x]['flag'] == 'Not-Rated':
                    #multiply the cosine similarity with the user rating which is our weight to ensure that high rated movies are given more preference
                    recommended_movies1.append((x,y*movie_rated))


        # The following code ranks each movie
        sorted_by_second = sorted(recommended_movies1, key=lambda tup: tup[1],reverse=True)
        list_ranked = []
        for x in range(0,len(sorted_by_second)):
            if sorted_by_second[x][0] not in list_ranked:
                list_ranked.append(sorted_by_second[x][0])

        rank = 1
        for x in list_ranked:
            results[x].append(rank)
            rank+=1
        return render_template('home.html',username=session['username'],movieContent=results,data=data,data1=data1)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

@app.route('/index')
def index():

    cur = mysql.cursor(pymysql.cursors.DictCursor)
    cur.execute("select * from movies order by  RAND() ")
    data = cur.fetchall()
    cur1 = mysql.cursor(pymysql.cursors.DictCursor)
    cur1.execute("select * from movies where movieRank <= 10  ")
    data1 = cur1.fetchall()
    return render_template('index.html',  data=data,data1=data1)



if __name__ =='__main__':
	app.run()









