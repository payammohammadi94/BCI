import QtQuick 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15
ApplicationWindow {
    property color slideColor: "#092145"

    property bool deviceStatus: false
    property QtObject eegProvider: eegProvider



    id:mainWindow
    visible: true
    width: 1300
    height: 800
    title: "BCI 1.0V"



    Image {
        anchors.fill: parent
        source: "./images/home_background.jpeg" // مسیر عکس
        fillMode: Image.PreserveAspectCrop
    }


    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: firstPage
    }

    //first page
    Component {
        id: firstPage
        Rectangle {
            width: parent.width
            height: parent.height
            color: "transparent" // شفاف برای نشان دادن بک‌گراند
            Text {
                id: projectName
                text: qsTr("Brain Computer Interface")
                font.family: "Arial"
                font.pointSize: 24
                font.bold:true
                color: "black"
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: 100
            }
            Text {
                id: centerName
                text: qsTr("Electronic warfare & Cybernetics Research Center   ")
                font.family: "Arial"
                font.pointSize: 20
                font.bold:true
                color: "gray"
                anchors{
                    top: projectName.bottom
                    left:projectName.left
                    topMargin: 10
                }
            }
            Button {
                id:startAppButtonId
                anchors{
                    top: centerName.bottom
                    topMargin: 10
                    left: centerName.left
                    leftMargin: 0
                }
                width: 120
                height: 40
                background: Rectangle{
                    color: "gray"
                    radius: 10
                }
                // تنظیم رنگ متن
                contentItem: Text {
                    text: qsTr("Start app")
                    color: "white" // رنگ متن
                    font.pixelSize: parent.font.pixelSize
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: stackView.push(secondPage)
            }

        }
    }
    //second page
    Component {
        id: secondPage
        Rectangle {
            width: parent.width
            height: parent.height
            color: "transparent"

            //device on off status
            Rectangle{
                width: 40
                height: 40
                color: "#F1F0E8"
                anchors{
                    top:parent.top
                    topMargin: 100
                    left: parent.left
                    leftMargin: parent.width/4 +540
                }

                Image {
                    id: onOffDeviveIconId
                    source: deviceStatus ? "./images/correct.png" : "./images/remove.png"
                    fillMode: Image.PreserveAspectCrop
                    anchors.fill: parent
                }
                Text {
                    id: deviceOnOffTextId
                    text: deviceStatus?qsTr("device is connected."):qsTr("Device is not connected.")
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold:true
                    color: "black"
                    anchors{
                        top: onOffDeviveIconId.bottom
                        topMargin: 15
                        horizontalCenter: parent.horizontalCenter
                    }
                }
            }



            Rectangle{
                id:slide1Id
                width: 250
                height: 250
                color: slideColor
                radius: 15
                anchors{
                    top:parent.top
                    topMargin: 210
                    left: parent.left
                    leftMargin: parent.width/4 +300
                }
                Image {
                    id: backgroundSlide1
                    source: "./images/1.png"
                    fillMode: Image.PreserveAspectCrop
                    anchors.fill: parent
                }
                MouseArea{
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked:   stackView.push(threePage)
                }
            }

            Rectangle{
                id:slide2Id
                width: 250
                height: 250
                color: slideColor
                radius: 15
                anchors{
                    top:slide1Id.bottom
                    topMargin: 20
                    left: slide1Id.left
                }
                Image {
                    id: backgroundSlide2
                    source: "./images/2.jpg"
                    fillMode: Image.PreserveAspectCrop
                    anchors.fill: parent
                }
                MouseArea{
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked:   console.log(3)
                }
            }

            Rectangle{
                id:slide3Id
                width: 250
                height: 250
                color: slideColor
                radius: 15
                anchors{
                    top:parent.top
                    topMargin: 210
                    left: slide1Id.right
                    leftMargin: 20
                }
                Image {
                    id: backgroundSlide3
                    source: "./images/3.jpg"
                    fillMode: Image.PreserveAspectCrop
                    anchors.fill: parent
                }
                MouseArea{
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked:   stackView.push(fourPage)
                }
            }

            Rectangle{
                id:slide4Id
                width: 250
                height: 250
                color: slideColor
                radius: 15
                anchors{
                    top:slide3Id.bottom
                    topMargin: 20
                    left: slide2Id.right
                    leftMargin: 20
                }
                Image {
                    id: backgroundSlide4
                    source: "./images/4.jpeg"
                    fillMode: Image.PreserveAspectCrop
                    anchors.fill: parent
                }
                MouseArea{
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked:   console.log("4")
                }
            }
        }
    }
    //three page
    Component {

        id: threePage
        Rectangle {
            property bool startStop: false

            id:page3Id
            width: parent.width
            height: parent.height
            anchors.fill: parent
            color: "#e5e5e5"
            Text {
                id: centerName
                text: qsTr("Check Impedance")
                font.family: "Arial"
                font.pointSize: 24
                font.bold:true
                color: "black"
                anchors{
                    top: page3Id.top
                    topMargin: 20
                    horizontalCenter: parent.horizontalCenter
                }
            }
            Rectangle{
                id:checkImpedance
                width: 640
                height: 550

                anchors.centerIn: parent

                Image {
                    id: eegEloecId
                    source: "./images/EEG_elec.png"
                    fillMode: Image.PreserveAspectCrop
                    anchors.centerIn: parent
                }
                Rectangle{
                    width: 500
                    height: 50
                    color: "red"
                    anchors{
                        top: eegEloecId.bottom
                        topMargin: 0
                        horizontalCenter: parent.horizontalCenter
                        verticalCenter: parent.verticalCenter
                    }
                    Row {
                        spacing: 4
                        anchors.horizontalCenter: parent.horizontalCenter
                        Button {
                            id:startStopId
                            width: 120
                            height: 40
                            background: Rectangle{
                                color: "gray"
                                radius: 10
                            }
                            // تنظیم رنگ متن
                            contentItem: Text {
                                text: !startStop? qsTr("Start") : qsTr("Stop")
                                color: "white" // رنگ متن
                                font.pixelSize: parent.font.pixelSize
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            onClicked: {
                                startStop = !startStop
                                console.log("hello world")
                            }
                        }

                        Button {
                            id:backId

                            width: 120
                            height: 40
                            background: Rectangle{
                                color: "gray"
                                radius: 10
                            }
                            // تنظیم رنگ متن
                            contentItem: Text {
                                text: qsTr("Back")
                                color: "white" // رنگ متن
                                font.pixelSize: parent.font.pixelSize
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            onClicked: stackView.push(secondPage)
                        }

                    }
                }

            }


        }

    }

    //four page
    Component {
        id: fourPage
        Rectangle {
            property var timeData: []
            property var freqData: []
            property bool startStopChart: false
            property bool freqShow: true
            id:page4Id
            width: parent.width
            height: parent.height
            anchors.fill: parent
            color: "#e5e5e5"

            Rectangle{
                id: headerId
                width: 500
                height: 50
                color: "#e5e5e5"
                anchors{
                    top:page4Id.top
                    horizontalCenter: page4Id.horizontalCenter
                    topMargin: 5
                }

                Row {
                    spacing: 4
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 500
                    Button {
                        id:startStopId
                        width: 120
                        height: 40
                        background: Rectangle{
                            color: "gray"
                            radius: 10
                        }
                        // تنظیم رنگ متن
                        contentItem: Text {
                            text: !startStopChart? qsTr("Start") : qsTr("Stop")
                            color: "white" // رنگ متن
                            font.pixelSize: parent.font.pixelSize
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        onClicked: {
                            if(!startStopChart){
                                eegProvider.start_record_signal()
                                startStopChart = !startStopChart
                            }
                            else{
                                eegProvider.stop_record_signal()
                                startStopChart = !startStopChart
                            }

                        }
                    }

                    Button {
                        id:saveDataId
                        width: 120
                        height: 40
                        background: Rectangle{
                            color: "gray"
                            radius: 10
                        }
                        // تنظیم رنگ متن
                        contentItem: Text {
                            text: qsTr("save")
                            color: "white" // رنگ متن
                            font.pixelSize: parent.font.pixelSize
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        onClicked: {
                            console.log("save data")
                        }
                    }

                    Button {
                        id:backId

                        width: 120
                        height: 40
                        background: Rectangle{
                            color: "gray"
                            radius: 10
                        }
                        // تنظیم رنگ متن
                        contentItem: Text {
                            text: qsTr("Back")
                            color: "white" // رنگ متن
                            font.pixelSize: parent.font.pixelSize
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        onClicked: stackView.push(secondPage)
                    }

                }
            }

            Flickable{
                id: flickable
                anchors{
                    top: headerId.bottom
                    topMargin: 5
                }
                width: parent.width
                height: parent.height + 300
                contentWidth: parent.width
                contentHeight: 21*330
                clip: true
                Column {
                    width: parent.width
                    spacing: 0
                    anchors{
                        top: headerId.bottom
                        topMargin: 10
                    }
                    Repeater{
                        model:21
                        ChartView{
                            id:chartView
                            width : flickable.width - 20
                            height : 300
                            legend.visible:true
                            antialiasing: true
                            //                            gesture.enabled:true

                            //backgroundColor:"gray"
                            ValueAxis{
                                id:xAxis
                                min:0
                                max:100
                                titleText:"Time (ms)"
                                visible:!freqShow
                            }
                            ValueAxis{
                                id:yAxis
                                min:-100
                                max:100
                                titleText:"Amplitude (uV)"
                                visible:!freqShow
                            }
                            LineSeries{
                                id:lineSeries
                                name:"Time Domain Channel " + (index + 1)
                                axisX:xAxis
                                axisY:yAxis
                                color:Qt.rgba(Math.random(),Math.random(),Math.random(),1)
                                visible: !freqShow
                            }

                            ValueAxis{
                                id:freqXAxis
                                min:0
                                max:100
                                titleText:"Frequency (hz)"
                                visible:freqShow
                            }
                            ValueAxis{
                                id:freqYAxis
                                min:0
                                max:2000
                                tickInterval:100
                                titleText:"Amplitude (uV)"
                                visible:freqShow
                            }
                            LineSeries{
                                id:lineSeriesFreq
                                name:"Freq Domain Channel " + (index + 1)
                                axisX:freqXAxis
                                axisY:freqYAxis
                                color:Qt.rgba(Math.random(),Math.random(),Math.random(),1)
                                visible: freqShow
                            }
                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    freqShow = !freqShow
                                }
                            }

                            Connections{
                                target: eegProvider
                                function onUpdateData(timeDataGet,freqDataGet) {
                                    if(freqShow){
                                        lineSeriesFreq.clear();
                                        for(var j=0;j< freqDataGet[index].length;j++){
                                            lineSeriesFreq.append(j,freqDataGet[index][j]);
                                        }

                                    }
                                    else{
                                        lineSeries.clear()
                                        for(var i=0;i<timeDataGet[index].length;i++){
                                            lineSeries.append(i,timeDataGet[index][i]);
                                        }
                                    }


                                }
                            }
                        }
                    }

                }

            }
        }
    }
}

