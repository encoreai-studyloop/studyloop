import pickle
import sys
import numpy as np

def kmeans(data):
    model = pickle.load(open("/Users/joon/Desktop/webproject/studyloop/WebContent/data1Cluster.model", 'rb'))
    f = open("/Users/joon/Desktop/webproject/studyloop/WebContent/meanstd.txt", "r")
    mean = f.readline()
    std = f.readline()
    f.close()
    mean = np.array(mean.replace("\n", "").split(",")).astype('float64')
    std = np.array(std.split(",")).astype('float64')
    data -= mean
    data /= std
    cluster = model.predict(data)
    f = open("/Users/joon/Desktop/webproject/studyloop/WebContent/cluster.txt", "w")
    f.write(str(cluster[0]))
    f.close()
    print(cluster[0])
    return str(cluster[0])

f = open("/Users/joon/Desktop/webproject/studyloop/WebContent/views/search/mydata.txt", "r")
data = f.readline().split(",")
kmeans(np.array([[float(data[0]),float(data[1]),float(data[2]),float(data[3]),float(data[4]),float(data[5])]]))
