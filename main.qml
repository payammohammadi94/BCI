import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    property color slideColor: "#092145"

    property bool deviceStatus: false
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
                    onClicked:   console.log("2")
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
                    onClicked:   console.log("3")
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
            id:page3Id
            width: parent.width
            height: parent.height
            anchors.fill: parent
            color: "gray"

            Rectangle{
                id:checkImpedance
                width: 736
                height: 631

                anchors.centerIn: parent

                Image {
                    id: backgroundSlide4
                    source: "./images/checkImpedance.png"
                    fillMode: Image.PreserveAspectCrop
                    anchors.centerIn: parent
                }
                Text {
                    id: centerName
                    text: qsTr("Check Impedance")
                    font.family: "Arial"
                    font.pointSize: 24
                    font.bold:true
                    color: "black"
                    anchors{
                        top: page3Id.top
                        topMargin: 0
                        left:  sideBarId.right
                        leftMargin: 50
                    }
                }
            }

            Rectangle{
                id:sideBarId
                width: 200
                height: parent.height
                color: "gray"
                Text {
                    id: ch1Id
                    text: qsTr("Impedance Ch1: ")
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold:true
                    color: "black"
                    anchors{
                        top: parent.top
                        topMargin: 30
                        left:parent.left
                        leftMargin: 10

                    }
                }
                Text {
                    id: ch2Id
                    text: qsTr("Impedance Ch2: ")
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold:true
                    color: "black"
                    anchors{
                        top: ch1Id.top
                        topMargin: 40
                        left:parent.left
                        leftMargin: 10

                    }
                }

                Text {
                    id: ch3Id
                    text: qsTr("Impedance Ch3: ")
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold:true
                    color: "black"
                    anchors{
                        top: ch2Id.top
                        topMargin: 40
                        left:parent.left
                        leftMargin: 10

                    }
                }

                Text {
                    id: ch4Id
                    text: qsTr("Impedance Ch4: ")
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold:true
                    color: "black"
                    anchors{
                        top: ch3Id.top
                        topMargin: 40
                        left:parent.left
                        leftMargin: 10

                    }
                }
                Text {
                    id: ch5Id
                    text: qsTr("Impedance Ch5: ")
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold:true
                    color: "black"
                    anchors{
                        top: ch4Id.top
                        topMargin: 40
                        left:parent.left
                        leftMargin: 10

                    }
                }

                Text {
                    id: ch6Id
                    text: qsTr("Impedance Ch6: ")
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold:true
                    color: "black"
                    anchors{
                        top: ch5Id.top
                        topMargin: 40
                        left:parent.left
                        leftMargin: 10

                    }
                }

                Text {
                    id: ch7Id
                    text: qsTr("Impedance Ch7: ")
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold:true
                    color: "black"
                    anchors{
                        top: ch6Id.top
                        topMargin: 40
                        left:parent.left
                        leftMargin: 10

                    }
                }

                Text {
                    id: ch8Id
                    text: qsTr("Impedance Ch8: ")
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold:true
                    color: "black"
                    anchors{
                        top: ch7Id.top
                        topMargin: 40
                        left:parent.left
                        leftMargin: 10

                    }
                }

                Text {
                    id: ch9Id
                    text: qsTr("Impedance Ch9: ")
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold:true
                    color: "black"
                    anchors{
                        top: ch8Id.top
                        topMargin: 40
                        left:parent.left
                        leftMargin: 10

                    }
                }

                Text {
                    id: ch10Id
                    text: qsTr("Impedance Ch10: ")
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold:true
                    color: "black"
                    anchors{
                        top: ch9Id.top
                        topMargin: 40
                        left:parent.left
                        leftMargin: 10

                    }
                }

                Text {
                    id: ch11Id
                    text: qsTr("Impedance Ch11: ")
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold:true
                    color: "black"
                    anchors{
                        top: ch10Id.top
                        topMargin: 40
                        left:parent.left
                        leftMargin: 10

                    }
                }
                Text {
                    id: ch12Id
                    text: qsTr("Impedance Ch12: ")
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold:true
                    color: "black"
                    anchors{
                        top: ch11Id.top
                        topMargin: 40
                        left:parent.left
                        leftMargin: 10

                    }
                }
                Text {
                    id: ch13Id
                    text: qsTr("Impedance Ch13: ")
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold:true
                    color: "black"
                    anchors{
                        top: ch12Id.top
                        topMargin: 40
                        left:parent.left
                        leftMargin: 10

                    }
                }

                Text {
                    id: ch14Id
                    text: qsTr("Impedance Ch14: ")
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold:true
                    color: "black"
                    anchors{
                        top: ch13Id.top
                        topMargin: 40
                        left:parent.left
                        leftMargin: 10

                    }
                }
                Text {
                    id: ch15Id
                    text: qsTr("Impedance Ch15: ")
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold:true
                    color: "black"
                    anchors{
                        top: ch14Id.top
                        topMargin: 40
                        left:parent.left
                        leftMargin: 10

                    }
                }
                Text {
                    id: ch16Id
                    text: qsTr("Impedance Ch16: ")
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold:true
                    color: "black"
                    anchors{
                        top: ch15Id.top
                        topMargin: 40
                        left:parent.left
                        leftMargin: 10

                    }
                }
                Text {
                    id: ch17Id
                    text: qsTr("Impedance Ch17: ")
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold:true
                    color: "black"
                    anchors{
                        top: ch16Id.top
                        topMargin: 40
                        left:parent.left
                        leftMargin: 10

                    }
                }
                Text {
                    id: ch18Id
                    text: qsTr("Impedance Ch18: ")
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold:true
                    color: "black"
                    anchors{
                        top: ch17Id.top
                        topMargin: 40
                        left:parent.left
                        leftMargin: 10

                    }
                }
                Text {
                    id: ch19Id
                    text: qsTr("Impedance Ch19: ")
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold:true
                    color: "black"
                    anchors{
                        top: ch18Id.top
                        topMargin: 40
                        left:parent.left
                        leftMargin: 10

                    }
                }
            }
        }

    }


}


