import pickle
import numpy as np
model = pickle.load(open("/Users/joon/Desktop/webproject/studyloop/WebContent/data2DL.model", 'rb'))
data = np.array([[0,1,2,1,28,0.1,0,4.0,1.5,1.0,0.5,2000]])
data -= pickle.load(open("/Users/joon/Desktop/webproject/studyloop/WebContent/mean.dl", 'rb'))
data /= pickle.load(open("/Users/joon/Desktop/webproject/studyloop/WebContent/std.dl", 'rb'))
print(model.predict(data)[0][0])