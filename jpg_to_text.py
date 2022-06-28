from turtle import width
import cv2
import numpy as np

img = cv2.imread("test.jpg",0)
# print(img)
# print(img.shape)
# height, width = img.shape[:2]
# print(height)
# print(width)
# print(np.binary_repr(230,width=8))
# file = open("img.txt",'w')
# for i in range(height):
#     for j in range(width):
#         file.write(np.binary_repr(img[i][j],width=8)+"\n")
#file.write(img)
cv2.imshow("test image",img)
cv2.waitKey(0)
cv2.destroyAllWindows()