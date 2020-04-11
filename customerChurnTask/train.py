from sklearn import tree
from sklearn.externals import joblib
from IPython.display import Image
import graphviz

file = open('modify.sql', 'r')
dataset = []
label = []
try:
    text = file.readlines()
    for line in text:
        data = line.replace('(','').replace(')','').replace('\'','').replace(' ','').replace(',\n','').replace(';','').replace('VERYGOOD','4').replace('VERYBAD','1').replace('GOOD','3').replace('BAD','2').replace('HIGH','3').replace('MEDIUM','2').replace('LOW','1').replace('YES','1').replace('NO','0')
        dataList = data.split(',')
        dataList = dataList[2:10]
        for i in range(len(dataList)):
            dataList[i] = int(dataList[i])
        dataset.append(dataList[:-1])
        label.append(dataList[7])
finally:
    file.close()

#print(dataset)
#print(label)

dt = tree.DecisionTreeClassifier()
dt = dt.fit(dataset, label)

joblib.dump(dt, 'dt.model')

with open("dt.dot", 'w') as f:
    f = tree.export_graphviz(dt, out_file=f, class_names=['Delivery', 'Price', 'Website', 'productQuality', 'Loyalty', 'Security', 'customerService'], filled=True, rounded=True,special_characters=True)  