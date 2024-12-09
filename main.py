import os
import sys

from PyQt6.QtCore import QUrl,QTimer,QObject,pyqtSignal,pyqtSlot
from PyQt6.QtGui import QIcon
from PyQt6.QtWidgets import QApplication
from PyQt6.QtQml import QQmlApplicationEngine
import random
import numpy as np
import json

CURRENT_DIR = os.path.dirname(os.path.realpath(__file__))

class EEGDataProvider(QObject):
    updateData = pyqtSignal(list,list, arguments=['timeData','freqData'])

    def __init__(self):
        super().__init__()
        self.channels = 21
        self.samples = 100
        self.sampling_rate = 100
        self.time_data = []
        self.freq_data = []

        self.timer = QTimer()
        self.timer.timeout.connect(self.generate_data)
        
    def update_data(self,timeData,freqData):
        self.time_data = timeData
        self.freq_data = freqData
        self.updateData.emit(self.time_data,self.freq_data)
    
    def calculate_fft(self,data):
        fft_result = np.fft.fft(data)
        freq_magnitude = np.abs(fft_result)[:len(data)//2] #only get positive freq
        return freq_magnitude

    def generate_data(self):
        fft_result = []
        timeData = [[random.uniform(-100,100) for _ in range(100) ] for _ in range(21)]
        
        for data in timeData:
            fft_result.append(self.calculate_fft(data).tolist())
        
        self.update_data(timeData,fft_result)

    @pyqtSlot(str,str,str)
    def save_data(self,name,age,label):
        data = {
            "name":name,
            "age":age,
            "label":label,
            "eeg_data":self.time_data
        }

        try:
            with open("data\\eeg_data.json","a") as json_file:
                json.dump(data,json_file,indent=4)
        except Exception as e:
            print(f"Error saving data: {e}")


    @pyqtSlot()
    def start_record_signal(self):
        if not self.timer.isActive():
            self.timer.setInterval(50)  # msecs 100 = 1/10th sec
            self.timer.start()
    
    @pyqtSlot()
    def stop_record_signal(self):
        if self.timer.isActive():
            self.timer.stop()

class ImpedanceModel(QObject):
    impedanceChaged = pyqtSignal(list,arguments=['checkImpedance'])

    def __init__(self):
        super().__init__()
        self._impedance = [0] * 21
        self.timer = QTimer()
        self.timer.timeout.connect(self.updateImpedance)
    
    @pyqtSlot()
    def startUpdating(self):
        self.timer.start(1500)

    @pyqtSlot()
    def stopUpdating(self):
        self.timer.stop()

    def updateImpedance(self):
        self._impedance = [random.uniform(20,150) for _ in range(21)]
        

if __name__ == "__main__":
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()
    eegProvider = EEGDataProvider()
    impedanceModel = ImpedanceModel()
    engine.load(QUrl.fromLocalFile(os.path.join(CURRENT_DIR, "main.qml")))
    # app.setWindowIcon(QIcon(os.path.join(CURRENT_DIR, "appicon.png")))
    engine.rootObjects()[0].setProperty("eegProvider",eegProvider)
    engine.rootObjects()[0].setProperty("impedanceModel",impedanceModel)
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
