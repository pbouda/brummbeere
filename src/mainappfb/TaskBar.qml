import QtQuick 2.0

import "helpers.js" as Helpers

Rectangle {
    color: "black"

    Rectangle {
        id: buttonLeft
        color: "#ec3f8c"
        radius: 5
        width: 0
        height: parent.height
        Image {
            id: buttonImageLeft
            anchors.centerIn: parent
            height: parent.height
            fillMode: Image.PreserveAspectFit
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {

            }
        }
    }

    Rectangle {
        id: buttonMiddle
        property string icon: ""
        color: "#ec3f8c"
        radius: 5
        width: parent.width - (buttonLeft.width + buttonRight.width)
        anchors.left: buttonLeft.right
        height: parent.height

        Image {
            id: buttonImageMiddle
            source: buttonMiddle.icon
            anchors.centerIn: parent
            height: parent.height
            fillMode: Image.PreserveAspectFit
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                Helpers.currentMiddleAction();
            }
        }
    }

    Rectangle {
        id: buttonRight
        property alias image: buttonImageRight.source

        color: "#ec3f8c"
        radius: 5
        width: 0
        anchors.left: buttonMiddle.right
        height: parent.height

        Image {
            id: buttonImageRight
            anchors.centerIn: parent
            height: parent.height
            fillMode: Image.PreserveAspectFit
        }

        MouseArea {
            id: buttonMouseareaRight
            anchors.fill: parent
        }
    }

}

