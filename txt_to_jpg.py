import numpy as np
from PIL import Image as im
  
# define a main function
def save_image(array,name):
    print(array)
      
    # creating image object of
    # above array
    data = im.fromarray(array.astype('uint8'),'L')
      
    # saving the final output 
    # as a PNG file
    data.save(name)

def binary_to_dec(binary):
    binary1 = binary
    decimal, i, n = 0, 0, 0
    while(binary != 0):
        dec = binary % 10
        decimal = decimal + dec * pow(2, i)
        binary = binary//10
        i += 1
    return decimal 
  
def make_array(file):
    ls = list()
    for line in file:
        #print(type(line))
        print(line)
        line = line.strip()
        #print(type(line))
        print(line)
        ls.append(int(line,2))
        #ls.append(binary_to_dec(line.strip))
    ls_np = np.array(ls)
    ls_np = np.reshape(ls_np,(256,256))
    return ls_np



file_0 = open("output.txt")
# file_1 = open("dec_brightness.txt")
# file_2 = open("threshold.txt")
# file_3 = open("invert.txt")
img_array_0 = make_array(file_0)
# img_array_1 = make_array(file_1)
# img_array_2 = make_array(file_2)
# img_array_3 = make_array(file_3)
save_image(img_array_0,"output.jpeg")
# save_image(img_array_1,"dec_brightness.jpg")
# save_image(img_array_2,"threshold.jpg")
# save_image(img_array_3,"invert.jpg")