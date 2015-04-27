import cv2
import numpy as np
img = cv2.imread("test.png")  
cv2.namedWindow("Image")
cv2.namedWindow("Image2")
cv2.imshow("Image", img)
emptyImage = np.zeros(img.shape, np.uint8) 
cv2.imshow("Image2", emptyImage)

cv2.waitKey (0) 
cv2.destroyAllWindows() 
