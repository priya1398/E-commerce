Download PyCharm, Python version 3 and above

Import or copy and paste the 'pythonlogin.sql' file to your MySQL-> database name "pythonlogin".

Install DB Navigator on PyCharm.
• Select File –> Settings –> Plugins
• Search and Install “DB Navigator” package

Connect PyCharm to MySQL database.
• Open DB Browser which will be under DB Navigator tab.
• Press “+” on “DB Browser” –> select ‘MySQL’
• Enter the required details host, username, password of your MySQL.
• Test the connection and press ok if the test has succeeded.

Configure python settings
• Select File –> Settings –> Project-> project interpreter
• Click the setting icon -> Add-> New environment-> Location <project file path> and basic
  
Interpreter <browse through the downloaded python.exe file>
• Click ‘OK’
• Go to ‘main.py’ file
• Select File –> Settings –> Project-> project interpreter
• Add packages for the file to run by clicking the add icon -> search for Flask, Flask-MySQLdb,
PyMySQL, mysql, pandas, sckit-learn, joblib.
• Install the above packages.
  
Run the main.py file

Open the link to view the webpage http://127.0.0.1:5000/ -> this views the index page.(before login).

Testing:
-> Once a person have the sql file imported in their database.
-> go to login page and enter -> username: gary, password:gary18.
