import joblib


def predict(dataset):
    replace = {'VERY BAD':1, 'BAD':2, 'GOOD':3, 'VERY GOOD':4, 'LOW':1, 'MEDIUM':2, 'HIGH':3}
    dataset = [replace[i] if i in replace else i for i in dataset]
    dt = joblib.load('dt.model')
    result = dt.predict([dataset])
    if result == 1:
        return True
    else:
        return False
    return result


a = predict(['GOOD', 'GOOD', 'GOOD', 'GOOD', 'MEDIUM', 'GOOD', 'GOOD'])
print(a)
