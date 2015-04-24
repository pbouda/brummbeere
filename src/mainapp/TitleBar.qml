import QtQuick 2.0

import "helpers.js" as Helpers

Rectangle {
    color: "black"

    Rectangle {
        id: title
        color: "#1fd26a"
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: parent.width*4/5
        height: parent.height
        radius: 5

        Text {
            anchors.verticalCenter: parent.verticalCenter
            text: "  " + root.currentTitle
            font.pixelSize: parent.height*0.3
            font.family: "Open Sans,Arial,Helvetica,sans-serif"
        }
    }

    Rectangle {
        id: menuButton
        color: "black"
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: parent.width/5
        height: parent.height
        border.color: "white"
        border.width: root.menuActive ? 4 : 0

        radius: 5

        Text {
            text: "•••"
            color: "white"
            anchors.centerIn: parent
            font.pixelSize: parent.width*0.4
        }

        MouseArea {
            anchors.fill: parent
            onClicked: Helpers.toggleMenu()
        }
    }
}

