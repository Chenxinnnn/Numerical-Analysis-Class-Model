from cmath import sqrt
import numpy as np
import matplotlib.pyplot as plt

angle = np.linspace(0,2 * np.pi,150) 
x_1 = 2*np.cos(angle)
y_1 = np.sin(angle)
plt.plot(x_1, y_1, label = "2x² + 8y² - 8 = 0")

x_2 = np.linspace(-4.5,4.5,200)
y_2 = sqrt(3)/2 * x_2**2
plt.plot(x_2, y_2, label = 'y - (√3/2)x² = 0')

#tol = 1e-6
MaxIter = 5

def f(x,y):
    return np.array([2 * x**2 + 8 * y**2 - 8, y - 3**(1/2) / 2 * (x**2)])
def J(x,y):
    return np.array([[4 * x, 16 * y],[- 3**(0.5) * x,1]])
def newton(x0,a):
    x = x0
    for i in range(1,MaxIter+1):
        x = x - np.dot(np.linalg.inv(J(x[0],x[1])), f(x[0],x[1]))
        print(f"With {i} iteration(s), x = {x}, f(x)={f(x[0],x[1])}.")
        plt.scatter(x[0], x[1], c = (a/2,0.7,0.5+i/10,0.5+i/10), s = 5, label = f"the {i}th iteration of function {a} is ({x[0]:.5f},{x[1]:.5f})")
        
x0 = [2,3]
x1 = [-1.5,2]

newton(x0,1)
newton(x1,2)
plt.xlim([-2.1,2.1])
plt.ylim([-1.2,3])
plt.legend(fontsize = 5, loc='upper left')
plt.show()



