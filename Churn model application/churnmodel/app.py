from flask import request
from flask import jsonify
from flask import Flask, render_template

app = Flask(__name__)


@app.route('/predict', methods=['POST'])


def hello():
    return render_template('predict.html')


if __name__ is '__main__':
    app.debug = True;
    app.run()
