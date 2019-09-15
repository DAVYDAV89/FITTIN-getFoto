
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSlot

import threading
def thread(func):
    def wrapper(*args, **kwargs):
        threading.Thread(target=func, args=args, kwargs=kwargs).start()
    return wrapper

import cv2
class Camera(QObject):
    def __init__(self):
        QObject.__init__(self)

    @pyqtSlot()
    def cameraON(self):
        cameraUSE = threading.Thread(name='cameraUSE', target=camera.cameraUSE)
        cameraUSE.start()
        cameraUSE.join()

        global img

        while cap.isOpened():
            red, img = cap.read()

            cv2.imshow('Image', img)

            key = cv2.waitKey(50) & 0xFF
            if key == 27:
                break

        cap.release()
        cv2.destroyAllWindows()

    def cameraUSE(self):
        global cap
        cap = cv2.VideoCapture(0)

    @pyqtSlot()
    def saveImage(self):
        camera.save()

    @thread
    def save(self):
        cv2.imwrite("saveFoto/" + str(threading.currentThread().name)+".png", img)

    @pyqtSlot()
    def cameraOF(self):
        cap.release()
        cv2.destroyAllWindows()

if __name__ == "__main__":
    import sys

    global counter
    counter = 0

    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    camera = Camera()
    engine.rootContext().setContextProperty("camera", camera)
    engine.load("main.qml")

    engine.quit.connect(app.quit)
    sys.exit(app.exec_())




