import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    property bool deviceStatus: true
    id:mainWindow
    visible: true
    width: 1000
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
                color: "#A6AEBF"

                Rectangle{
                    id:sideBarId
                    width: parent.width/6
                    height: parent.height
                    color: "#F1F0E8"

                    Rectangle{
                        width: 50
                        height: 50
                        color: "#F1F0E8"
                        anchors{
                            top: parent.top
                            topMargin: 20
                            horizontalCenter: parent.horizontalCenter
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

                    Button {
                        id:startAppButtonId
                        anchors{
                            bottom: sideBarId.bottom
                            bottomMargin: 10
                            horizontalCenter: sideBarId.horizontalCenter
                        }
                        width: 120
                        height: 40
                        background: Rectangle{
                            color: "gray"
                            radius: 10
                        }
                        // تنظیم رنگ متن
                         contentItem: Text {
                             text: qsTr("back")
                             color: "red" // رنگ متن
                             font.pixelSize: parent.font.pixelSize
                             horizontalAlignment: Text.AlignHCenter
                             verticalAlignment: Text.AlignVCenter
                         }
                        onClicked: stackView.pop()
                    }
                }






//                Rectangle{
//                    id:slide1Id
//                    width: parent.width/4
//                    height: parent.height/2
//                    color: "black"
//                    anchors{
//                        top:parent.top
//                        left: parent.left
//                        leftMargin: 30
//                        verticalCenter: parent
//                    }

//                    Image {
//                        anchors.fill: parent
//                        source: "./images/1.png" // مسیر عکس
//                        fillMode: Image.PreserveAspectCrop
//                    }
//                }

//                Rectangle{
//                    id:slide2Id
//                    width: parent.width/4
//                    height: parent.height/2
//                    color: "gray"
//                    anchors{
//                        top:parent.top
//                        left: slide1Id.right
//                    }

//                    Image {
//                        anchors.fill: parent
//                        source: "./images/3.jpg" // مسیر عکس
//                        fillMode: Image.PreserveAspectCrop
//                    }
//                }







            }

    }




}
