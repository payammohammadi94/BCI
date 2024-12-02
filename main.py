


import os
import sys

from PyQt6.QtCore import QUrl,QTimer,QObject,pyqtSignal,pyqtSlot
from PyQt6.QtGui import QIcon
from PyQt6.QtWidgets import QApplication
from PyQt6.QtQml import QQmlApplicationEngine
import random

CURRENT_DIR = os.path.dirname(os.path.realpath(__file__))

class EEGDataProvider(QObject):
    updateData = pyqtSignal(list, arguments=['data'])

    def __init__(self):
        super().__init__()
        self.timer = QTimer()
        self.timer.timeout.connect(self.generate_data)
        
        # Define timer
    def generate_data(self):
        data = [[random.uniform(-100,100) for _ in range(100) ]for _ in range(21)]
        self.updateData.emit(data)

    @pyqtSlot()
    def start_record_signal(self):
        if not self.timer.isActive():
            self.timer.setInterval(2000)  # msecs 100 = 1/10th sec
            self.timer.start()
    
    @pyqtSlot()
    def stop_record_signal(self):
        if self.timer.isActive():
            self.timer.stop()


if __name__ == "__main__":
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()
    eegProvider = EEGDataProvider()


    engine.load(QUrl.fromLocalFile(os.path.join(CURRENT_DIR, "main.qml")))
    # app.setWindowIcon(QIcon(os.path.join(CURRENT_DIR, "appicon.png")))
    engine.rootObjects()[0].setProperty("eegProvider",eegProvider)
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
