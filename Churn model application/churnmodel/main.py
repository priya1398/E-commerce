from flask import request, render_template
from flask import jsonify
from flask import Flask
import joblib
from joblib.externals.cloudpickle import dump

app = Flask(__name__)


def predict(dataset):

    replace = {'vbad': 1, 'bad': 2, 'good': 3, 'vgood': 4, 'low': 1, 'medium': 2, 'high': 3}
    dataset = [replace[i] if i in replace else i for i in dataset]
    dt = joblib.load('dt.model')
    result = dt.predict([dataset])
    if result == 1:
        return 'Yes'
    else:
        return 'No'



def pre_process(one, two, three, four, five, six, seven):
    list = [one, two, three, four, five, six, seven]
    return list


@app.route("/predict", methods=['GET','POST'])
def run():
    prediction = ' ';
    if request.method == 'POST':
        message = request.form
        print(message)
        data = pre_process(message['delivery'], message['price'], message['website'], message['product'],
                           message['loyalty'], message['security'],message['customerservice'])
        prediction = predict(data)
        print(prediction)

    return render_template( 'predict.html' ,result=prediction);
if __name__ == '__main__':
    app.debug = True;
    app.run()