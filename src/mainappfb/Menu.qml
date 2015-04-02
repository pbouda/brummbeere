import QtQuick 2.0

import "helpers.js" as Helpers

ListView {
    model: MenuContent {}

    delegate: Rectangle {
        height: menu.height/6
        width: menu.width
        color: "black"

        Image {
            id: menuIcon
            anchors.leftMargin: menu.width*0.1
            anchors.verticalCenter: parent.verticalCenter
        }

        Text {
            id: menuText
            text: name
            anchors.left: menuIcon.right
            anchors.leftMargin: menu.width*0.1
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: menu.height/6*0.6
            color: "white"
        }

        Rectangle {
            width: parent.width
            height: 1
            color: "white"
            anchors.bottom: parent.bottom
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                Helpers.startAction(action, type);
            }
        }

    }
}
