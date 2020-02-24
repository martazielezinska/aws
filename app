import json
import requests
import matplotlib.pyplot as plt
import numpy as np


URL = "https://cbcfpe5bnf.execute-api.us-east-1.amazonaws.com/wifipoint/entries"
r = requests.get(url = URL)
data = r.json()
print(len(data))


Szer = []
Dlug = []
znaczki = ['bo','go','ro','co','mo','yo','ko','y^','gs','rs','cs','ms','ys','b^','g^','r^','c^','m^']
znak = 0
ax = plt.gca()
ax.cla()
for grupa in data:
    for element in grupa:
        Szer.append(float(element['x']))
        Dlug.append(float(element['y']))
    plt.plot(Szer,Dlug,znaczki[znak])
    circle = plt.Circle((Szer[0],Dlug[0]),0.0269978401727862,color=znaczki[znak][0], fill=False)
    ax.add_artist(circle)
    Szer.clear()
    Dlug.clear()
    znak = znak + 1
plt.axis([54.1, 54.6, 18.4, 18.9])
plt.xlabel('x - szerokość geograficzna')
plt.ylabel('y - długość geograficzna')
plt.title("Rozłorzenie Hotspot-ów")
plt.show()
