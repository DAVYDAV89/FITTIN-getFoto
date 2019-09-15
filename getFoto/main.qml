import QtQuick 2.5
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.2

ApplicationWindow {
    id: app
    visible: true
    width: 640
    height: 50
    title: qsTr("Image")
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width
    flags: Qt.Window | Qt.CustomizeWindowHint | Qt.WindowTitleHint | Qt.WindowCloseButtonHint | Qt.WindowSystemMenuHint | Qt.FramelessWindowHint
    x:360



    property alias appHeight: app.height

    Row {
        id: row
        width: 640
        height: 50
        anchors.fill: parent

        Button {
            width: 160
            height: 50
            Layout.fillWidth: true
            text: qsTr("Camera ON")
            Layout.fillHeight: true
            Layout.columnSpan: 1
            background: Rectangle {
                color: parent.down ? "#42f554" : "#f6f6f6"
                border.color: "#26282a"
                border.width: 2
            }

            onClicked: {
                camera.cameraON()
            }
        }

        Button {
            width: 160
            height: 50
            Layout.fillHeight: true
            text: qsTr("Camera OF")
            Layout.fillWidth: true
            Layout.columnSpan: 2
            background: Rectangle {
                color: parent.down ? "#e34514" : "#f6f6f6"
                border.color: "#26282a"
                border.width: 2
            }

            onClicked: {
                camera.cameraOF()
            }

        }

        Button {
            width: 160
            height: 50
            Layout.fillWidth: true
            text: qsTr("Save Image")
            Layout.fillHeight: true
            Layout.columnSpan: 3
            background: Rectangle {
                color: parent.down ? "#30e3ad" : "#f6f6f6"
                border.color: "#26282a"
                border.width: 2
            }

            onClicked: {
                camera.saveImage()
            }
        }

        Button {
            width: 160
            height: 50
            Layout.fillHeight: true
            text: qsTr("Close")
            Layout.fillWidth: true
            Layout.columnSpan: 4
            background: Rectangle {
                color: parent.down ? "#535454" : "#f6f6f6"
                border.color: "#26282a"
                border.width: 2
            }

            onClicked: {
                camera.cameraOF()
                app.close()
            }

        }
    }
}
