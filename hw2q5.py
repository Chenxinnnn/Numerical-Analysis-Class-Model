import numpy as np                          #import numpy
R = np.zeros((4,4))                         #set up initial matrix R with all zeros
A = [[2, 1, 1/2, 1/4],                      #enter matrix A
    [1, 4, 1, 1/2],
    [1/2, 1, 4, 1],
    [1/4, 1/2, 1, 2]]

flag = True 
for i in range(0,4):                        #Start a loop for rows
    for j in range(0, i+1):                 #Start a loop for columns
        if flag == True:
            sumij = sum(R[i][k] * R[j][k] for k in range(0, j))  
            if i == j:                      #Algorism for diagnal entries
                if A[j][j]- sumij >= 0:     #Only conduct the algorism when we have valid square root
                    R[i][j] = (A[j][j]-sumij)**(1/2)
                    
                else:
                    print("Quantity under the square root is negative")
                    flag = False
                    break
                
            else:
                R[i][j] = 1/R[j][j] * (A[i][j] - sumij)
                #Algorism for the other entries

if flag == True:
    print(R)    #When we complete the whole algorism withour invalid entries, print out matrix R.


