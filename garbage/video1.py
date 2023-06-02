import cv2
import os
import numpy as np

file_path = os.path.join(os.getcwd(), 'video.mp4')
cap = cv2.VideoCapture(file_path)

ret, frame = cap.read()
frameContour = frame.copy()
frame = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
lower = np.array([158, 7, 177])
upper = np.array([179, 20, 255])
mask = cv2.inRange(frame, lower, upper)
result = cv2.bitwise_and(frame, frame, mask=mask)
frame = cv2.cvtColor(result, cv2.COLOR_BGR2GRAY)
canny = cv2.Canny(frame, 80, 150)
contours, hierarchy = cv2.findContours(canny, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)

for cnt in contours:
    cv2.drawContours(frameContour, cnt, -1, (255, 0, 0), 4)
    peri = cv2.arcLength(cnt, True)
    vertices = cv2.approxPolyDP(cnt, peri * 0.02, True)
    print(vertices)
    corners = len(vertices)
    x, y, w, h = cv2.boundingRect(vertices)
    cv2.rectangle(frameContour, (x, y), (x+w, y+h), (0, 255, 0), 4)
    if corners > 100:
        cv2.putText(frameContour, 'circle', (x, y-5), cv2.FONT_HERSHEY_SIMPLEX, 20, (0, 0, 255), 2)
    

cv2.imshow('canny', canny)
cv2.imshow('frameContour', frameContour)
cv2.waitKey(0)
